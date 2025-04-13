---
created date: 2025-04-12T21:28:13-07:00
modified date: 2025-04-12T21:28:13-07:00
---
<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# how could I get the quantile regression required for expectiles into pyomo?

To integrate quantile regression into Pyomo for expectile-based optimization, follow this approach:

---

### **1. Quantile Regression Formulation**

Quantile regression minimizes the asymmetric absolute loss:

$$
\text{Loss} = \sum_{i=1}^n \tau \cdot |y_i - \hat{y}_i| \cdot \mathbf{1}_{y_i &gt; \hat{y}_i} + (1-\tau) \cdot |y_i - \hat{y}_i| \cdot \mathbf{1}_{y_i \leq \hat{y}_i}
$$

In Pyomo, implement this using auxiliary variables for residuals:

```python
from pyomo.environ import *

model = ConcreteModel()
model.tau = Param(initialize=0.5)  # Quantile level (e.g., τ=0.5 for median)
model.x = Var(initialize=0)        # Decision variable (e.g., bid parameter)
model.resid_pos = Var(within=NonNegativeReals)  # Positive residual
model.resid_neg = Var(within=NonNegativeReals)  # Negative residual

# Constraints
def residual_rule(m, y_obs):
    return y_obs - m.x == m.resid_pos - m.resid_neg
model.residual_con = Constraint(y_data, rule=residual_rule)

# Objective: Quantile loss
def quantile_loss(m):
    return sum(m.tau * m.resid_pos[i] + (1 - m.tau) * m.resid_neg[i] for i in y_data)
model.obj = Objective(rule=quantile_loss)
```

---

### **2. Expectile Regression via Quantile Mapper**

For expectiles, use **convex expectile regression (CER)** (pyStoNED-style quadratic loss)[^3]:

$$
\text{Loss} = \tau \sum (\varepsilon^+)^2 + (1-\tau) \sum (\varepsilon^-)^2
$$

Implement in Pyomo with Ipopt:

```python
model.tau_cer = Param(initialize=0.5)  # Expectile level
model.eps_pos = Var(within=NonNegativeReals)  # Squared positive residual
model.eps_neg = Var(within=NonNegativeReals)  # Squared negative residual

def cer_loss(m):
    return m.tau_cer * sum(m.eps_pos[i] for i in y_data) + \
           (1 - m.tau_cer) * sum(m.eps_neg[i] for i in y_data)
model.obj = Objective(rule=cer_loss)

# Quadratic residuals
def cer_residual_rule(m, y_obs):
    return (y_obs - m.x)**2 == m.eps_pos + m.eps_neg
model.cer_con = Constraint(y_data, rule=cer_residual_rule)
```

---

### **3. Dual Quantile-Expectile Integration**

For risk-aware bidding, combine quantile and expectile terms using the **IEQN framework**[^1]:

```python
# Quantile term (τ=0.05 for downside risk)
model.quantile_penalty = Expression(expr=sum(
    0.05 * model.resid_pos[i] + 0.95 * model.resid_neg[i] for i in y_data
))

# Expectile term (τ=0.5 for central tendency)
model.expectile_penalty = Expression(expr=sum(
    0.5 * model.eps_pos[i] + 0.5 * model.eps_neg[i] for i in y_data
))

# Composite objective
model.obj = Objective(expr=model.expectile_penalty + 0.1 * model.quantile_penalty)
```

---

### **4. Solver Configuration**

Use Ipopt with regularization for stability:

```python
solver = SolverFactory('ipopt')
solver.options['max_iter'] = 1000
solver.options['hessian_approximation'] = 'limited-memory'
results = solver.solve(model, tee=True)
```

---

### **Key Considerations**

1. **Non-convexity**: Quantile regression is non-convex; use multi-start strategies or switch to CER for convexity[^3].
2. **Efficiency**: For large datasets, precompute scenario residuals outside Pyomo.
3. **Validation**: Compare results against `pyStoNED` or `skscope` implementations[^3][^5].

For energy-specific examples, adapt this template to your stochastic price/generation scenarios.

<div>⁂</div>

[^1]: https://arxiv.org/html/2305.16877

[^2]: https://www.jstatsoft.org/article/view/v111i06/4631

[^3]: https://pystoned.readthedocs.io/en/latest/examples/quantile/cer.html

[^4]: https://www.osti.gov/servlets/purl/1771935

[^5]: https://skscope.readthedocs.io/en/0.1.7/gallery/LinearModelAndVariants/quantile-expectile-regression.html

[^6]: https://github.com/WenxinZhou/retire

[^7]: https://github.com/scikit-learn/scikit-learn/issues/23334

[^8]: https://eprints.whiterose.ac.uk/id/document/2840531

[^9]: https://arxiv.org/pdf/2311.06590.pdf

[^10]: https://github.com/matomatical/expectiles

[^11]: https://www.sciencedirect.com/science/article/pii/S0377221723002734

[^12]: https://lmc2179.github.io/posts/quantreg_pi.html

[^13]: https://www.linkedin.com/posts/anastasiosgiovanidis_quantile-expectile-regression-activity-7282523106705858560-bZQl

[^14]: https://barnesanalytics.com/quantile-regression-in-python/

[^15]: https://pyomo.readthedocs.io/en/6.8.0/contributed_packages/doe/doe.html

[^16]: https://en.wikipedia.org/wiki/Quantile_regression

[^17]: https://github.com/scikit-learn/scikit-learn/issues/13612

[^18]: https://jckantor.github.io/CBE30338/06.04-Linear-Production-Model-in-Pyomo.html

[^19]: https://pyomo.readthedocs.io/en/stable/explanation/

[^20]: https://pyomo.readthedocs.io

[^21]: https://github.com/WenxinZhou/retire

[^22]: https://osf.io/znj38/download

[^23]: http://www.pyomo.org/related-projects

[^24]: https://github.com/Pyomo/pyomo/blob/main/CHANGELOG.md

[^25]: https://scikit-learn.org/stable/auto_examples/linear_model/plot_quantile_regression.html

[^26]: https://freakonometrics.hypotheses.org/49947

[^27]: https://stats.stackexchange.com/questions/384909/formulating-quantile-regression-as-linear-programming-problem

[^28]: https://stackoverflow.com/questions/75534558/constrained-linear-regression-to-find-the-optimal-value-of-c-m1-m2-m3-in-the

[^29]: https://fneum.github.io/data-science-for-esm/08-workshop-pyomo.html

[^30]: https://pyomo.readthedocs.io/en/6.7.2/contributed_packages/mindtpy.html

