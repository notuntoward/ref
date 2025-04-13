---
created date: 2025-04-08T15:28:20-07:00
modified date: 2025-04-12T22:09:26-07:00
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
- [gurobi not free, but it could have done quadratic](https://www.gurobi.com/solutions/licensing/)
- [ ] risk penalties [[Risk Reduction strategies]]
	- [How Does Risk Differ From Downside Risk?](https://www.investopedia.com/terms/d/downsiderisk.asp)
		- risk is is double sided variablity
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
		 - VaR: actually [[Work/Between Jobs/Interview Projects/Habitat Energy 2025/Risk Reduction strategies.md#**4. Practical Recommendations** |avoid VaR]]
	 - configuring multiple loss function in pyomo
		 - [[Switchable Multiple Loss Functions in Pyomo no if-else]]
	
- [ ] optuna hyperparm opt for params, once have real forecasts, prices
- [ ] would expect better RT forecasts, as delivery time approaches, but can't compute that here.
## Future
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
