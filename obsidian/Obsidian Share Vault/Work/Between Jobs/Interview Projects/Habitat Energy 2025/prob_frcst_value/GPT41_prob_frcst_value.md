---
created date: 2025-04-16T16:25:02-07:00
modified date: 2025-04-16T16:25:02-07:00
---
<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

## Probabilistic Models for Virtual Bidding Revenue in Day-Ahead Electricity Markets

Virtual bidding in electricity markets exploits the spread between day-ahead (DA) and real-time (RT) clearing prices. The mathematical optimization of virtual bids critically depends on the quality and type of price forecasts—deterministic (point) or probabilistic (scenario-based). Here, we summarize recent research and models that address the outcome revenue of virtual bidding, focusing on mathematical optimization and the comparative benefits of probabilistic versus deterministic forecasts.

---

## Modeling the Spread: Probabilistic Approaches

**Key Probabilistic Models:**

- **Stochastic Process Models:**
The spread between DA and RT prices can be modeled as a stochastic process, such as Brownian motion with drift, where the price difference is treated as a random variable with parameters estimated from historical data[^2]. These models allow for scenario generation and risk quantification, which are directly useful for stochastic optimization of virtual bids.
- **Scenario-Based Optimization:**
Probabilistic forecasts provide a set of possible future price scenarios, each with an associated probability. These scenarios can be input into two-stage or multi-stage stochastic optimization models, where the first stage determines the DA bid and the second stage evaluates the realized RT price[^1][^5]. The optimization objective is typically to maximize expected profit or a risk-adjusted metric (e.g., mean-variance, CVaR).
- **Deep Generative Models:**
Advanced machine learning models, such as normalizing flows and deep neural networks, generate full-day scenario forecasts of DA and/or RT prices, capturing non-Gaussian distributions and temporal correlations[^8]. These scenario forecasts can be directly used in stochastic optimization frameworks for virtual bidding.

---

## Deterministic vs. Probabilistic Forecasts: Impact on Mathematical Optimization

**Deterministic Forecasts:**

- Use a single predicted value (e.g., mean or median) for DA and RT prices.
- Optimization reduces to a linear or mixed-integer program, maximizing profit based on the expected spread.
- Ignores uncertainty and risk, which can lead to suboptimal or risk-prone bidding strategies, especially in volatile markets[^5].

**Probabilistic Forecasts:**

- Provide a distribution or set of scenarios for the DA/RT price spread.
- Enable stochastic or robust optimization, where decisions are made to maximize expected profit while managing risk (variance, CVaR, or worst-case outcomes)[^1][^2][^5].
- Allow explicit modeling of risk preferences and constraints, leading to more robust and often higher long-term profits, especially under high volatility or uncertainty[^1][^2][^5][^8].


### Comparative Benefits for Optimization

| Aspect | Deterministic Forecasts | Probabilistic Forecasts |
| :-- | :-- | :-- |
| Input to Optimization | Single scenario (point estimate) | Multiple scenarios (with probabilities) |
| Risk Management | Limited (mean only) | Explicit (variance, CVaR, etc.) |
| Solution Robustness | Lower, sensitive to forecast error | Higher, accounts for uncertainty |
| Computational Complexity | Lower | Higher |
| Expected Profit (in practice) | Lower, especially in volatile markets | Higher, due to better risk management |
| Suitability for Virtual Bidding | Adequate if spread is stable | Strongly preferred in volatile/uncertain spreads |

---

## Empirical Evidence and Case Studies

- **Stochastic Optimization Outperforms Deterministic:**
Studies using scenario-based stochastic optimization for virtual bidding consistently show higher profits and lower risk compared to deterministic approaches, especially when the price spread is volatile[^1][^2][^5][^7]. For example, backtesting in ERCOT and other markets demonstrates that strategies using probabilistic forecasts (e.g., scenario-based or mean-variance models) outperform those relying solely on point forecasts[^1][^2][^7].
- **Robust Optimization:**
Robust optimization models, which hedge against worst-case scenarios within a defined uncertainty set, provide additional risk protection and can be formulated as mixed-integer linear programs for practical implementation[^5].
- **Scenario Generation Quality Matters:**
The quality of probabilistic scenarios (e.g., capturing heavy tails, temporal correlation) directly affects optimization outcomes. Advanced scenario generation (deep generative models, normalizing flows) leads to more realistic and profitable strategies[^8].

---

## Conclusion

For virtual bidding strategies in day-ahead electricity markets, where the objective is to profit from the spread between DA and RT prices and there are no imbalance fees, **probabilistic models provide a clear mathematical advantage over deterministic forecasts**. They enable the use of stochastic and robust optimization techniques, which explicitly account for uncertainty and risk, resulting in more robust, profitable, and risk-aware bidding strategies. This advantage is particularly pronounced in markets with high price volatility or non-Gaussian price spread distributions[^1][^2][^5][^8].

**References to Key Studies:**

- Scenario-based stochastic optimization and empirical profit comparisons:[^1][^2][^5][^7][^8]
- Robust optimization for virtual bidding:[^5]
- Deep generative models for scenario generation:[^8]
- Backtesting and trading strategy performance:[^7]

These approaches are directly applicable to your application of virtual bidding, assuming access to well-calibrated probabilistic and deterministic forecasts.

<div style="text-align: center">⁂</div>

[^1]: https://www.nrel.gov/docs/fy23osti/82005.pdf

[^2]: https://arxiv.org/pdf/2303.02303.pdf

[^3]: https://lmpmarketdesign.com/papers/Hogan_Virtual_Bidding_052516.pdf

[^4]: https://dowlinglab.nd.edu/assets/447119/2020_making_money_in_energy_markets.pdf

[^5]: https://scholarsmine.mst.edu/cgi/viewcontent.cgi?article=5472\&context=ele_comeng_facwork

[^6]: https://www.caiso.com/documents/presentationforwesterneimbodyofstateregulators-benefitofvirtualbids-oct262020.pdf

[^7]: https://arxiv.org/html/2412.00062v1

[^8]: https://arxiv.org/html/2311.14033v2

[^9]: https://ceepr.mit.edu/wp-content/uploads/2021/09/2017-003.pdf

[^10]: https://mst.elsevierpure.com/files/40375647/Forecasting Nodal Price Difference between Day-Ahead and Real-Tim.pdf

[^11]: https://www.sciencedirect.com/science/article/pii/S0960148124016859

[^12]: https://www.sciencedirect.com/science/article/abs/pii/S0040162524006449

[^13]: https://orbit.dtu.dk/files/122899287/prob_elmarkets.pdf

[^14]: https://www.nber.org/system/files/working_papers/w27262/w27262.pdf

[^15]: https://www.mdpi.com/2071-1050/9/11/1990

[^16]: https://www.sciencedirect.com/science/article/abs/pii/S0306261921015555

[^17]: https://optimization-online.org/wp-content/uploads/2015/10/5180.pdf

[^18]: https://www.nrel.gov/docs/fy23osti/84782.pdf

[^19]: https://www.sciencedirect.com/science/article/pii/S0140988320301584

[^20]: https://arxiv.org/html/2501.13324v1

[^21]: https://www.sciencedirect.com/science/article/abs/pii/S104061901630063X

[^22]: https://papers.ssrn.com/sol3/Delivery.cfm/5192938.pdf?abstractid=5192938\&mirid=1

[^23]: https://stakeholdercenter.caiso.com/initiativedocuments/revisedfinalproposal-day-aheadmarketenhancements.pdf

[^24]: https://www.purdue.edu/discoverypark/sufg/docs/publications/Juan Giraldo Dissertation.pdf

[^25]: https://papers.ssrn.com/sol3/Delivery.cfm/SSRN_ID2050945_code1592187.pdf?abstractid=2050945\&mirid=1

[^26]: https://openaccess.nhh.no/nhh-xmlui/bitstream/handle/11250/3112109/0124.pdf?sequence=5\&isAllowed=y

