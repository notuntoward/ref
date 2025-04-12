---
created date: 2025-04-08T15:28:20-07:00
modified date: 2025-04-11T18:12:15-07:00
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
- [ ] full run over n-hours
- [ ] legit limits
	- [ ] inits from optimization of with mean forecasts
	- [ ] lims hard limits, like zeros, max price, solutions at extreme values
- [ ] comprehension of algorithms
	- [ ] what is k
	- [ ] logic for variance penalty
	- [ ] what kind of algorithm is running
- [ ] Whatever else is in the problem 
- [ ] Clean gunk out of code
- [ ] add tests (maybe delay until have final idea)
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
