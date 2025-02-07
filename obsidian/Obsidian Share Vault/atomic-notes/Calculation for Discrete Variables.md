---
date: 2025-02-07 01:48:46
tags: atomized
created date: 2025-02-06T17:49:08-08:00
modified date: 2025-02-06T17:49:08-08:00
---
# Calculation for Discrete Variables
For discrete random variables \( X \) and \( Y \), mutual information is calculated using a double sum:
\[
I(X;Y) = \sum_{y \in \mathcal{Y}} \sum_{x \in \mathcal{X}} P_{(X,Y)}(x,y) \log \left( \frac{P_{(X,Y)}(x,y)}{P_{X}(x) P_{Y}(y)} \right)
\]