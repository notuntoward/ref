---
created date: 2025-03-27T15:23:43-07:00
modified date: 2025-03-27T15:23:43-07:00
---
 
 by [[Amazon Web Services]] 

**Summary Note** 
- 
```timestamp 
09:19 
``` 
 Original TensorFlow, with its symbolic differentiation, required the network structure to be frozen during training.  New "imperative" or "eager" execution option allows network changes, breakpoints, examining during "execution" (I think he means training), etc.
 
- 
```timestamp 
12:07 
``` 
 Keras high level API, user friendly, the guy's personal favorite.  At cost of performance but he says its a mistake not to try it. 
- 
```timestamp 
14:18 
``` 
 Pipe Mode lets you stream huge datasets from S3 
- 
```timestamp 
16:06 
``` 
 he has another demo on AWS's advanced features like Pipe Mode, Automatic tuning... 
- 
```timestamp 
16:37 
``` 
 Using Keras requires a custom container (on his other advanced container) 
- 
```timestamp 
18:46 
``` 
 Simple single hidden layer NN w/ 512 nodes gets ~95% on TIMIT (which I think is a small dataset?).  Code is very short. 
- 
```timestamp 
18:51 
``` 
 Auto model tuning:: best is Bayesian Optimization w/ Gauss Proc. Regression (what I used for VDER) 
- 
```timestamp 
25:51 
``` 
 Advanced Microgrid AEMO Spot Market (NEM) Price Forecasting for AEMO 
- 
```timestamp 
26:31 
``` 
 9 market products: energy and ancillary
- 24 hour span
- can rebid until the last 5 minutes
- battery is perfect for this market design 
- 
```timestamp 
27:00 
``` 
 Challenges
- last time to rebid: 90s before interval starts.
- current interval's info not available until 90 s after its start
- ==> have only 180 s to compute the bid for the next interval
 ==> time consumed by steps after deciding on bid means that have only 50s to do all the bid computations 
- 
```timestamp 
28:29 
``` 
  References on why use NNs, says they are better than boosted trees (really?)
 ![](https://s3.amazonaws.com/images.staging.reclipped.com/thumbnails/bb416a42d9b27da4f40a5c14d47d23d4_1709.535055.jpeg)
 
- 
```timestamp 
29:44 
``` 
 Price forecast accuracy requires predicting other participants bidding behavior up to the last 5 minutes (similar to EPEX liquidity problems) 
- 
```timestamp 
30:29 
``` 
  
 ![](https://s3.amazonaws.com/images.staging.reclipped.com/thumbnails/bb416a42d9b27da4f40a5c14d47d23d4_1829.991906.jpeg) 
- 
```timestamp 
30:30 
``` 
  Inputs include seasonality, weather, network outages, neighboring market conditions,
- it somehow picks up volatility changes
- 
```timestamp 
31:39 
``` 
 Majority of their data comes from SQL (3rd party MS SQL instance, so must be in AWS? 
 Do they buy this?).  
- replicates AEMO data
- Is constantly updating.
- somehow gets to S3, so the SQL is a front interface?  Some job does this
- model training/tuning done in Sagemaker
- 
```timestamp 
32:07 
``` 
  Does data version of every forecast output
- DymoDB (sp?) stores meta data: version, code version, etc.
- is data-versioned, so each forecast output is tagged with what data went into it, for replicability
- 
```timestamp 
32:53 
``` 
 wrap model in lambda and implement operationally as a microservice.  Get forecast by hitting an API (so code isolated?)
- 
```timestamp 
33:20 
``` 
  
- process pulls in live data from SQL, does preproc, pushes it to Sagemaker (via S3, as hinted at above?)
- then post proc & send to "us"
- implemented in AWS Chalice
 
- 
```timestamp 
34:05 
``` 
 learn deviation between AEMO forecast and "deviations" (prob forecast?)
- multiperiod forecast
- makes scenarios for stoch. opt.
- 
```timestamp 
35:18 
``` 
 Benchmark is 3 layer NN: input vector and output vector (of time periods, I'd guess) 
- 
```timestamp 
35:34 
``` 
 uncertainty modeling: a quantile forecast.  
- huge QR output: nForecastPeriods * nQuantiles: 300 X 5 output
- 
```timestamp 
37:39 
``` 
 Made a keras custom QR loss function, like I did before 
- 
```timestamp 
38:32 
``` 
  No Q cross--over visible i this plot
 ![](https://s3.amazonaws.com/images.staging.reclipped.com/thumbnails/bb416a42d9b27da4f40a5c14d47d23d4_2312.259507.jpeg)

- 
```timestamp 
39:47 
``` 
 Scenario generation using MVN covariance.  Not clear if they did marginal inverse transforms first, to make it a copula, or if the covariance was conditional 
- 
```timestamp 
40:46 
``` 
 sounds like they did only 3D MVN, dims were at [t-1, t, t+1]
- Simple model was improvement over original AEMO forecast
 
- 
```timestamp 
41:37 
``` 
 More advanced model was a CNN with dialation rate.(example showes dialation-3)
- receptive field grows explonentially, captures bot long & short-term dependencies
- stacked with "residual connections"

 
- 
```timestamp 
44:49 
``` 
 hypertune: 
- 36 jobs (3 in parallel)
- 2 hrs/job
- 72 training hours ==> $100 to run (consiedered cheap)
- 20% diff in loss between jobs

 
- 
```timestamp 
46:42 
``` 
 Results:
- 68% MAE reduction
- 24% reduction in median abs error (says this captures spike misses better?
- no QR results, but says it helps bidding strategy

- recomendaion is to start simple, build model complexity gradually.  Seemed to have taken a few months.


- 
```timestamp 
30:30 
``` 
 Shows hyperparams they tuned
 ![](https://s3.amazonaws.com/images.staging.reclipped.com/thumbnails/bb416a42d9b27da4f40a5c14d47d23d4_1830.457048.jpeg)
****

```timestamp 
30:30 
``` 
 *conditions that you want to include in*

```timestamp 
30:31 
``` 
 *your price forecast and you intuitively*

```timestamp 
30:33 
``` 
 *know have influence on what the private*

```timestamp 
30:36 
``` 
 *price forecast is going to be but you*

```timestamp 
30:38 
``` 
 *don't know how much those features are*

```timestamp 
30:40 
``` 
 *important and what the correlation*

```timestamp 
30:42 
``` 
 *between those features are norm networks*
****
