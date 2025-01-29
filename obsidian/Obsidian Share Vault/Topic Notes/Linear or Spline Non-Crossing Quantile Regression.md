---
created date: 2024-08-01T16:29:27-07:00
modified date: 2024-08-02T10:22:21-07:00
---

Directly optimize pinball loss over many quantiles, under a non-crossing constraint. Code below uses [[Diamond16convexOptCVXPY|CVXPY]] python convex optimization lib.  

This could be modified to make spline non-crossing QR [XXX] does this w/ extra tuning for spline regularization.


```python

import numpy as np
import cvxpy as cp

# Example data
X = np.random.rand(100, 2)
y = np.random.rand(100)

# Quantile levels
quantiles = [0.25, 0.5, 0.75]

# Define the problem
beta = cp.Variable((X.shape[1], len(quantiles)))
constraints = []

for i in range(len(quantiles) - 1):
    constraints.append(beta[:, i] <= beta[:, i + 1])

objective = cp.Minimize(sum([cp.sum(cp.pos(y - X @ beta[:, i]) * quantiles[i] + cp.sum(cp.pos(X @ beta[:, i] - y) * (1 - quantiles[i]))) for i in range(len(quantiles))]))
problem = cp.Problem(objective, constraints)
problem.solve()

# Estimated coefficients
beta.value
```

**Warning**: 
- non-crossing is only enforced on training data, no guarantees on test
- This [code is from Perplexity](https://www.perplexity.ai/search/can-conformal-quantile-regress-KOOwapTiTtetET8qC4QXuQ#0), so don't trust it.