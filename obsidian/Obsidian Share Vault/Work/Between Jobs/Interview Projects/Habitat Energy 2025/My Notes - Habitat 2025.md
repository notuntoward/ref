---
created date: 2025-04-08T15:28:20-07:00
modified date: 2025-04-17T10:02:14-07:00
---
# Definitions
## ERCOT
Use ERCOT definitions, although the description doesn't say so
- [Wind is considered a generator](https://www.perplexity.ai/search/in-ercot-explain-the-terms-bid-e26vrdh4ST2ejby9p5MzbA#1)
- Bid: 
	- price/quantity you'd pay to buy or sell energy
	- both DAM and RTM
- Offer: usually the price/quantity a generator is willing to supply energy or ancillary services
# The problem
- output: a single bid and offer price and quantity pair (PQ pair) for each hour
- should 
	- consider relationship between DA/RT price spreads across the day 
	- identify opportunities for arbitrage and risk management
# Problem statement problems
- seems to have flipped the bid and offer clearing conditions
- the revenue calcs are normal, though
- if put a do_as_stated boolean into the revenue calculator
# Points to make & TODOs
## Get in the bag first
- [x] full run over n-hours
- [x] legit limits
	- [x] inits from optimization of with mean forecasts
	- [x] lims hard limits, like zeros, max price, solutions at extreme values
- [ ] comprehension of algorithms
	- [x] what is k (clear smoother: I renamed it)
	- [x] logic for variance penalty
	- [ ] what kind of algorithm is running
- [x] high wind power assoc. with neg. RT price? (according to forecasts)
	- answer (yes)
	- @ justifies hedging on DA, when you'd be forced to pay for wind power instead of profit from it.
- [ ] Instead of variance penalty, compute VAR or expected revenues < 0
	- This is [semi-deviation](<Work/Between Jobs/Interview Projects/Habitat Energy 2025/My Notes - Habitat 2025.md#^92yr >)
- [ ] Clean gunk out of code
- [ ] add tests (maybe delay until have final idea)
- [x] Does my code do 2-stage stochastic convex optimization?
	- Yes: [[My code does non-linear, two-stage convex stochastic optimization]]
		- **stochastic** b/c of scenarios
		- **convex**
			- The risk penalty terms (variance or semi-deviation) are **quadratic convex functions**
			-  Variable bounds (e.g., `da_offer_vol ≥ 0`) define a convex domain.
			- Linear/quadratic constraints preserve convexity
		- **nonlinear**
			- clearing probs
			- risk penalties
		- t**wo-stage**: [[My code does non-linear, two-stage convex stochastic optimization#Two-Stage Structure Explained|Two-Stage Structure Explained]]
			- stage 1: bids/offers
			- stage 2: revenue calcs
	- Ipopt solver is designed for **nonlinear convex optimization**
- [gurobi not free, but it could have done quadratic](https://www.gurobi.com/solutions/licensing/)
- [ ] risk penalties [[Risk Reduction strategies]]
	- [How Does Risk Differ From Downside Risk?](https://www.investopedia.com/terms/d/downsiderisk.asp)
		- risk is is double sided variability
		- 
			- up and down
			- corelated with level of return, in general
		- downside risk is just the risk of loss
			- kind of a worst case
			- you'd miss the giant prices, but then you'd miss the giant losses too (ERCOT)
	- risk penalty options
		- plain risk
		- variance: dumb, double sided, not sensitive to downside
		- downside risk
			- Value at Risk (VaR)
				- Estimates the maximum loss over (something, not sure what) at a confidence level (e.g., 95%).
				- **Calculation a pain**: not coherent (fails subadditivity) and can be computationally challenging for non-normal distributions[^1][^3][^8].
			- Expectiles
				- **What they do**: Generalize quantiles by minimizing asymmetric least squares. They directly model tail risk and are coherent[^4][^6][^10].
					- **Need to get QR into pyomo**:
						For a confidence level $\tau$ (e.g., $\tau = 0.05$), compute the expectile $\mu_\tau$ that satisfies:
					$$
					\tau \cdot \mathbb{E}[\max(\text{Revenue} - \mu_\tau, 0)] = (1 - \tau) \cdot \mathbb{E}[\max(\mu_\tau - \text{Revenue}, 0)]
					$$
						- This can be solved via quantile regression or Newton-Raphson methods[^4][^11].
						- looks messy and I don't quite get it: [[QR for Expectiles in pyomo]]
					- **Penalty**: Use the expectile loss as the risk penalty. Expectiles are easier to optimize than VaR and avoid non-convexity[^10][^11].
			- Semi-deviation ^92yr
				- **What it does**: Measures volatility of negative returns (simple and intuitive)[^7][^12].
				-  Compute the standard deviation of negative revenues.
				- **Calculation**:
				$$
				\text{Semi-Deviation} = \sqrt{\frac{1}{N} \sum_{i=1}^N (\min(\text{Revenue}_i - \bar{\text{Revenue}}, 0))^2}
				$$
					- Focus on revenues below zero (losses)
				- **Penalty**: Directly penalize this metric.
	
	 - Recommended development order
		 - semi-deviation
		 - expectiles
		 - VaR: actually [[Risk Reduction strategies#**4. Practical Recommendations**|avoid VaR]]
	 - configuring multiple loss function in pyomo
		 - [[Switchable Multiple Loss Functions in Pyomo no if-else]]
	
- [ ] optuna hyperparm opt for params, once have real forecasts, prices
- [ ] would expect better RT forecasts, as delivery time approaches, but can't compute that here.
- [ ] setting optimizations once over the 24 hour period instead of for every hour
	- normally, might make sense b/c hard to get timing right of huge price spices, but this would give general awareness to all hours that one might be coming.
	- a little pointless in this case b/c no actual prices, etc. to see if it works.
	- [ ] ? adds yet another tunable param, b/c I gave it a multiplier.  Does that make sense, though?  If price forecasts are right?
	- [ ] Mention that scenarios can be used inside the optimization because they're small because there's no storage and they should be used because they're correlated according to the problem statement and therefore quantiles by themselves aren't adequate.
	- [ ] 
## Weakesses
- [[Limitations IPopt with Pyomo]]
	- limitations are really with IPOPT solver
	- ipopt not good at poorly scaled problems
		- common in stochastic programs due to disparate parameter magnitudes across scenarios (I have this)
			- [x] DO I see the indicator of this:  "Search Direction is becoming Too Small"?
				- try [[pyomo tee=True]] with [print\_level\=5](<My Ipopt Solver Options Explained.md#^h1gd>)
					- didn't see problems
		- [x] `u_strategy=adaptive`: said to be good for poorly scaled
	- IPOPT prioritizes optimality conditions over returning the "best" feasible solution, which can leave users without actionable results
	- [[Limitations IPopt with Pyomo#Mixed-Integer Optimization|Mixed-Integer Optimization]] not done by ipopt, 
		- can nonconvex problems
		- cannot do non-smooth
## Future
- [ ] could have optimized over many random forecast scenarios, but that stationarity is unrealistic
	- and in any case, can't tune to minimize the loss due to forecast errors without the real prices
		- yak shaving: since can assume forecasts are well calibrated, could do something like doing many tuning over many single realizations considered to be the "trutn"
	- side note: contextual optimization for tuning forecasts (and optimization?)
		- assuming that forecasts come from a model that can be trained with something like backprop, so gradients are followable
			- unlike boosted models like LGBM, which are currently the best for this type of forecasting (include reference?)
- [ ] points in over Perplex and AI statements
- [ ] ask them what they would do in addition
- could increase risk penalty vs. horizon
	- [ ] Do scenarios spread over time?
		- [x] Wind power generation doesn't: look at Gaussian fit, compute variance, see if it increases
		- [ ] look @ prices
	- [ ] true that this risk penalty should increase if forecast variances don't?
		- seems clear if forecast variances don't increase
		- error certainly does increase, so increased *perceived* risk aversion makes sense
- [ ] calc bounds empirically from entire forecast scenarios
- [ ] use Johnson distribution of profit scenarios at a given decsions to extrapolate risk of extreme loss?
- [ ] boundaries or at least inits from historical real data?
- [ ] make a literal "package"?
- [ ] more error checking, docs (wait until finished)
- [ ] logging?  (wait until finished)
- [ ] Better optimization
	- [ ] What aren't people doing in stochastic optimization
	- My fascination with [[Contextual Optimization]]
	- [ ] What are people doing with scenario tree reduction these days?
# Why is Deterministic Better?
## Quick Lit Search
Links found by Perplexity: [[Prob Forecast Use Virtual Bidding]]

- [ ] [[Maciejowska19DayAheadVsIntraday|Maciejowska19: Day-Ahead vs. Intraday—Forecasting the Price Spread to Maximize Economic Benefits]] 
	- referenced lot, I thought
- [ ] [[Backus24probFrcstSTtradeOpt|Backus24: Probabilistic price forecasts for short-term trade optimization]] 
	- easy
- [ ] [[Merrick22sharpeVolatElekMktVirtTrade|Merrick22: Using volatility forecasts to reduce risk and increase returns]] 
	- easy
- [ ] [[Fang23elecMktvirtBidBrownian|Fang23: Electricity Virtual Bidding Strategy Via Entropy-Regularized Stochastic Control Method]] 
	- simple spread based
- [ ] [[Li22mlVirtBidElecMktEfficiency|Li22: Machine Learning-Driven Virtual Bidding With Electricity Market Efficiency Analysis]] 
	- spread based
- [ ] [[Wang24dpElecMktPriceFrcstVirtBid|Wang24: Deep learning-based electricity price forecast for virtual bidding in wholesale electricity market]] 
	- mostly price frcst, but best strategy is trade on peak hour!
- [ ] [[Gao20lelecMktProbFrcstStochProg|Gao20: Making money in energy markets: Probabilistic forecasting and stochastic programming paradigms]] 
	- sampling strategy
- [ ] [[Mones23stochOptConvergBid|Mones23: A general stochastic optimization framework for convergence bidding]] 
	- seems relevant
- [ ] [[Laws23priceGenElecMktBidEval|Laws23: Stochastic price generation for evaluating wholesale electricity market bidding strategies]] 
	- probably good but a lot about SDEs