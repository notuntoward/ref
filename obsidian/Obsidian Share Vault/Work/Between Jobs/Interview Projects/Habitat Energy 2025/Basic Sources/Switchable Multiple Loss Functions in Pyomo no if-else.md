---
created date: 2025-04-12T22:06:43-07:00
modified date: 2025-04-12T22:06:43-07:00
---
<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# I'm building a pyomo optimizer using the iopt solver.  I want to maximize revenue and have the option to penalize this with several different risk functions.  How can I do this, since pyomo fails when I put if-else's in the optimization rule function?

To implement risk penalties in Pyomo without using `if-else` statements (which break differentiability), use **smooth mathematical reformulations** and auxiliary variables. Below is a modular framework compatible with Ipopt:

---

### **1. Core Objective Function Structure**

Define a parameterized objective that supports multiple risk penalties:

```python
from pyomo.environ import *

model = ConcreteModel()
model.lambda_risk = Param(initialize=0.1)  # Risk aversion coefficient

# Revenue term (maximize)
model.revenue = Var(initialize=0)
model.expected_rev = Objective(expr=model.revenue, sense=maximize)

# Risk penalty term (minimize)
model.risk_penalty = Var(initialize=0)
model.composite_objective = Objective(
    expr=model.revenue - model.lambda_risk * model.risk_penalty,
    sense=maximize
)
```

---

### **2. Risk Penalty Formulations**

#### **a. Semi-Deviation (L2 Norm of Losses)**

```python
model.loss = Var(within=NonNegativeReals)  # Negative revenue deviation
model.loss_sq = Var(within=NonNegativeReals)  # Squared loss

def loss_rule(m):
    return m.loss == max(0, -m.revenue)  # Smooth approximation of max(0, -revenue)
model.loss_con = Constraint(rule=loss_rule)

def loss_sq_rule(m):
    return m.loss_sq == m.loss**2
model.loss_sq_con = Constraint(rule=loss_sq_rule)

model.risk_penalty = sqrt(sum(m.loss_sq for m in scenarios) / len(scenarios))
```


#### **b. Expectiles (Quadratic Asymmetric Loss)**

```python
model.tau = Param(initialize=0.05)  # Expectile level (e.g., 5% focus on losses)

def expectile_penalty(m):
    return sum(
        m.tau * (max(revenue - m.revenue, 0))**2 +
        (1 - m.tau) * (max(m.revenue - revenue, 0))**2
        for revenue in scenario_revenues
    )
model.risk_penalty = expectile_penalty(model)
```


#### **c. CVaR (Conditional Value at Risk)**

```python
model.alpha = Param(initialize=0.95)  # Confidence level
model.var = Var()  # Value at Risk
model.excess_loss = Var(within=NonNegativeReals)  # Loss beyond VaR

def cvar_rule(m):
    return m.excess_loss &gt;= -m.revenue - m.var
model.cvar_con = Constraint(rule=cvar_rule)

model.risk_penalty = m.var + (1 / (1 - m.alpha)) * m.excess_loss
```

---

### **3. Switching Between Risk Measures**

Use Pyomo’s `deactivate()` and `activate()` to toggle penalties:

```python
# Deactivate all risk penalties initially
model.risk_penalty.deactivate()

# Activate semi-deviation
model.loss_con.activate()
model.loss_sq_con.activate()
```

---

### **4. Solver Configuration for Non-Linear Terms**

```python
solver = SolverFactory('ipopt')
solver.options['max_iter'] = 5000
solver.options['tol'] = 1e-6
solver.options['linear_solver'] = 'ma57'  # For sparse systems
solver.solve(model, tee=True)
```

---

### **5. Key Implementation Notes**

- **Avoid `if-else`**: Replace with smooth approximations like `max(0, x)`, which is differentiable as `0.5 * (x + abs(x))`.
- **Precompute Scenarios**: For stochastic inputs (e.g., 1000 price scenarios), precompute revenue values outside Pyomo to reduce model complexity.
- **Modular Design**: Separate risk penalties into different Pyomo components for easy toggling.

---

### **Example: Semi-Deviation Penalty in Action**

```python
# Scenario data (precomputed revenues)
scenario_revenues = [5000, -200, 3000, ...]  # 1000 entries

model = ConcreteModel()
model.rev = Var(initialize=0)
model.risk_penalty = Var(initialize=0)

# Semi-deviation calculation
model.loss = Var(range(1000), within=NonNegativeReals)
model.loss_sq = Var(range(1000), within=NonNegativeReals)

for i in range(1000):
    model.loss[i] = max(0, -scenario_revenues[i] + model.rev)  # Loss relative to bid
    model.loss_sq[i] = model.loss[i]**2

model.risk_penalty = sqrt(sum(model.loss_sq[i] for i in range(1000)) / 1000)
model.obj = Objective(expr=model.rev - 0.1 * model.risk_penalty, sense=maximize)

solver = SolverFactory('ipopt')
results = solver.solve(model)
```

---

### **Troubleshooting Tips**

| Issue | Solution |
| :-- | :-- |
| **"Division by zero"** | Add a small epsilon (e.g., `1e-6`) to denominators. |
| **"Non-differentiable"** | Replace `abs(x)` with `sqrt(x**2 + 1e-4)` for smoothness. |
| **Solver divergence** | Scale variables (e.g., divide revenue by 1000) to improve numerics. |

This approach balances flexibility with solver compatibility, allowing you to test VaR, CVaR, and expectiles in a single Pyomo model.

