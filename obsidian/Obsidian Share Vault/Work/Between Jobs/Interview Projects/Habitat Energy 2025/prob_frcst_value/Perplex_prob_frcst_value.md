---
created date: 2025-04-16T16:19:49-07:00
modified date: 2025-04-16T16:19:49-07:00
---
<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# Find probabilistic models of  the outcome revenue of bids and offers on a day ahead  electricity market, where there are forecasts of day ahead and realtime clearing prices.  I am particularly interested in studies comparing deterministic and probabilistic forecasts.  I am not interested in what human insight might be provided.  I only want to know about the benefits to mathematical optimization.  I am also not interested in studies considering storage or generation.  My application is virtual bidding, without any imbalance fees.  So the  important factor is  the spread between day ahead and realtime prices.

I am also not interested in how probabilistic forecasts are made.  I have probabilistic scenario forecasts and I have deterministic forecasts, and both are well-calibrated.  Assume that both forecast types are state-of-the-art, and not simple methods like deterministic persistence forecasts.

Probabilistic forecasts provide significant benefits for the mathematical optimization of virtual bidding strategies in day-ahead electricity markets by enabling the use of stochastic optimization techniques[^4][^6]. Unlike deterministic forecasts that provide a single point estimate, probabilistic forecasts, often represented as multiple scenarios or a probability distribution, quantify the uncertainty surrounding future day-ahead and real-time price spreads[^2][^6].

The primary advantages of using probabilistic forecasts for optimizing virtual bids include:

* **Explicit Modeling of Uncertainty:** Stochastic optimization models directly incorporate the uncertainty captured in probabilistic forecasts[^2][^4]. This allows the optimization process to consider the full range of potential price spreads and their likelihoods, rather than relying on a single predicted value[^6].
* **Improved Decision-Making Under Uncertainty:** By evaluating potential outcomes across various scenarios, stochastic optimization can identify bidding strategies that are more robust or offer higher expected profits when considering the variability and risk in the price spread[^2][^6]. Considering the full probability distribution can lead to different optimal bids compared to using only an expected value, potentially increasing profitability[^6].
* **Capturing Complex Price Dynamics:** Probabilistic models, particularly multivariate scenario generation methods, can capture intricate statistical properties of electricity prices, such as heavy tails, non-Gaussian distributions, and correlations between different hours of the day[^2]. Optimization algorithms can leverage this richer information, which is often missed by single-point deterministic forecasts[^2].
* **Risk Assessment:** Probabilistic forecasts allow the optimization framework to assess the risk associated with different bidding strategies, for instance, by optimizing objectives that include risk measures like Conditional Value at Risk (CVaR)[^4].

While some studies directly comparing probabilistic and deterministic forecast value focus on generation assets, the underlying principle applies to virtual bidding[^5][^6]. The ability of probabilistic forecasts to provide a comprehensive view of potential market outcomes allows mathematical optimization algorithms to find strategies that better navigate the inherent uncertainty in the spread between day-ahead and real-time prices, aiming for improved financial performance compared to strategies based solely on deterministic predictions[^2][^6]. Research indicates that probabilistic forecasts enable the generation of high-quality scenarios that enhance planning under uncertainty[^2].

<div style="text-align: center">⁂</div>

[^1]: https://dowlinglab.nd.edu/assets/447119/2020_making_money_in_energy_markets.pdf

[^2]: https://arxiv.org/html/2311.14033v2

[^3]: https://papers.ssrn.com/sol3/Delivery.cfm/5192938.pdf?abstractid=5192938\&mirid=1

[^4]: https://www.nrel.gov/docs/fy23osti/82005.pdf

[^5]: https://orbit.dtu.dk/files/379155630/1-s2.0-S0960148124016859-main.pdf

[^6]: https://www.imse.iastate.edu/files/2016/01/Guo-and-MacKenzie-Optimal-Bidding-Strategy-for-GENCO-with-Green-Power-in-Day-ahead-Electricity-Market-working-paper.pdf

[^7]: https://pubsonline.informs.org/doi/10.1287/msom.2021.0555

[^8]: https://orbit.dtu.dk/files/122899287/prob_elmarkets.pdf

[^9]: https://hepg.hks.harvard.edu/publications/virtual-bidding-and-electricity-market-design

[^10]: https://www.sciencedirect.com/science/article/abs/pii/S0040162524006449

[^11]: https://www.sciencedirect.com/science/article/pii/S0960148124016859

[^12]: https://www.raaey.gr/energeia/wp-content/uploads/2021/05/Report-II-ProbabilisticDimensioning-final.pdf

[^13]: https://www.osti.gov/servlets/purl/1782068

[^14]: https://www.sciencedirect.com/science/article/pii/S2589004222020776

[^15]: https://www.mdpi.com/2071-1050/9/11/1990

[^16]: https://www.mdpi.com/2673-4826/2/1/2

[^17]: https://arxiv.org/pdf/2008.08004.pdf

[^18]: https://www.sciencedirect.com/science/article/pii/S0306261923002118

[^19]: https://www.mdpi.com/1996-1073/10/4/450

