---
created date: 2025-04-16T16:21:07-07:00
modified date: 2025-04-16T16:21:07-07:00
---
<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# Find probabilistic models of  the outcome revenue of bids and offers on a day ahead  electricity market, where there are forecasts of day ahead and realtime clearing prices.  I am particularly interested in studies comparing deterministic and probabilistic forecasts.  I am not interested in what human insight might be provided.  I only want to know about the benefits to mathematical optimization.  I am also not interested in studies considering storage or generation.  My application is virtual bidding, without any imbalance fees.  So the  important factor is  the spread between day ahead and realtime prices.

I am also not interested in how probabilistic forecasts are made.  I have probabilistic scenario forecasts and I have deterministic forecasts, and both are well-calibrated.  Assume that both forecast types are state-of-the-art, and not simple methods like deterministic persistence forecasts.

Probabilistic models representing the uncertainty in day-ahead and real-time electricity prices, or specifically the spread between them, are utilized within stochastic optimization frameworks to determine optimal virtual bidding strategies[^2]. These frameworks aim to maximize financial objectives, such as expected profit or utility, potentially incorporating risk measures like Conditional Value at Risk (CVaR)[^1][^2][^4].

## Use in Mathematical Optimization

The core of these approaches involves using a representation of the joint probability distribution of day-ahead (DA) and real-time (RT) prices, or the DA price and the DA-RT price spread (delta price), as input[^2]. This probabilistic information, often derived from scenario forecasts or predictive models, captures the uncertainty inherent in future market prices[^1][^2].

Stochastic optimization models use this probabilistic input to formulate the bidding problem. For virtual bidding, the model seeks optimal bid curves, determining both the prices and volumes to bid (supply/increment or demand/decrement) in the day-ahead market to capitalize on expected price differences[^2]. These models can be complex, potentially involving mixed-integer programming, but computationally tractable formulations, such as linear programming-based models, have been developed[^2].

## Benefits of Probabilistic vs. Deterministic Forecasts for Optimization

The primary benefit of using probabilistic forecasts over deterministic ones in mathematical optimization for virtual bidding lies in the explicit incorporation of uncertainty:

* **Capturing Full Uncertainty:** Probabilistic forecasts (as distributions or scenarios) provide a richer picture of potential future price outcomes compared to a single point estimate from a deterministic forecast[^1][^2][^4]. Stochastic optimization leverages this full range of possibilities and their likelihoods[^2][^4].
* **Improved Decision-Making:** By considering the potential variability and risk associated with price spreads, stochastic optimization can lead to bidding strategies that yield higher expected profits or better risk profiles compared to strategies based solely on deterministic forecasts[^2][^4]. For instance, a strategy optimized using only the expected spread might differ significantly, and be less profitable, than one optimized considering the entire probability distribution of spreads[^4].
* **Risk Management:** Stochastic optimization allows for the explicit inclusion of risk preferences, such as minimizing the probability of losses or managing Conditional Value at Risk (CVaR), using the probabilistic price information[^1][^2].
* **Optimizing Bid Curves:** Frameworks using probabilistic inputs can simultaneously optimize both bid prices and volumes, constructing potentially complex bid curves rather than relying on fixed prices or quantities[^2].

Studies demonstrate the value of these approaches by comparing the financial performance of strategies derived from stochastic optimization using probabilistic inputs against simpler methods or those relying on deterministic forecasts, often showing superior results for the probabilistic approach[^1][^2][^4].

<div style="text-align: center">⁂</div>

[^1]: https://www.nrel.gov/docs/fy23osti/82005.pdf

[^2]: https://arxiv.org/pdf/2210.06543.pdf

[^3]: https://dowlinglab.nd.edu/assets/447119/2020_making_money_in_energy_markets.pdf

[^4]: https://www.imse.iastate.edu/files/2016/01/Guo-and-MacKenzie-Optimal-Bidding-Strategy-for-GENCO-with-Green-Power-in-Day-ahead-Electricity-Market-working-paper.pdf

[^5]: https://auetd.auburn.edu/bitstream/handle/10415/1478/Yucekaya_Ahmet_6.pdf?sequence=1\&isAllowed=y

[^6]: https://orbit.dtu.dk/files/122899287/prob_elmarkets.pdf

[^7]: https://www.sciencedirect.com/science/article/abs/pii/S0040162524006449

[^8]: https://www.sciencedirect.com/science/article/pii/S0960148124016859

[^9]: https://www.osti.gov/servlets/purl/1782068

[^10]: https://scholarsmine.mst.edu/cgi/viewcontent.cgi?article=5574\&context=ele_comeng_facwork

[^11]: https://www.mdpi.com/1996-1073/12/4/631

[^12]: https://www.sciencedirect.com/science/article/pii/S0142061524004216

[^13]: https://arxiv.org/pdf/2407.07795.pdf

[^14]: https://papers.ssrn.com/sol3/Delivery.cfm/5192938.pdf?abstractid=5192938\&mirid=1\&type=2

[^15]: https://journals.sagepub.com/doi/10.5547/01956574.45.3.shir

