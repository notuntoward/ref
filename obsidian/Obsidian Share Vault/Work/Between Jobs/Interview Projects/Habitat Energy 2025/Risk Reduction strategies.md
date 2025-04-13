---
created date: 2025-04-12T21:10:30-07:00
modified date: 2025-04-12T22:07:29-07:00
---
<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>
From: [I would like to do virtual tra...](https://www.perplexity.ai/search/i-would-like-to-do-virtual-tra-3C63vWjrSWCwp2u.0e1MPA#0)

# I would like to do virtual trading on an energy market, I want to optimize my bidding for expected revenue, but I want to also add a penalty the the expected revenue term which specifically penalizes the risk of losing money on any 24 hour period.

My inputs are stochasitic time series for day ahead and realtime prices, as well as the amount of wind generation I have inhouse will put on the market.  From this, I can calculate the expected revenue for each scenario sample of these values, given a candidate market decision.

How can I limit the down-side?  Is this related to 'value at risk' or expectiles?  Is there another easy-to-compute penalty I could compute from the candidate market decisions

To optimize your energy market bidding strategy while penalizing daily downside risk, you can integrate risk measures like **Value at Risk (VaR)** or **expectiles** into your objective function. Here's a structured approach:

---

### **1. Core Framework for Risk-Adjusted Optimization**

Your objective function should balance expected revenue with a penalty for downside risk:

$$
\text{Objective} = \text{Expected Revenue} - \lambda \cdot \text{Risk Penalty}
$$

where $\lambda$ is a risk-aversion parameter you tune.

---

### **2. Risk Measures for Downside Penalization**

#### **a. Value at Risk (VaR)**

- **What it does**: Estimates the maximum loss over 24 hours at a confidence level (e.g., 95%).
- **Calculation**:
For each candidate bidding decision, compute the $\alpha$-quantile of negative revenues (losses) across scenarios. For example, 5% VaR is the 5th percentile of losses.
- **Penalty**: Penalize revenues below this threshold.
- **Limitations**: VaR is not coherent (fails subadditivity) and can be computationally challenging for non-normal distributions[^1][^3][^8].


#### **b. Expectiles**

- **What they do**: Generalize quantiles by minimizing asymmetric least squares. They directly model tail risk and are coherent[^4][^6][^10].
- **Calculation**:
For a confidence level $\tau$ (e.g., $\tau = 0.05$), compute the expectile $\mu_\tau$ that satisfies:

$$
\tau \cdot \mathbb{E}[\max(\text{Revenue} - \mu_\tau, 0)] = (1 - \tau) \cdot \mathbb{E}[\max(\mu_\tau - \text{Revenue}, 0)]
$$

This can be solved via quantile regression or Newton-Raphson methods[^4][^11].
- **Penalty**: Use the expectile loss as the risk penalty. Expectiles are easier to optimize than VaR and avoid non-convexity[^10][^11].


#### **c. Semi-Deviation**

- **What it does**: Measures volatility of negative returns (simple and intuitive)[^7][^12].
- **Calculation**:

$$
\text{Semi-Deviation} = \sqrt{\frac{1}{N} \sum_{i=1}^N (\min(\text{Revenue}_i - \bar{\text{Revenue}}, 0))^2}
$$

Focus on revenues below zero (losses).
- **Penalty**: Directly penalize this metric.

---

### **3. Implementation Steps**

1. **Generate Scenarios**:
Use stochastic models for day-ahead/realtime prices and wind generation to simulate revenue for each bidding decision.
2. **Compute Expected Revenue**:

$$
\text{Expected Revenue} = \frac{1}{N} \sum_{i=1}^N \text{Revenue}_i
$$
3. **Calculate Risk Penalty**:
    - For **VaR**: Identify the $\alpha$-quantile of losses and penalize revenues below it.
    - For **expectiles**: Solve for $\mu_\tau$ and penalize asymmetric squared deviations[^4][^11].
    - For **semi-deviation**: Compute the standard deviation of negative revenues.
4. **Optimize**:
Use gradient-based optimization or stochastic programming to maximize the risk-adjusted objective.

---

### **4. Practical Recommendations**

- **Start with semi-deviation**: Easy to compute and interpret[^12].
- **Upgrade to expectiles**: Better theoretical properties (coherence) and compatibility with regression-based optimization[^4][^10].
- **Avoid raw VaR**: Non-convexity and incoherence make it harder to optimize[^1][^8].

---

### **Example Code Snippet (Python)**

```python
import numpy as np
from scipy.optimize import minimize

# Simulated revenues for a candidate bidding decision (negative values = losses)
revenues = np.random.normal(5000, 3000, 1000)  # 1000 scenarios

# Expected revenue
expected_revenue = np.mean(revenues)

# Semi-deviation penalty
losses = revenues[revenues &lt; 0]
semi_deviation = np.sqrt(np.mean(losses**2)) if len(losses) &gt; 0 else 0

# Objective function with λ = 0.1
def objective(bid_params):
    # ... compute revenues for bid_params ...
    return -expected_revenue + 0.1 * semi_deviation

result = minimize(objective, x0=initial_bid, method='SLSQP')
```

---

### **Key Takeaways**

- Use **expectiles** or **semi-deviation** for coherent, tractable risk penalization.
- VaR is less ideal due to non-convexity.
- Test multiple $\lambda$ values to balance risk and reward.

For energy-specific applications, integrate this with ETRM systems that support VaR/expectile calculations[^9].

<div>⁂</div>

[^1]: https://www.investopedia.com/terms/v/var.asp

[^2]: https://www.energyknowledgebase.com/topics/value-at-risk-var.asp

[^3]: https://www.strike.money/stock-market/value-at-risk

[^4]: https://users.ox.ac.uk/~mast0315/ExpectilesVaR\&ES.pdf

[^5]: https://www.linkedin.com/pulse/navigating-risks-unhedged-positions-energy-trading-hugo-stappers-92are

[^6]: https://www.usafa.edu/app/uploads/usafawp2022-01.pdf

[^7]: https://thetradinganalyst.com/downside-risk/

[^8]: https://www.rba.gov.au/publications/rdp/1997/pdf/rdp9708.pdf

[^9]: https://www.pcienergysolutions.com/2024/05/15/understanding-the-strategic-role-of-value-at-risk-modeling-in-etrm-solutions/

[^10]: https://onlinelibrary.wiley.com/doi/abs/10.1002/ijfe.2902

[^11]: https://www.tse-fr.eu/sites/default/files/TSE/documents/doc/wp/2023/wp_tse_1458.pdf

[^12]: https://www.investopedia.com/terms/d/downsiderisk.asp

[^13]: https://castle.princeton.edu/wp-content/uploads/2020/11/Moazeni-Mean-conditional-value-at-risk-optimal-energy-storage-operation-IEEE-July-20-2014.pdf

[^14]: https://www.econstor.eu/bitstream/10419/233506/1/1755338228.pdf

[^15]: https://business.columbia.edu/sites/default/files-efs/pubfiles/5982/w19030.pdf

[^16]: https://www.crystalfunds.com/insights/understanding-value-at-risk

[^17]: https://blog.yesenergy.com/yeblog/how-to-maximize-virtual-energy-trading-returns-and-minimize-risks

[^18]: https://www.energy-potential.com/uploads/1/1/3/2/113214887/uk_power_energy_risk.pdf

[^19]: https://corporatefinanceinstitute.com/resources/career-map/sell-side/risk-management/value-at-risk-var/

[^20]: https://www.investopedia.com/articles/04/092904.asp

[^21]: https://www.sciencedirect.com/science/article/abs/pii/S0301420724003994

[^22]: https://www.fe.training/free-resources/financial-markets/value-at-risk-var/

[^23]: https://www.sciencedirect.com/science/article/abs/pii/S0304407619302544

[^24]: https://www.sciencedirect.com/science/article/abs/pii/S0140988323005807

[^25]: https://www.sciencedirect.com/topics/social-sciences/value-at-risk

[^26]: https://personal.eur.nl/cdevries/Articles/value_at_risk_and_extrene_returns.pdf

[^27]: https://www.iiis.org/cds2008/cd2008sci/RMCI2008/PapersPdf/R762WO.pdf

[^28]: https://wemastertrade.com/understanding-virtual-trading/

[^29]: https://sites.google.com/site/csphilipps/expectiles

[^30]: https://www.regulationtomorrow.com/asia/sfc-explains-regulatory-expectations-of-virtual-asset-trading-platform-applicants/

[^31]: https://en.wikipedia.org/wiki/Expectile

[^32]: https://www.reddit.com/r/StockMarket/comments/7zo8c8/what_appwebsite_do_you_recommend_for_virtual/

[^33]: https://www.sciencedirect.com/science/article/abs/pii/S0140988319303573

[^34]: https://getd.libs.uga.edu/pdfs/anderson_andrew_l_201212_ms.pdf

[^35]: https://www.mdpi.com/2227-9091/11/12/220

[^36]: https://www.sciencedirect.com/science/article/abs/pii/S0140988323007594

[^37]: https://www.sciencedirect.com/science/article/pii/S0047259X2100035X

[^38]: https://neostox.com

[^39]: https://ideas.repec.org/a/eee/eneeco/v129y2024ics0140988323007594.html

[^40]: https://www.ferc.gov/sites/default/files/enforcement/civil-penalties/actions/138FERC61168.pdf

[^41]: https://www.bankrate.com/investing/ultimate-guide-virtual-trading-stock-market-simulator/

[^42]: https://cramton.umd.edu/papers2020-2024/cramton-et-al-forward-energy-market.pdf

[^43]: https://www.cftc.gov/LearnAndProtect/AdvisoriesAndArticles/understand_risks_of_virtual_currency.html

[^44]: https://faculty.washington.edu/ezivot/econ589/v11n2a4.pdf

[^45]: https://www.sciencedirect.com/science/article/abs/pii/S0378779621003527

[^46]: https://mco.mycomplianceoffice.com/blog/mnpi-compliance-risk-remains-high

[^47]: https://www.mdpi.com/2227-9091/12/2/42

[^48]: https://www.sciencedirect.com/science/article/abs/pii/S0142061520342873

[^49]: https://www.sec.gov/rules-regulations/staff-guidance/trading-markets-frequently-asked-questions/divisionsmarketregfaq-0

[^50]: https://www.youtube.com/watch?v=3UMPUEkTjhY

[^51]: https://repositories.lib.utexas.edu/bitstreams/9950cd25-54b5-4540-a0e5-351228ca1756/download

[^52]: https://en.wikipedia.org/wiki/Value_at_risk

[^53]: https://pages.stern.nyu.edu/~adamodar/pdfiles/valrisk/ch7.pdf

[^54]: https://www.sciencedirect.com/science/article/abs/pii/S0927539818300446

[^55]: https://papers.ssrn.com/sol3/Delivery.cfm/5166015.pdf?abstractid=5166015\&mirid=1

[^56]: https://www.reedsmith.com/en/perspectives/2021/10/dislocation-in-energy-markets-navigating-the-legal-landscape

[^57]: https://en.adgm.thomsonreuters.com/rulebook/virtual-asset-risk-disclosures-0

[^58]: https://www.ferc.gov/sites/default/files/2020-05/03-2005-cp-rept.pdf

[^59]: https://www.sifma.org/wp-content/uploads/2018/03/EY_MarketingPDF_CLA18.pdf

[^60]: https://www.iso-ne.com/static-assets/documents/committees/comm_wkgrps/strategic_planning_discussion/materials/fcm_performance_white_paper.pdf

