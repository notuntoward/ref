---
created date: 2025-04-25T14:13:16-07:00
modified date: 2025-05-06T13:46:10-07:00
---

This explains the take-home challenge for Habitat Energy: what it does, how well it did it, how to install it and how to test it.  The computational code is in a single file: `./src/trading_optimizer/optimizer.py`. The notebooks used run it, and to generate parts of this report, are in `./notebooks`
# Introduction
The software in this project is intended to make optimal trading decisions for a wind power producer who must sell wind power on a real-time (RT) electricity market. 
## The risk of doing nothing: selling only wind power

The producer must always sell wind generation at RT prices -- potentially very high prices but incurring some hourly risk due to negative prices.  Below, are hourly forecasts across a 24 hour period of RT prices, along with wind generation. The upper right scatter plot shows prices exceeding $4000 but that is very rare.  Only 1.6% of RT prices exceed $75, while 7.7% are negative. Unfortunately, those negative prices are most like to occur when wind production is high, meaning that simply selling wind generation with no hedging risks hourly losses. The lower right plot shows the relationship between RT price and wind generation for the vast majority of cases where prices are under $75: negative prices are unfortunately most likely at times when the wind producer must sell a lot of it.

![[Work/Between Jobs/Interview Projects/Habitat Energy 2025/attachments/image-1.png|789x566]]

Note: All numerical data reported here is based on forecasts, as above, rather than actually realized prices or power generation.  The only data available are probabilistic forecasts of market prices and wind power generation, with 100 scenarios for each forecasted variable.
## Day ahead hedging
The risk of losing money on the sale of an hour's wind generation can theoretically be reduced with virtual trades on the day ahead (DA) market. A virtual trader sells (offers) or buys (bids) a chosen amount of power for hours in the next day, and then pays or receives the RT price on that day.  This makes it possible to benefit from the fact that the DA market price is generally higher and more easily forecasted than the RT price, as shown in the graph and table below (same day as above): The mean DA price is $8.30 higher than the mean RT price, and its standard deviation is $148.3 lower. 

![[Work/Between Jobs/Interview Projects/Habitat Energy 2025/attachments/image-2.png|434x505]]

**Day-ahead (DA) and Realtime (RT) market price summary statistics** 

|                | Mean | Std. Dev. |
| :------------- | ---: | --------: |
| DA_price       | 40.4 |      10.8 |
| RT_price       | 32.2 |     159.1 |
| **Difference** |  8.3 |    -148.3 |

# Risk Reduction with Day Ahead Trading

First, expected revenue is defined according to this market's rules, and then methods for reducing risk are covered.  Finally, the trading algorithm optimization method to be de-risked is explained.
## Expected Revenue

The information from which we can compute expected trading revenue are equiprobable forecast **scenarios**, indexed by $i = 1, ... N$ where $N=100$.  For each of 24 trading hours, the scenarios contain:

*   `da_cleared_price[i]` ($P_{DA,i}$): The forecasted Day-Ahead market clearing price
*   `rt_price[i]` ($P_{RT,i}$): The forecasted Real-Time market price
*   `wind_pow_gen[i]` ($W_i$): The the forecasted wind power generation

The trading algorithm is responsible for setting the controllable **decision variables**:

*   `da_offer_vol` ($V_{offer}$): Volume (MW) offered in the DA market.
*   `da_offer_price` ($P_{offer}$): Price ($/MWh) of the DA offer.
*   `da_bid_vol` ($V_{bid}$): Volume (MW) bid (to buy) in the DA market.
*   `da_bid_price` ($P_{bid}$): Price ($/MWh) of the DA bid.

Given the decision variables, the **total revenue** for scenario $i$ is:
    $$
    R_i = \underbrace{V_{offer} \cdot (P_{DA,i} - P_{RT,i}) \cdot P_{\text{offer\_clear}, i}}_{\text{Settled Offer Revenue}} - \underbrace{V_{bid} \cdot (P_{RT,i} - P_{DA,i}) \cdot P_{\text{bid\_clear}, i}}_{\text{Settled Bid Revenue}} - \underbrace{W_i \cdot P_{RT,i}}_{\text{Wind Revenue}}
    $$
where $P_{\text{bid\_clear}, i}$ is ideally 1 when $P_{bid} \ge P_{DA,i}$ and is 0 otherwise, and were $P_{\text{offer\_clear}, i}$ is ideally 1 when $P_{offer} \le P_{DA,i}$ and is 0 otherwise (approximations are discussed later).

The expected revenue across the scenarios is then: $$E[R] = \frac{1}{N} \sum_{i=1}^{N} R_i$$If there was no goal to control risk, then the trading algorithm's **objective function** would be $E[R]$ i.e. its choice of decision variables would maximize $E[R]$.
## Risk reduction
A trading optimization algorithm (below) that makes decisions that maximize expected revenue would yield the highest total revenue over a large number of days, assuming perfectly calibrated and sufficiently precise forecasts.  In real life, forecasts aren't perfectly calibrated, and there may not be enough days to recover from catastrophic losses. So instead of maximizing expected revenue, risk is often limited by optimizing for expected revenue minus a risk penalty.

Risks of the kind reduced by common strategies such as futures, options and swaps are not on the menu, as we're limited to trading on the DA and RT market.  And, since the available forecasts are stationary -- real markets aren't -- it's not that useful to evaluate any trading strategy that spans more than one day. We must minimize risk on one day of hourly forecasts.  It's nice that the forecasts are scenarios, but since we're not operating storage, there is no memory, meaning that we can treat decisions on each hour independently. Therefore, the approach taken here is to limit risk on each hour.
### Risk-penalized objective functions
For each hour, rather than picking decision variables that maximize $E[R]$, the trading algorithm objective function is: $$ J = E[R] - \lambda \cdot RP(R)$$where $RP(R)$ is some penalty function that increases with revenue risk, and $\lambda>=0$ is a weighting coefficient.  At the optimum decision variable choice, $J$ reaches its maximum, $J^*$.

### Revenue Variance Penalty
In many situations, the risk is uncertainty of information, in this case, of forecasts and specifically, in the distribution of revenues predicted by the forecasts, given a decision variable choice.  This can be summarized by variance: $$Var(R) = \frac{1}{N} \sum_{i=1}^{N} (R_i - E[R])^2$$Optimizing over the variance risk penalty is relatively simple; a weakness is that it penalizes generic uncertainty -- either of making less money than expected or of more money.  We're interested specifically in the risk of *losing* money.
### **Revenue Semi-Variance** Penalty:

The semi-variance penalty responds to scenarios where revenues are below expectation: where $R < E[R]$. For each scenario, the revenue shortfall, or **downside deviation** is: 
$$d_i = \max(0, R_i - E[R])$$
And for the set of scenarios, the **Semi-Variance** is: $$SemiVar(R) = \frac{1}{N} \sum_{i=1}^{N} d_i^2$$An advantage of semi-variance over related alternatives e.g. value at risk (VAR), conditional or not, is ease of implementation.  
## Trading Algorithm Optimization
I wanted to experiment with the [pyomo python optimization library](https://www.pyomo.org/), mainly because I'd heard good things about it from colleagues: it was easy to use, modern, well-maintained, and supported many solver types, some for free.  So again, based on what I'd heard, I chose the free [IPOPT solver](https://coin-or.github.io/Ipopt/).  This [interior point](https://link.springer.com/chapter/10.1007/978-3-319-58356-3_20) software is said to be well-maintained, robustly coded, and capable of non-linear optimization (the market clearing rules in this project are non-linear, as are the decision variable products).  After a couple toy experiments, I stuck with IPOPT, and worked around its limitations.
### Market Clearing Rule Probability
One IPOPT limitation was that it actually could not handle the infinitely sharp non-linearities in the DA clearing rules.  At this point, I could have switched to a [Mixed Integer Linear Programming](https://epubs.siam.org/doi/abs/10.1137/130915303) approach, and used binary clearing variables. But instead, I used a recommended way around this problem: a smoothed, non-linear clearing probability:
$$
\text{Pclear}(\Delta c) = \frac{1}{1 + \exp(\gamma \cdot \Delta c)}
$$
where $\lambda=5$ is an empirically chosen smoothing constant.  Using $\text{Pclear()}$, the definitions for the total revenue equation above are defined as:
$$P_{offer\_clear, i} =  Pclear(P_{DA,i} - P_{offer})$$
and: 
$$
P_{offer\_clear, i} =  Pclear(P_{bid}  - P_{DA,i})$$

A set of example clearing probabilities is shown below:

![[Work/Between Jobs/Interview Projects/Habitat Energy 2025/attachments/image-3.png]]
### Semi-Variance Slack Variables
It was straight-forward to implement the Revenue Variance Penalty with IPOPT functions, but it turned out that a $max()$ function needed for the semi-variance downside deviation was not available.  However, implementation was again straight-forward with the addition of constrained **semi-deviation slack variables**.  This entailed redefining the shortfall variable, $d_i$, above, as:
  $$
    d_i \ge E[R] - R_i 
    $$
and then subjecting it to an optimizer non-negativity constraint, $d_i \ge 0$.  This ensures $d_i = \max(0, E[R] - R_i)$.
### Final Optimization Objective Function
Substituting the definitions above, and using the slack variables for semi-variance, the final optimization objective function is:
$$
J = \left(\frac{1}{N} \sum_{i=1}^{N} R_i\right) - \lambda_{var} \left(\frac{1}{N} \sum_{i=1}^{N} (R_i - E[R])^2\right) - \lambda_{semi} \left(\frac{1}{N} \sum_{i=1}^{N} d_i^2\right)
$$
where $\lambda_{var}>=0$ is the variance penalty weight, and $\lambda_{semi} >= 0$ is the semi-deviation penalty weight.  For this project, only one of the variables was set to non-zero at a time.  It would be possible to use both in a way similar to the $l1$ and $l2$ norm complexity penalty weights in [elastic net regression](https://www.tandfonline.com/doi/abs/10.1080/02664763.2020.1787355).  But this wasn't explored.
### Decision Variable Bounds and Initial Values
During optimization, the decision variables were bounded, and each needed an initial value.  The manually determined values were:

**Decision Variable Optimization Initial Values and Bounds

| Quantity | Min | Max | Initial |
| :-- | :-- | :-- | :-- |
| da_offer_vol | 0.0 | 200.0 | 60 |
| da_offer_price | 0 | 70 | 35.0 |
| da_bid_vol | 0.0 | 200.0 | 60 |
| da_bid_price | 22.0 | 58.0 | 38.0 |
# Evaluation
In real life, the approach used here would be evaluated with actual wind generation and prices, along with their forecasts.  This would be done over years of historical data, with whatever forecast and optimization parameters being tuned on distinct train and dev sets, and then finally tested on a held-out test set.  For this, I would use a hyperparameter tuning package e.g. [optuna](https://optuna.org/).  A goal for this tuning could be to maximize expected revenue over some long time period, while keeping the probability of catastrophic loss "low."  

What is a "low" probability and a "low" financial loss?  This would have something to do with how much emergency capital the trader can acquire at what cost, regulations, possible arrangements with hedge funds... this is something I would need to look into.

In this project, none of this is possible, but I can show the results of a demo.  For the demo, I compared the expected total revenue over 24 hours for the cases of:

- RT-only operation (only accept RT wind price)
- DA trading with deterministic forecasts (decisions optimized on the mean of the scenario forecasts, and then evaluated on the same scenario forecasts used for the other cases)
- DA trading with no risk penalty
- DA trading with a variance penalty
- DA trading with a semi-variance penalty. 

I set the decision variable bounds and initial values (above) to ensure convergence on all cases, and set the variance and semi-variance penalty weights to $\lambda_{var} = \lambda_{semi}=0.001$.  In practice, you would tune these on real data.  Tuning on many single-day forecast scenario sets might tell you something about performance on that day, but it's very much a "test on train" exercise, so I didn't do it.  This is just a demo.
## Semi-Variance Optimization Example
The example plot below shows the results of a semi-variance optimization run across one day.  At the top is the objective value ($J^*$) -- the semi-variance penalized expected revenue for each hour's optimal decision variables.  Below, on the orange line, is the revenue variance at $J^*$. This is there only for completeness, as $\lambda_{var}=0$ for this run, and it had no effect on the optimization.  The revenue semi-variance (green) did affect the optimization, and it is highest when the price forecast scenarios have the highest downside variance (the forecast scenarios for wind power, DA price and RT price are at the plot bottom).  Regardless of risk, the red line shows that expected revenue at each hour's $J^*$ roughly follows forecasted wind generation, with some chips taken out of it by large forecasted negative prices: offered volume (purple) also follows wind generation (more roughly) but offered price appears to be more influenced by the forecasted DA price.  The relationships the bid price and volume are not obvious.

![[Work/Between Jobs/Interview Projects/Habitat Energy 2025/attachments/image-13.png]]
## Comparison of Trading Strategies

The histograms below show the expected hourly distributions for the optimization and data input cases demoed here.
#### RT-only
At the top, is the hourly revenue histogram for the case when the trading algorithm is to simply accept the RT price.  This produces the lowest mean hourly revenue (vertical red line) of all the cases: DA/RT arbitrage has benefits.  The negative prices shown in the scenario plots above don't show up in the hourly averages below because the hourly mean price is always above zero.  Negative risk would show up if I plotted every scenario, so this is a weakness of these plots.
#### Deterministic
In the next plot down, stand-ins for deterministic forecasts were generated by computing the scenario mean for the hour. The average revenue for the day is higher than the RT-only case, suggesting that DA/RT arbitrage is worth it, even for this simple forecast.  Note that there are hours with negative average revenue, and that the revenue variance is high -- when given deterministic forecasts, there's no way for the trading algorithm to assess downside risk.

![[Work/Between Jobs/Interview Projects/Habitat Energy 2025/attachments/image-14.png]]
#### No Risk Penalty
It's no surprise that the case with the highest revenue variance of all -- along with the most negative hours -- is the one where DA/RT arbitrage is done on scenario forecasts, but with no risk penalty.  This also has the highest expected value, as you would expect on this idealized data.
#### Variance Risk Penalty
This one has the smallest hourly revenue spread, small enough that it has completely avoided negative hours, but since the penalty is equally sensitive to extrema above the mean, the result is that high revenues are also missed, and this gives the variance penalty the lowest daily average revenue of the DA/RT arbitrage results.
#### Semi-Variance Penalty
For the semi-variance penalty, there is one slightly negative hour, but more very positive hours than with the variance penalty -- the daily average is better.
# Conclusions

| Statistic           | RT-only | Deterministic | No Risk Penalty | Variance Penalty | Semi-Variance Penalty |
| :------------------ | ------: | ------------: | --------------: | ---------------: | --------------------: |
| Total Daily Revenue |   35392 |         53018 |           77175 |            46670 |                 60635 |
| Min                 |     766 |         -3811 |           -5515 |              496 |                  -204 |
| 5% Quantile         |     810 |         -3095 |           -3562 |              831 |                   829 |
| 95% Quantile        |    2763 |          4405 |            5896 |             3148 |                  4668 |
| Max                 |    3247 |         11440 |           11432 |             3185 |                  4739 |
| Mean                |    1475 |          2209 |            3216 |             1945 |                  2526 |
| Std. Dev.           |     624 |          2964 |            3571 |              823 |                  1394 |
| Total               |   35392 |         53018 |           77175 |            46670 |                 60635 |
Summarized in the table above, the highest total revenue over the day is achieved with no **Risk Risk Penalty** and this is also the riskiest method. The least apparently risky of all is surprisingly, simply doing **RT-only**, although this is partly an artifact of the hourly averaging.  **Deterministic** forecasts are quite good for such a simple approach, but they have the second highest risk -- much higher than that of the **Semi-Variance** penalty, which is also the second most profitable.  Finally, the **Variance Penalty** has quite low risk but mediocre total revenue.

On this data, with these settings, the **Semi-Variance** penalty may be the happy medium.  But its true merit can only be confirmed on real data, and a thorough experimental design that real data would make possible.
# Installation, Testing, and Running this Package
## Environment Setup
1. unzip wind_trader.zip
2. install python dependencies (assuming you have `uv` installed already)
   ```bash
   cd wind_trader
   uv sync
   uv sync --dev
   ```
   
3. Install solver
	1. Download the IPOPT solver binary from: https://apmonitor.com/wiki/index.php/Main/DownloadIpopt
	2. unzip and copy the the IPOPT (v3.9.1) AMPL Executable (ipopt.exe on Windows; ipopt elsewhere)
	3. copy it to `wind_trader\bin`
4. Run tests (91% coverage on the main code: `optimizer.py`).  A TODO here is to add more numerical tests: simple, but I'm out of time...   
```bash
cd wind_trader
uv run pytest --cov=trading_optimizer --cov-report=term-missing --cov-report=html
```

5. View the Jupyter notebooks used to generate this report.
   ```bash
  cd ./notebooks
   ```

The notebooks are:

- `data_viewer.ipynb`:  preliminary data inspection
- `clear_smooth_test.ipynb`:  dev experiments with clearing probabilities
- `trader_Nhours_pyomo.ipynb`: the experiment runner
- `summarize_runs.ipynb`: makes tables and graphs from merged outputs of multiple runs of `trader_Nhours_pyomo.ipynb`
