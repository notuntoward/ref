---
created date: 2025-04-26T15:42:36-07:00
modified date: 2025-04-26T18:57:45-07:00
---

# Mathematical Formulation of the DA/RT Energy Market Optimization Problem

The code implements an optimization model to determine the optimal Day-Ahead (DA) market bidding and offering strategy for a participant who also has wind generation settled in the Real-Time (RT) market. The goal is to maximize expected revenue while penalizing risk, specifically revenue variance and/or semi-variance, based on a set of scenarios.

**1. Objective:**

Maximize the expected revenue penalized by risk. Since solvers typically minimize, the objective is formulated as:

Minimize: (Negative Expected Revenue) + (Variance Penalty) + (Semi-Variance Penalty)

**2. Indices and Sets:**

*   $i$: Index representing a specific scenario.
*   `SCENARIOS`: The set of all scenario indices, $\{1, 2, ..., N\}$, where $N = num\_scenarios$ is the total number of scenarios. Each scenario has equal probability $1/N$.

**3. Input Data (Parameters for each scenario $i \in \text{`SCENARIOS`}$):**

*   `da_cleared_price[i]` ($P_{DA,i}$): The Day-Ahead market clearing price in scenario $i$.
*   `rt_price[i]` ($P_{RT,i}$): The Real-Time market price in scenario $i$.
*   `wind_pow_gen[i]` ($W_i$): The wind power generation (must be sold at RT price) in scenario $i$.

**4. Model Parameters (Fixed Inputs):**

*   `variance_risk_weight` ($\lambda_{var}$): Non-negative weight controlling the penalty for revenue variance.
*   `semi_variance_risk_weight` ($\lambda_{semi}$): Non-negative weight controlling the penalty for revenue semi-variance (downside risk).
*   `clear_smooth` ($s$): Positive smoothing factor for the sigmoid clearing probability approximation. Larger values approximate a step function more closely.
*   `use_habitat_clear_rule` ($H$): Binary flag (0 or 1) to adjust the clearing probability logic.

**5. Decision Variables (Quantities to be optimized):**



**6. Auxiliary Decision Variables (Internal to the model):**

*   `revenue_deviation[i]` ($d_i$): Non-negative variable for each scenario $i$, representing the revenue shortfall below the expected revenue ($d_i = \max(0, E[R] - R_i)$). Used for semi-variance calculation.

**7. Intermediate Calculations (Expressions defined within the model):**

*   **Offer Clearing Probability (Smoothed)** (`_offer_clear_prob_rule(m, i)`):
    Approximates the condition: Offer clears if $P_{offer} \le P_{DA,i}$.
    $$
    P_{\text{offer\_clear}, i} = \frac{1}{1 + \exp\left((1.0 - 2.0 H) \cdot s \cdot (P_{DA,i} - P_{offer})\right)}
    $$

*   **Bid Clearing Probability (Smoothed)** (`_bid_clear_prob_rule(m, i)`):
    Approximates the condition: Bid clears if $P_{bid} \ge P_{DA,i}$.
    $$
    P_{\text{bid\_clear}, i} = \frac{1}{1 + \exp\left((2.0 H - 1.0) \cdot s \cdot (P_{DA,i} - P_{bid})\right)}
    $$
    *(Note: The code adds a small epsilon like `1e-12` to the denominators for numerical stability, omitted here for formula clarity).*

*   **Scenario Revenue** (`scenario_revenue[i]`):
    The total revenue for scenario $i$.
    $$
    R_i = \underbrace{V_{offer} \cdot (P_{DA,i} - P_{RT,i}) \cdot P_{\text{offer\_clear}, i}}_{\text{Settled Offer Revenue}} + \underbrace{V_{bid} \cdot (P_{RT,i} - P_{DA,i}) \cdot P_{\text{bid\_clear}, i}}_{\text{Settled Bid Revenue}} + \underbrace{W_i \cdot P_{RT,i}}_{\text{Wind Revenue}}
    $$

*   **Expected Revenue** (`expected_revenue`):
    The average revenue across all scenarios.
    $$
    E[R] = \frac{1}{N} \sum_{i=1}^{N} R_i
    $$

*   **Revenue Variance** (`revenue_variance`):
    The statistical variance of revenue. Calculated post-optimization or implicitly within the objective.
    $$
    Var(R) = \frac{1}{N} \sum_{i=1}^{N} (R_i - E[R])^2
    $$

*   **Revenue Semi-Variance** (`revenue_semi_variance`):
    The variance of downside deviations from the mean, using the auxiliary variables $d_i$. Calculated post-optimization or implicitly within the objective.
    $$
    SemiVar(R) = \frac{1}{N} \sum_{i=1}^{N} d_i^2
    $$

**8. Constraints:**

*   **Decision Variable Bounds:** The decision variables (`da_offer_vol`, `da_offer_price`, `da_bid_vol`, `da_bid_price`) are constrained to lie within the bounds specified in `lims_inits` and must be non-negative.
    *   `lims_inits.da_offer_vol_bounds[0]` $\le V_{offer} \le$ `lims_inits.da_offer_vol_bounds[1]`
    *   `lims_inits.da_offer_price_bounds[0]` $\le P_{offer} \le$ `lims_inits.da_offer_price_bounds[1]`
    *   `lims_inits.da_bid_vol_bounds[0]` $\le V_{bid} \le$ `lims_inits.da_bid_vol_bounds[1]`
    *   `lims_inits.da_bid_price_bounds[0]` $\le P_{bid} \le$ `lims_inits.da_bid_price_bounds[1]`

*   **Semi-Variance Deviation Constraints** (`deviation_lower_bound_rule(m, i)`):
    These constraints define the shortfall variable $d_i$ for each scenario $i$.
    $$
    d_i \ge E[R] - R_i \quad \forall i \in \{1, ..., N\}
    $$
    Combined with the non-negativity constraint $d_i \ge 0$, this ensures $d_i = \max(0, E[R] - R_i)$.

**9. Objective Function (`objective_rule_combined`):**

The function to be minimized is the negative expected revenue plus the weighted risk penalties:
$$
\text{Minimize} \quad J = -E[R] + \lambda_{var} \cdot Var(R) + \lambda_{semi} \cdot SemiVar(R)
$$
Substituting the definitions and using the auxiliary variables for semi-variance:
$$
\text{Minimize} \quad J = -\left(\frac{1}{N} \sum_{i=1}^{N} R_i\right) + \lambda_{var} \left(\frac{1}{N} \sum_{i=1}^{N} (R_i - E[R])^2\right) + \lambda_{semi} \left(\frac{1}{N} \sum_{i=1}^{N} d_i^2\right)
$$
Subject to the constraints defined in Section 8.

**Summary:**

The problem is formulated as a non-linear program (NLP). The non-linearity arises from the product of decision variables and parameters in the revenue calculation, the squared terms in the variance and semi-variance calculations, and the exponential terms within the sigmoid clearing probability functions. The model seeks the optimal trade-off between maximizing average profit and minimizing the uncertainty (variance) and potential losses (semi-variance) across the range of possible future scenarios.