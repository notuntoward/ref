---
created date: 2025-04-24T16:49:40-07:00
modified date: 2025-04-24T17:15:57-07:00
---
# Books
- [[Bertsimas97linOptIntroBk|Bertsimas97: Introduction to linear optimization]] 
# Concepts
## Slack and Surplus Variables
- see [[Bertsimas97linOptIntroBk|Bertsimas97linOptIntroBk]], p. 6
	- slack variables eliminate `<=` constraints
	- surplus variables eliminate `==` constraints
## Standard Form
Try to convert your constrained optimization algebraic form into this and then solve it with methods meant for it.
### Standard Form Rationale
From [here](https://www.perplexity.ai/search/in-optimization-what-is-standa-Y2QMFyiGTQSHrOFTfvg0Ig#0):
In optimization, particularly in linear programming (LP), the *standard form* is a specific way of writing the optimization problem so that it follows a uniform structure. For linear programs, the standard form typically looks like:

- **Objective**: Maximize (or minimize) a linear function of the variables.
- **Constraints**: All constraints are written as linear equalities (not inequalities).
- **Non-negativity**: All variables are required to be non-negative ($x_i \geq 0$).

For example, a `standard form LP` is:

$$
\text{Maximize } \mathbf{c}^\top \mathbf{x}
$$
$$
\text{subject to } A\mathbf{x} = \mathbf{b}, \quad \mathbf{x} \geq 0
$$

Here, $A$ is a matrix of coefficients, $\mathbf{b}$ is a vector of constants, and $\mathbf{x}$ is the vector of variables[^3][^4][^5].

In `general continuous optimization, the standard form` is often written as:

$$
\begin{aligned}
\underset{x}{\text{minimize}} \quad f(x) \\
\text{subject to} \quad g_i(x) \leq 0, \quad i = 1, \dots, m \\
\qquad\qquad h_j(x) = 0, \quad j = 1, \dots, p
\end{aligned}
$$

where $f(x)$ is the objective function, $g_i(x)$ are inequality constraints, and $h_j(x)$ are equality constraints[^2].

## Why Use Standard Form?

**1. Algorithm Compatibility**

- Many classical algorithms, especially the simplex method for linear programming, are designed to work with problems in standard form[^1][^4][^6].
- Standard form provides a consistent structure that these algorithms can exploit, simplifying both implementation and analysis.

**2. Simplifies Problem Transformation**

- Any linear program (with inequalities, free variables, etc.) can be systematically converted to standard form by:
    - Adding *slack variables* to turn inequalities into equalities.
    - Replacing unrestricted variables with the difference of two non-negative variables.
    - Ensuring all variables are non-negative[^3][^4].

**3. Theoretical Clarity**

- Standard form offers a clear, uniform framework for teaching, analysis, and proof of properties in optimization theory[^6][^7].
- It helps students and practitioners understand the structure of optimization problems and the transformations needed to solve them.

**4. Software and Modeling**

- While modern optimization software often accepts more general forms, many solvers internally convert problems to standard form to apply efficient algorithms[^6][^7].

## Summary Table: Key Features of Standard Form

| Feature | Standard Form Requirement |
| :-- | :-- |
| Objective | Maximize (or minimize) linear function |
| Constraints | All equalities (no inequalities) |
| Variable Bounds | All variables $\geq 0$ |

## Conclusion

Standard form is a canonical way to write optimization problems—especially linear programs—so they can be efficiently and systematically solved using established algorithms like the simplex method. It ensures compatibility, clarity, and ease of transformation, making it a foundational concept in optimization[^1][^3][^4][^5][^6][^7].
# Related
- see [[Bertsimas97linOptIntroBk|Bertsimas97linOptIntroBk]], p. 4
- use tricks like [[#Slack and Surplus Variables]] to convert to standard form
- [[Contextual Optimization]]
