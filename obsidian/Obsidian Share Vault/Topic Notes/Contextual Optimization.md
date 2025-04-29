---
modified date: 2025-04-24T17:09:36-07:00
created date: 2024-12-17T08:51:31-08:00
---
# TODO
- [ ] # get all the zotero contextual opt papers in here, esp. ones in category fromsadanareview
# Points
## When to use contextual optimization
- [[Khalil23predictThenOptimize]] finds that if you have a lot of data, and if the prediction problem is easy enough, then 2 stage outperforms end-to-end, even if the external predictor is a rudimentary, deterministic random forest.  He also kind-of says that stochastic optimization is another way to skin this cat, that it might be equivalent.  To me, this says
	- end-to-end makes sense only when the forecast is bad
	- maybe then, it does better because errors [[Khalil23predictThenOptimize]][[#Does a PV+Battery System Predict Constraints?|Does a PV+Battery System Predict Constraints?]] are unavoidable, and the predictor is tuned to sacrifice MSE or whatever, to avoid especially expensive errors (and which errors are expensive is something only the optimizer knows)
## Contextual and constraints
- [[Khalil23predictThenOptimize]] says gradients are hard to define when constraints are being forecasted, that his methods assumed that all solutions are feasible.
- but he mentions a workaround in this paper:[[Hu23branchLrnUnkParamCnstrnts]]
- Reinforcement learning method for handling constraints: [[Chen21enforcePolicyFeasibilityOpt]]
- Differentiable constraint handler: [[Donti21learnMethHardCnstrntsDC3]]
- Robust way to handle constraints: [[Agarwal22adversRobustStochOptPowFlow]]
- Handles constraints somehow, I think: [[Donti22deeplLrnPowSysPhD]]
- Says "constraint": [[Donti23optInLoopTalk]]
- Says "constraint": [[Tang24fastPredictConeBinOptCaVE]]
- Handling CV bias while handling constraints: [[Gupta24DebiasingInSamplePolicy]]
- End-to-end for inventory and grid schedule (must be constrained): [[Donti17taskEndToEndLrnStochOpt]]
### Does a PV+Battery System Predict Constraints?
- In [[Sang22elecPriceFrcstDcsnFocus]], battery storage was controlled but price was predicted, so constraints were clearly not in the predictand.  But [[Wahdany23endToEndWindOptSys]] does an end-to-end wind generation forecast, and deals w/ constraints (same?).
- this paper does this
- [ ] ? for PV/battery system, are constraints being predicted? ^6sl3
	- forecasts: load, PV
	- constraints are: on SOC?
- Tree splits based on decision, constrained version: [[Kallus23StochasticOptimizationForests]]
### Contextual Computation Time

Many say that contextual approaches require a lot of CPU e.g. [[Donti23optInLoopTalk]], [[Khalil23predictThenOptimize]], and [[Sadana24contextualOptSurvey]]

Papers that specialize in reducing computational load
- [[Tang24fastPredictConeBinOptCaVE]]
- Tree splits based on decision, not accuracy.  Low Compute: [[Kallus23StochasticOptimizationForests]]
- [[Mandi22DecisionFocusLearnToRank]]
- [[Mulamba21contrastiveLossPredAndOpt]]
### Decision Tree Methods in Contextual Optimization
Boosted trees are good for forecasting ([[Manokhin23worksTSfrcstNixtla]], [[Januschowski22ForecastingTrees]], [[Lainder22frcstGBTaugTuneCV]]).  How get them into contextual optimization?
- **Simple**: Train a GBT forecaster separately; its output is an optimizer `x` input.  
	- Inside optimization is a neural decision based tuner, looking at `x` and whatever other external conditioning inputs.
	- There could even be a decision-based net load estimator, which sums external PV and load forecasts.
- Tree splits based on decision, not accuracy. Low Compute, constrained: [[Kallus23StochasticOptimizationForests]]
- Backprop for boosting
	- Backprop for gradient boosting. Get [[LightGBM]] into Contextual Opt.?: [[Valdes22repGradBoostBackprop]]
	- another GB via backprop: [[Zhang21LrnMultiLayerBDTbackprop]]
## Contextual and Price Curves
- [[SaezGallego17invOptFrcstElecMktPrice|SaezGallego17: Inverse Opti & Forecast, Decision-making, Elect Mkts]]: does liquidity, load forecasting
# Papers
- [x] [[Sang22elecPriceFrcstDcsnFocus|Electricity price prediction for energy storage system arbitrage: A decision-focused approach]]
- [x] [[Sadana24contextualOptSurvey|A survey of contextual optimization methods for decision-making under uncertainty]]
- [ ] [[Donti22deeplLrnPowSysPhD|Bridging deep learning and electric power systems]]
- [x] [[Donti23optInLoopTalk|Optimization-in-the-loop ML for energy and climate]]
- [ ] SPO+ paper: [[Elmachtoub22SmartPredThenOptSPO+]]
- [ ] PFYL paper: [[Berthet20LrnDiffPerturbOptPFYL]]	
- [ ] DTU opt/frcst: [[Chatzivasileiadis22powSysMLseminar|Chatzivasileiadis22: Machine Learning for Power Systems: Is it time to trust it?]] 

# AI4OPT contextual optimization
- [[VanHentenryck24AI4OPTAIInstitute|VanHentenryck24: AI4OPT: AI Institute for Advances in Optimization]] 

# Software
- [[Tang23end2endPredOptPyEPO|PyEPO: A PyTorch-based End-to-End Predict-then-Optimize Library for Linear and Integer Programming]]
# Related
- [[Linear Optimization]]
- [[Bertsimas97linOptIntroBk]]
- 
