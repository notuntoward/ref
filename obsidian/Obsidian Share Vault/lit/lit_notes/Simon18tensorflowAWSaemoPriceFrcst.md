---
category: literaturenote
tags: ml/genAI
citekey: Simon18tensorflowAWSaemoPriceFrcst
status:
  - read
dateread: 
ZoteroTags: noted, /unread, AEMO
aliases:
  - "AWS re:Invent 2018: Learning Applications Using TensorFlow, Advanced Microgrid Solutions (AIM401-R2)"
  - "AWS re:Invent 2018: Learning Applications"
publisher: ""
citation key: Simon18tensorflowAWSaemoPriceFrcst
DOI: ""
created date: 2024-04-04T11:04:57-07:00
modified date: 2024-08-18T00:30:10-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/PYFGTFK6)   | [**URL**](https://www.youtube.com/watch?v=VIEp4GR9BRc)
>
> 
> **Abstract**
> The TensorFlow deep learning framework is used for developing diverse artificial intelligence (AI) applications, including computer vision, natural language, speech, and translation. In this session, learn how to use TensorFlow within the Amazon SageMaker machine learning platform. Then, hear from Advanced Microgrid Solutions about how they implemented a deep neural network architecture with Keras and TensorFlow to forecast energy prices in near real time. Complete Title: AWS re:Invent 2018: [REPEAT 2] Deep Learning Applications Using TensorFlow, ft. Advanced Microgrid Solutions (AIM401-R2)
> 
> 
> **FirstScriptwriter**:: Simon, Julien  
> **Scriptwriter**:: Cliffod, Kevin  
> **Scriptwriter**:: Martinez, Andrew  
~    
> **Title**:: "AWS re:Invent 2018: Learning Applications Using TensorFlow, Advanced Microgrid Solutions (AIM401-R2)"  
> **Date**:: 2018-12-01  
> **Citekey**:: Simon18tensorflowAWSaemoPriceFrcst  
> **ZoteroItemKey**:: PYFGTFK6  
> **itemType**:: videoRecording  
> **DOI**::   
> **URL**:: https://www.youtube.com/watch?v=VIEp4GR9BRc  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: noted, /unread, AEMO
>**Related**:: 

> _AWS Re:Invent 2018: Learning Applications Using TensorFlow, Advanced Microgrid Solutions (AIM401-R2)_. 2018. _YouTube_, [https://www.youtube.com/watch?v=VIEp4GR9BRc](https://www.youtube.com/watch?v=VIEp4GR9BRc).
%% begin Obsidian Notes %%
___
An AEMO price forecast in some kind of TensorFlow.  Minute 46:20 reports the errors.

- Snippets from:  
[AWS re:Invent 2018: Learning Applications Using TensorFlow, Advanced Microgrid Solutions AIM401-R2](zotero://select/library/items/PYFGTFK6)
- This was also a test of the PreClip YouTube annotation browser extension.  What's below is the markdown it exported.
- Video URL: [https://www.youtube.com/watch?v=VIEp4GR9BRc](https://www.youtube.com/watch?v=VIEp4GR9BRc)
- Link to PreClip Notes: [https://reclipped.com/a/e1KWbGCOEe6AaN8iHVO-PA](https://reclipped.com/a/e1KWbGCOEe6AaN8iHVO-PA)

# My Summary Note

- [09:19](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=559s) Original TensorFlow, with its symbolic differentiation, required the network structure to be frozen during training. New "imperative" or "eager" execution option allows network changes, breakpoints, examining during "execution" (I think he means training), etc.

- [12:07](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=727s) Keras high level API, user friendly, the guy's personal favorite. At cost of performance but he says its a mistake not to try it.

- [14:18](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=858s) Pipe Mode lets you stream huge datasets from S3

- [16:06](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=966s) he has another demo on AWS's advanced features like Pipe Mode, Automatic tuning…

- [16:37](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=997s) Using Keras requires a custom container (on his other advanced container)

- [18:46](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1126s) Simple single hidden layer NN w/ 512 nodes gets \~95% on TIMIT (which I think is a small dataset?). Code is very short.

- [18:51](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1131s) Auto model tuning:: best is Bayesian Optimization w/ Gauss Proc. Regression (what I used for VDER)

- [25:51](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1551s) Advanced Microgrid AEMO Spot Market (NEM) Price Forecasting for AEMO

- [26:31](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1591s) 9 market products: energy and ancillary

- 24 hour span

- can rebid until the last 5 minutes

- battery is perfect for this market design

- [27:00](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1620s) Challenges

- last time to rebid: 90s before interval starts.

- current interval's info not available until 90 s after its start

- ==> have only 180 s to compute the bid for the next interval

     ==> time consumed by steps after deciding on bid means that have only 50s to do all the bid computations

    ![[fa010cf7d896416444e9ff88d96fad83_MD5.jpg]]originally: (https://s3.amazonaws.com/images.staging.reclipped.com/thumbnails/bb416a42d9b27da4f40a5c14d47d23d4_1709.535055.jpeg)
 ^eacc6d
- [29:44](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1784s) Price forecast accuracy requires predicting other participants bidding behavior up to the last 5 minutes (similar to EPEX liquidity problems, I think)
- [28:29](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1709s) References on why use NNs, says they are better than boosted trees (really?)>)
- [30:29](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1829s)

    [![[19a866057ea706b1d8c2e9c98060025b_MD5.jpg]]](https://s3.amazonaws.com/images.staging.reclipped.com/thumbnails/bb416a42d9b27da4f40a5c14d47d23d4_1829.991906.jpeg)

- [30:30](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1830s) Inputs include seasonality, weather, network outages, neighboring market conditions,

- it somehow picks up volatility changes

- [31:39](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1899s) Majority of their data comes from SQL (3rd party MS SQL instance, so must be in AWS? 

     Do they buy this?).

- replicates AEMO data

- Is constantly updating.

- somehow gets to S3, so the SQL is a front interface? Some job does this

- model training/tuning done in Sagemaker

- [32:07](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1927s) Does data version of every forecast output

- DymoDB (sp?) stores meta data: version, code version, etc.

- is data-versioned, so each forecast output is tagged with what data went into it, for replicability

- [32:53](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1973s) wrap model in lambda and implement operationally as a microservice. Get forecast by hitting an API (so code isolated?)

- [33:20](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=2000s)

- process pulls in live data from SQL, does preproc, pushes it to Sagemaker (via S3, as hinted at above?)

- then post proc & send to "us"

- implemented in AWS Chalice

- [34:05](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=2045s) learn deviation between AEMO forecast and "deviations" (prob forecast?)

- multiperiod forecast

- makes scenarios for stoch. opt.

- [35:18](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=2118s) Benchmark is 3 layer NN: input vector and output vector (of time periods, I'd guess)

- [35:34](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=2134s) uncertainty modeling: a quantile forecast.

- huge QR output: nForecastPeriods \* nQuantiles: 300 X 5 output

- [37:39](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=2259s) Made a keras custom QR loss function, like I did before

- [38:32](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=2312s) No Q cross--over visible i this plot

    [![[e7f7a07ea5c8424287b00602a271d47f_MD5.jpg]]](https://s3.amazonaws.com/images.staging.reclipped.com/thumbnails/bb416a42d9b27da4f40a5c14d47d23d4_2312.259507.jpeg) ^cyvx

- [39:47](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=2387s) Scenario generation using MVN covariance. Not clear if they did marginal inverse transforms first, to make it a copula, or if the covariance was conditional

- [40:46](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=2446s) sounds like they did only 3D MVN, dims were at [t-1, t, t+1]

- Simple model was improvement over original AEMO forecast

- [41:37](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=2497s) More advanced model was a CNN with dialation rate.(example showes dialation-3)

- receptive field grows explonentially, captures bot long & short-term dependencies

- stacked with "residual connections"

- [44:49](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=2689s) hypertune:

- 36 jobs (3 in parallel)

- 2 hrs/job

- 72 training hours ==> $100 to run (consiedered cheap)

- 20% diff in loss between jobs

- [46:42](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=2802s) Results:

- 68% MAE reduction

- 24% reduction in median abs error (says this captures spike misses better?

- no QR results, but says it helps bidding strategy

- recomendaion is to start simple, build model complexity gradually. Seemed to have taken a few months.


<!-- -->

**30:30-30:40**

Link: [https://reclipped.com/a/CBdwmGDXEe69HGflINdv6Q](https://reclipped.com/a/CBdwmGDXEe69HGflINdv6Q)

- [30:30](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1830s) Shows hyperparams they tuned

    [![[2b89b3adeb32c8b73d83c4cb4013e7b2_MD5.jpg]]](https://s3.amazonaws.com/images.staging.reclipped.com/thumbnails/bb416a42d9b27da4f40a5c14d47d23d4_1830.457048.jpeg)


<!-- -->

---

[30:30](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1830s)*conditions that you want to include in*

[30:31](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1831s)*your price forecast and you intuitively*

[30:33](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1833s)*know have influence on what the private*

[30:36](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1836s)*price forecast is going to be but you*

[30:38](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1838s)*don't know how much those features are*

[30:40](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1840s)*important and what the correlation*

[30:42](https://www.youtube.com/watch?v=VIEp4GR9BRc&t=1842s)*between those features are norm networks*
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Simon18tensorflowAWSaemoPriceFrcst
> 
> An AEMO price forecast in some kind of TensorFlow.  Minute 46:20 reports the errors.
> 
> **See** [my video notes in Obsidian](obsidian://open?vault=Obsidian%20Share%20Vault&file=work%2FpriceFrcstAEMO%2FSimon18tensorflowAWSaemoPriceFrcst%20YouTube%20Notes)
> 
> [test link 2](obsidian://open?vault=Obsidian%20Share%20Vault&file=priceFrcstAEMO%2FAEMO%20Market%20Timing)
> 
> <small>📝️ (modified: 2023-11-18) [link](zotero://select/library/items/PQEUCC98) - [web](http://zotero.org/users/60638/items/PQEUCC98)</small>
>  
> ---




%% Import Date: 2024-04-04T11:05:18.520-07:00 %%




---

