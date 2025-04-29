---
modified date: 2025-04-25T14:02:54-07:00
---
<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# I'm doing virtual bidding and offering on a DA/RT energy market.  My job is to maximize expected profit, but to have a flexible downside penalty based on semi-deviation.  Explain how to build the optimization problem.  I have 100 scenarios of equal probability for DA and RT price, as sell as wind generation, which I must sell at the RT price, regardless of how much wind power I generate.  What I control are two price/quantity pairs, one for offers and the other for bids.

Explain how to set up the problem for pyomo.  I'm especially interested in semi-deviation: how it works, why people use it, how how are slack variables used in optimization to implement it.

To set up an optimization problem in Pyomo for maximizing expected profit from virtual bidding/offering in Day-Ahead (DA) and Real-Time (RT) energy markets, while penalizing downside risk using semi-deviation, you can follow these steps:

## Problem Formulation

**Objective:** Maximize risk-adjusted expected profit. This involves balancing expected profit with a penalty for downside risk (semi-deviation).

**Scenarios:** You have 100 scenarios, indexed by $s = 1, ..., 100$. Each scenario has an equal probability $p_s = 1/100$. For each scenario $s$, you are given:

* DA market price: $P^{DA}_s$
* RT market price: $P^{RT}_s$
* Wind generation: $W_s$ (MW)

**Decision Variables:**

* The core decision is the net quantity $Q^{DA}$ (in MW) you choose to transact in the DA market. A positive $Q^{DA}$ means selling (virtual generation), and a negative $Q^{DA}$ means buying (virtual load). This quantity results from your submitted bid/offer pairs clearing in the DA market[^2].

**Profit Calculation:**
For each scenario $s$, the profit $\pi_s$ is calculated based on arbitraging the DA/RT price difference for your DA position $Q^{DA}$ and selling the mandatory wind generation $W_s$ at the RT price[^2].

* DA Market Transaction Value: $Q^{DA} \times P^{DA}_s$
* RT Market Balancing: You must balance your DA position $Q^{DA}$ and sell your wind generation $W_s$. The net quantity transacted in the RT market is $(W_s - Q^{DA})$. The value of this is $(W_s - Q^{DA}) \times P^{RT}_s$.
* Total Profit per scenario ($\pi_s$):
$$\pi_s = Q^{DA} \times P^{DA}_s + (W_s - Q^{DA}) \times P^{RT}_s$$
This simplifies to:
$$\pi_s = Q^{DA} (P^{DA}_s - P^{RT}_s) + W_s P^{RT}_s$$

**Expected Profit:**
The expected profit $E[\pi]$ across all scenarios is:
$$E[\pi] = \sum_{s=1}^{100} p_s \pi_s = \frac{1}{100} \sum_{s=1}^{100} \pi_s$$
## Semi-Deviation Penalty

**What is Semi-Deviation?**
Semi-deviation is a risk measure that quantifies downside volatility, focusing only on returns or outcomes that fall below a specified target[^3]. Unlike standard deviation, which considers all deviations (positive and negative) from the mean, semi-deviation specifically measures the dispersion of results below the target, typically the mean return or a predefined threshold[^3][^4].

**Why Use Semi-Deviation?**

* **Focus on Downside Risk:** It directly addresses the risk of losses or underperformance, which is often the primary concern for risk-averse investors or traders[^3][^4].
* **Behavioral Alignment:** Investors tend to react more strongly to losses than gains (loss aversion), making semi-deviation a more behaviorally relevant risk measure[^4].
* **Portfolio Management:** It helps in constructing portfolios aimed at minimizing downside risk and evaluating strategies based on their downside protection performance[^4].
* **Tail Risk Assessment:** It can better capture the impact of extreme negative events compared to standard deviation[^4].

**Calculating the Penalty:**
The semi-deviation penalty targets scenarios where the profit $\pi_s$ is less than the expected profit $E[\pi]$.

1. **Downside Deviation:** For each scenario $s$, calculate the shortfall below the expected profit: $$\max(0, E[\pi] -\pi_s)$$.
2. **Semi-Variance (SV):** Calculate the expected value of the squared downside deviations:
$$SV = \sum_{s=1}^{100} p_s (\max(0, E[\pi] - \pi_s))^2$$
3. **Semi-Deviation (SD):** $SD = \sqrt{SV}$ [^3].
4. **Penalty Term:** The penalty in the objective function is typically proportional to the semi-variance or semi-deviation, scaled by a risk aversion coefficient $\lambda \ge 0$. Using semi-variance ($SV$) often leads to a more computationally tractable problem (Quadratic Programming if $\pi_s$ is linear in decisions). Penalty = $\lambda \times SV$.

## Optimization Problem with Slack Variables

To implement the semi-deviation penalty in an optimization model, especially for linear or quadratic solvers, slack variables are used to handle the $\max(0, ...)$ term.

**Introduce Slack Variables:**
Define non-negative slack variables $d_s \ge 0$ for each scenario $s$. These variables will represent the downside deviation $E[\pi] - \pi_s$ when it's positive, and zero otherwise[^5][^6].

**Formulate the Optimization Problem:**
Let $E\pi$ be an auxiliary variable representing the expected profit.

**Objective Function:**
Maximize the risk-adjusted expected profit:
$$Maximize: E\pi - \lambda \sum_{s=1}^{100} p_s d_s^2$$
(Note: Using $d_s^2$ penalizes semi-variance. Alternatively, a linear penalty $\lambda \sum p_s d_s$ could be used, which relates more to expected shortfall below the mean and results in a Linear Program if $\pi_s$ is linear in $Q^{DA}$).

**Constraints:**

1. **Profit Calculation:**
$$\pi_s = Q^{DA} (P^{DA}_s - P^{RT}_s) + W_s P^{RT}_s \quad \forall s = 1, ..., 100$$
2. **Expected Profit Definition:**
$$E\pi = \frac{1}{100} \sum_{s=1}^{100} \pi_s$$
3. **Downside Deviation Constraints:** These ensure $d_s$ correctly captures the shortfall $\max(0, E\pi - \pi_s)$ [^6]:
$$d_s \ge E\pi - \pi_s \quad \forall s = 1, ..., 100$$
$$d_s \ge 0 \quad \forall s = 1, ..., 100$$
4. **Decision Variable Bounds:** You might have limits on the DA position $Q^{DA}$ (e.g., based on budget or market rules):
$$Q^{DA}_{min} \le Q^{DA} \le Q^{DA}_{max}$$

**Role of Slack Variables ($d_s$):**

* The constraint $d_s \ge E\pi - \pi_s$ forces $d_s$ to be at least the shortfall amount.
* Since the objective function aims to *maximize* profits and *minimize* the penalty term involving $d_s$, the optimization will naturally push $d_s$ down towards its lower bound.
* If $E\pi - \pi_s > 0$, the constraint $d_s \ge E\pi - \pi_s$ is active, and $d_s$ will be driven to equal $E\pi - \pi_s$ (assuming $\lambda > 0$).
* If $E\pi - \pi_s \le 0$, the constraint $d_s \ge E\pi - \pi_s$ is satisfied by any non-negative $d_s$. The constraint $d_s \ge 0$ becomes the active lower bound, and the minimization pressure in the objective pushes $d_s$ to 0.
* Thus, $d_s$ effectively equals $\max(0, E\pi - \pi_s)$ at the optimal solution[^5][^6]. If a slack variable $d_s$ is zero at the optimal solution, it indicates that the profit in scenario $s$ was not below the expected profit $E\pi$ [^5].


## Pyomo Implementation Outline

```python
import pyomo.environ as pyo

# Sample Data (replace with your 100 scenarios)
# scenarios = range(100)
# p_s = 1.0 / 100.0
# P_DA = {s: ... for s in scenarios} # Dict of DA prices per scenario
# P_RT = {s: ... for s in scenarios} # Dict of RT prices per scenario
# W = {s: ... for s in scenarios}    # Dict of Wind generation per scenario
# lambda_risk = 0.1 # Example risk aversion coefficient
# Q_DA_min = -50 # Example min DA position (MW)
# Q_DA_max = 50  # Example max DA position (MW)

# Create a concrete model
model = pyo.ConcreteModel()

# Sets
model.scenarios = pyo.Set(initialize=scenarios)

# Parameters
model.p_s = pyo.Param(initialize=p_s)
model.P_DA = pyo.Param(model.scenarios, initialize=P_DA)
model.P_RT = pyo.Param(model.scenarios, initialize=P_RT)
model.W = pyo.Param(model.scenarios, initialize=W)
model.lambda_risk = pyo.Param(initialize=lambda_risk)

# Variables
model.Q_DA = pyo.Var(bounds=(Q_DA_min, Q_DA_max)) # DA position
model.pi = pyo.Var(model.scenarios)              # Profit per scenario
model.E_pi = pyo.Var()                           # Expected profit
model.d = pyo.Var(model.scenarios, domain=pyo.NonNegativeReals) # Downside deviation slack

# Constraints
# 1. Profit calculation per scenario
def profit_rule(m, s):
    return m.pi[s] == m.Q_DA * (m.P_DA[s] - m.P_RT[s]) + m.W[s] * m.P_RT[s]
model.profit_constraint = pyo.Constraint(model.scenarios, rule=profit_rule)

# 2. Expected profit definition
def expected_profit_rule(m):
    return m.E_pi == sum(m.p_s * m.pi[s] for s in m.scenarios)
model.expected_profit_constraint = pyo.Constraint(rule=expected_profit_rule)

# 3. Downside deviation constraints
def downside_dev_rule(m, s):
    return m.d[s] &gt;= m.E_pi - m.pi[s]
model.downside_dev_constraint = pyo.Constraint(model.scenarios, rule=downside_dev_rule)

# Objective Function (Penalizing Semi-Variance)
def objective_rule(m):
    semi_variance_penalty = m.lambda_risk * sum(m.p_s * m.d[s]**2 for s in m.scenarios)
    return m.E_pi - semi_variance_penalty
model.objective = pyo.Objective(rule=objective_rule, sense=pyo.maximize)

# Solve the model (requires a solver capable of handling quadratic objectives, e.g., Gurobi, CPLEX, IPOPT)
# solver = pyo.SolverFactory('gurobi') # Or 'cplex', 'ipopt'
# results = solver.solve(model)

# Print results
# print(f"Optimal DA Position (Q_DA): {pyo.value(model.Q_DA)}")
# print(f"Expected Profit (E_pi): {pyo.value(model.E_pi)}")
# Calculate and print Semi-Variance or Semi-Deviation if needed
```

This setup provides a framework for maximizing expected profit while controlling downside risk using a semi-deviation based penalty, leveraging Pyomo and slack variables for a structured optimization approach[^5][^6]. Remember to choose a solver appropriate for the resulting problem type (likely QP if using the $d_s^2$ penalty).

<div style="text-align: center">⁂</div>

[^1]: https://www.nrel.gov/docs/fy23osti/84942.pdf

[^2]: https://scholarsmine.mst.edu/cgi/viewcontent.cgi?article=5472\&context=ele_comeng_facwork

[^3]: https://www.wallstreetmojo.com/semi-deviation/

[^4]: https://fastercapital.com/content/Semi-Variance-and-Semi-Deviation--How-to-Measure-the-Downside-Variance-and-the-Downside-Deviation-of-Your-Investment-Returns.html

[^5]: https://www.fastercapital.com/content/Slack-Variables--Slack-Variables--The-Secret-to-Balancing-Linear-Programming-Equations-in-Excel.html

[^6]: https://or.stackexchange.com/questions/8505/correct-way-to-add-slack-variables-to-model

[^7]: https://www.sciencedirect.com/science/article/pii/S030626192201741X

[^8]: https://www.mdpi.com/1996-1073/17/23/6042

[^9]: https://www.pjm.com/-/media/DotCom/documents/manuals/archive/m11/m11v120-energy-and-ancillary-services-market-operations-05-25-2022.pdf

[^10]: https://bpmcm.caiso.com/BPM Document Library/Market Operations/Appendices-Market_Operations_V36_redline.pdf

[^11]: https://arxiv.org/pdf/2303.16266.pdf

[^12]: https://www.sciencedirect.com/science/article/abs/pii/S0098135423004209

[^13]: https://www.sciencedirect.com/science/article/abs/pii/S0959652620307629

[^14]: https://hepg.hks.harvard.edu/publications/virtual-bidding-and-electricity-market-design

[^15]: https://digitalcommons.unl.edu/cgi/viewcontent.cgi?article=1695\&context=electricalengineeringfacpub

[^16]: https://www.sciencedirect.com/science/article/abs/pii/S0959652621012518

[^17]: https://www.iso-ne.com/static-assets/documents/2023/06/imm-markets-primer.pdf

[^18]: https://www.sciencedirect.com/science/article/abs/pii/S0378779620306544

[^19]: https://open.metu.edu.tr/bitstream/handle/11511/23447/index.pdf

[^20]: https://arxiv.org/pdf/2104.02754.pdf

[^21]: https://www.linkedin.com/pulse/downside-measures-semi-deviation-var-cvar-ammar-a-raja

[^22]: https://analystprep.com/cfa-level-1-exam/quantitative-methods/downside-deviation/

[^23]: https://en.wikipedia.org/wiki/Downside_risk

[^24]: https://www.sciencedirect.com/science/article/abs/pii/S095741742300502X

[^25]: https://www.macroaxis.com/invest/technicalIndicator/filter--Semi-Deviation

[^26]: https://efmaefm.org/0efmameetings/efma annual meetings/2008-Athens/papers/Estrada.pdf

[^27]: https://www.financialplanningassociation.org/article/journal/JUN13-intuitive-examination-downside-risk

[^28]: https://quant.stackexchange.com/questions/60326/downside-deviation-semivariance-in-m-v-portfolio-optimization

[^29]: https://www.youtube.com/watch?v=4Cbrduq34m8

[^30]: https://fastercapital.com/content/Downside-deviation--Diving-Deep-into-Downside-Deviation-and-Semideviation.html

[^31]: https://digitalcommons.wayne.edu/jmasm/vol9/iss2/21/

[^32]: https://www.youtube.com/watch?v=9z24UyK-C4c

[^33]: https://people.orie.cornell.edu/miketodd/soa5.pdf

[^34]: https://inldigitallibrary.inl.gov/sites/sti/sti/Sort_63599.pdf

[^35]: https://digitalcommons.unl.edu/dissertations/AAI27666307/

[^36]: https://fneum.github.io/data-science-for-esm/08-workshop-pyomo.html

[^37]: https://www.nyiso.com/documents/20142/3037451/7-Virtual-Trading.pdf/b8ec4017-daac-5654-33d2-d032eb59e2b5

[^38]: https://e-archivo.uc3m.es/bitstreams/1b1c31b8-7675-4179-b0ca-a187fbebd6b7/download

[^39]: https://mobook.github.io/MO-book/notebooks/05/03-markowitz-portfolio.html

[^40]: https://pyomo.readthedocs.io/en/stable/explanation/modeling/math_programming/sets.html

[^41]: https://pypsa.readthedocs.io/en/v0.19.1/examples/simple-electricity-market-examples.html

[^42]: https://www.osti.gov/servlets/purl/1771935

[^43]: https://www.arxiv.org/pdf/2409.08343.pdf

[^44]: https://pyomo.readthedocs.io/en/6.8.1/explanation/solvers/pyros.html

[^45]: https://stackoverflow.com/questions/50141454/pyomo-abstract-model-cost-per-unit-in-transportation-a-function-of-quantity-sh

[^46]: https://www.purdue.edu/discoverypark/sufg/docs/publications/Juan Giraldo Dissertation.pdf

[^47]: https://documents.pserc.wisc.edu/documents/publications/reports/2003_reports/alvarado_bidding_report_0411.pdf

[^48]: https://bitar.engineering.cornell.edu/papers/IFAC17MBP.pdf

[^49]: https://www.frontiersin.org/journals/energy-research/articles/10.3389/fenrg.2023.1326613/full

[^50]: https://www.bmsmoney.com/article/full/tools-to-calculate-risk-in-mutual-fund-semi-deviation/

[^51]: https://www.usc.es/economet/journals1/aeid/aeid728.pdf

[^52]: https://optimization-online.org/2015/12/5250/

[^53]: https://python.quantecon.org/two_auctions.html

[^54]: https://stackoverflow.com/questions/57065154/how-to-solve-non-fixed-bound-or-weight-using-pyomo-and-couenne-for-a-portfolio

[^55]: https://repository.gatech.edu/bitstreams/9f914968-224e-4d4f-81ec-843aed8fd7da/download

