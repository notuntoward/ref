---
date: 2025-02-07 01:48:46
tags: atomized
created date: 2025-02-06T17:49:08-08:00
modified date: 2025-02-06T17:49:08-08:00
---
# Calculation for Continuous Variables
For continuous random variables, mutual information is computed as:
\[
I(X;Y) = \int_{\mathcal{Y}} \int_{\mathcal{X}} P_{(X,Y)}(x,y) \log \left( \frac{P_{(X,Y)}(x,y)}{P_{X}(x) P_{Y}(y)} \right) dx \, dy
\]