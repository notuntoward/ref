---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---

Thoughts about normalizing prices so that they're more stationary, presumably more modellable that way (if forecasts, etc. are normalized too?).
# Requirements for the normalizer
- handles negative values
- is adaptive
	- doesn't need a lot of data to learn
	- not too compute intensive
- robust to small changes in the data
- Is invertible, and has python estimators for cdf and inverse cdf ()
# Parametric Distribution Candidates for Normalization

What seems likely applicable, based on copilot's answers, and my google followups.

| Name                          | Heavy Tail | pos/neg | assymm | python icdf | Note                                                                             |
| ----------------------------- | ---------- | ------- | ------ | ----------- | -------------------------------------------------------------------------------- |
| **Normal**                    | N          | Y       | N      | Y           | robust and wrong                                                                 |
| **Weibull**                   | ?          | Y       | Y      | Y           | asymmetric, [pos/neg parameterization](https://stats.stackexchange.com/a/211694) |
| **Cauchy**                    | Y          | Y       | N      | Y           | symmetric                                                                        |
| **Student's t**               | Y          | Y       | N      | Y           | simple, symmetric                                                                |
| **GEV**                       | Y          | Y       | Y      | Y           | data too small b/c nonstationarity ?                                             |
| **bGEV**                      | Y          | Y       | Y      | N           | "regularized" GEV, in R                                                          |
| **Generalized Pareto Hybrid** | y          | y?      | y      | ?           | unclear if doable                                                                |
| **JohnsonU or B**                              |            |         |        |             | Bounded on one side, some tail control                                                                                 |
| **Beta**                              |            |         |        |             | bounded by zero and some upper bound.  Could shift to fit AEMO prices, good for "tail truncation," which prices are.                                                                                 |
## Bing Copilot's answers
LOTS OF ERRORS in response to this [Bing Copilot prompts](https://sl.bing.net/hUse7Sap6nQ): "List ten parametric distributions that are used to model long-tailed conditional distributions of continuous values which are both negative and positive.  They should  also have python functions for the cdf and inverse cdf"  I also [re-asked it](https://sl.bing.net/ibmj8bCW8ke), "which of these can handle negative values?"  I intermingled that answer with the first response text, checked for errors, added new refs, etc. below:

*Response:*
Certainly! Here are **ten parametric distributions** that can be used to model long-tailed conditional distributions of continuous values, which can be both negative and positive. I’ll also provide information on their Python functions for the cumulative distribution function (CDF) and inverse CDF:

![[abccc78e54582b32ac540e01bf308344_MD5.jpg]]

1. **<mark style="background: #BBFABBA6;">Normal Distribution</mark> (Gaussian Distribution)**:
   The normal distribution can model both positive and negative values. It is symmetric around its mean.
    - **Python CDF Function**: `scipy.stats.norm.cdf(x, loc, scale)`
    - **Python Inverse CDF Function (Quantile Function)**: `scipy.stats.norm.ppf(q, loc, scale)`

![[41e5ba9e6b2527ae3adf92c2aba3b104_MD5.jpg]]

2. ~~**Log-Normal Distribution**:~~
   Although the log-normal distribution is typically used for positive values, it can also *handle negative values by modeling the logarithm of the data.* (I asked again, specifically about the log-normal and the answer was that it couldn't, and that Cauchy was a better choice)
    - **Python CDF Function**: `scipy.stats.lognorm.cdf(x, s, loc, scale)`
    - **Python Inverse CDF Function**: `scipy.stats.lognorm.ppf(q, s, loc, scale)`

![[99ef671b604494d7aa587b58b869d752_MD5.jpg]]

3. ~~**Exponential Distribution**:~~
   The exponential distribution is *suitable for positive values* only and does not handle negative values.
    - **Python CDF Function**: `scipy.stats.expon.cdf(x, loc, scale)`
    - **Python Inverse CDF Function**: `scipy.stats.expon.ppf(q, loc, scale)`

4. **<mark style="background: #BBFABBA6;">Weibull Distribution</mark>**:
   The Weibull distribution can handle both positive and negative values, depending on its shape parameter.  [Can be parameterized to handle mixed pos/neg](https://stats.stackexchange.com/a/211694) but is cdf/icdf still easy?
    - **Python CDF Function**: `scipy.stats.weibull_min.cdf(x, c, loc, scale)`
    - **Python Inverse CDF Function**: `scipy.stats.weibull_min.ppf(q, c, loc, scale)`

![[6770389e8ac3afe825c16b676beb87b0_MD5.jpg]]

5. ~~**Gamma Distribution**:~~
   The gamma distribution can handle positive values but *not negative values*.
    - **Python CDF Function**: `scipy.stats.gamma.cdf(x, a, loc, scale)`
    - **Python Inverse CDF Function**: `scipy.stats.gamma.ppf(q, a, loc, scale)`

![[be4ebf31ef3ff1c55946c5ed533dc69d_MD5.jpg]]

6. ~~**Pareto Distribution**:~~
   The Pareto distribution is typically used for positive values and does not handle negative values.
    - **Python CDF Function**: `scipy.stats.pareto.cdf(x, b)`
    - **Python Inverse CDF Function**: `scipy.stats.pareto.ppf(q, b)`

![[b37fd0724b8f3d9702e5ad11577a53c1_MD5.jpg]]

7. **<mark style="background: #BBFABBA6;">Cauchy Distribution</mark>**:
   The Cauchy distribution can handle both positive and negative values. It has **heavy tails and is symmetric**.
    - **Python CDF Function**: `scipy.stats.cauchy.cdf(x, loc, scale)`
    - **Python Inverse CDF Function**: `scipy.stats.cauchy.ppf(q, loc, scale)`

![[cf2df852baf2b21993be2365e696aa12_MD5.jpg]]

8. **<mark style="background: #BBFABBA6;">Student’s t-Distribution</mark>**:
   The t-distribution can handle both positive and negative values. It is commonly used for statistical inference.
    - **Python CDF Function**: `scipy.stats.t.cdf(x, df, loc, scale)`
    - **Python Inverse CDF Function**: `scipy.stats.t.ppf(q, df, loc, scale)`

![[7237549eded768110ca5d8458ff0be35_MD5.jpg]]

9. ~~**Laplace Distribution (Double Exponential)**:~~
   This probably meant the [Gumbel Distribution](https://en.wikipedia.org/wiki/Gumbel_distribution), which is asymmetric, is also called "double exponential," and can handle negatives (a special case of the <mark style="background: #BBFABBA6;">GEV</mark>, which might be the best choice, since Gumbel [is said](https://sl.bing.net/dv8QuPFmQ9I) to have a long right tail).  The [blended GEV](https://onlinelibrary.wiley.com/doi/full/10.1002/env.2742) <mark style="background: #BBFABBA6;">(bGEV)</mark> might be more stable (is in R-INLA package, but I didn't find python for it)
   The Laplace distribution can handle both positive and negative values. It has heavy tails and is symmetric
    - **Python CDF Function**: `scipy.stats.laplace.cdf(x, loc, scale)`
    - **Python Inverse CDF Function**: `scipy.stats.laplace.ppf(q, loc, scale)`

![[637c49091c3dc3f700c167a1ec958c9f_MD5.jpg]]

10. **<mark style="background: #BBFABBA6;">Generalized Pareto Distribution</mark> (for heavy-tailed distributions)**:
    The generalized Pareto distribution is often used for modeling extreme events.  [Generally for tails of another distribution](https://www.sciencedirect.com/topics/mathematics/generalized-pareto-distribution).  That link also mentions a hybrid GPD/normal dist: normal in center, separate and different GPD's for tails.
    - **Python CDF Function**: `scipy.stats.genpareto.cdf(x, c, loc, scale)`
    - **Python Inverse CDF Function**: `scipy.stats.genpareto.ppf(q, c, loc, scale)`

Remember to adjust the parameters (`loc`, `scale`, etc.) according to your specific use case. These distributions can help you model a wide range of data with varying tail behavior. 📊