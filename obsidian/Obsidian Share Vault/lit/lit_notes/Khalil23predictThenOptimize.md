---
category: literaturenote
tags: 
citekey: Khalil23predictThenOptimize
status:
  - unread
dateread: 
ZoteroTags: obsLitNote
aliases:
  - Predict-then-optimize
  - Predict-then-optimize
publisher: ""
citation key: Khalil23predictThenOptimize
DOI: ""
created date: 2024-09-01T15:40:21-07:00
modified date: 2024-09-01T15:40:21-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/Z5CVQ4ZP)   | [**URL**](https://www.youtube.com/watch?v=pZqm-i57gxk) | [[Khalil23predictThenOptimize.pdf|PDF]]
>
> 
> **Abstract**
> In deterministic optimization, it is typically assumed that all parameters of the problem are fixed and known. In practice, however, some parameters may be a priori unknown but can be estimated from historical data. A typical predict-then-optimize approach separates predictions and optimization into two stages. Recently, end-to-end predict-then-optimize has become an attractive alternative. In this talk, I will provide an overview of the predict-then-optimize problem as well as a suite of end-to-end learning methods that have been developed independently in the operations research and machine learning communities. To ground the discussion, I will use the PyEPO package (https://github.com/khalil-research/PyEPO/), a PyTorch-based end-to-end predict-then-optimize library in Python. PyEPO (pronounced like 'pineapple' with a silent 'n') is the first generic tool for linear and integer programming with predicted objective function coefficients. It provides four base algorithms: a convex surrogate loss function from the seminal work of Elmachtoub & Grigas (2021), the differentiable black-box solver approach of Vlastelica et al. (2019), and two differentiable perturbation-based methods from Berthet et al. (2020). PyEPO provides a simple interface for the definition of new optimization problems, the implementation of state-of-the-art predict-then-optimize training algorithms, the use of custom neural network architectures, and the comparison of end-to-end approaches with the two-stage approach. PyEPO enables the first comprehensive comparison of these methods on problems such as Shortest Path, Multiple Knapsack, and the Traveling Salesperson Problem, including on an image dataset. The empirical insights therein could guide future research. Joint work with Ph.D. student Bo Tang at the University of Toronto
> 
> 
> **FirstDirector**:: Khalil, Elias  
~    
> **Title**:: "Predict-then-optimize: A tour of the state-of-the-art using PyEPO"
> **Date**:: 2023-08-01  
> **Citekey**:: Khalil23predictThenOptimize  
> **ZoteroItemKey**:: Z5CVQ4ZP  
> **itemType**:: videoRecording  
> **DOI**::   
> **URL**:: https://www.youtube.com/watch?v=pZqm-i57gxk  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**:: ACP Summer School 2023   
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: obsLitNote
> **Related**:: 

> _Predict-Then-Optimize: A tour of the state-of-the-art using PyEPO_. Directed by Elias Khalil, 2023. _YouTube_, [https://www.youtube.com/watch?v=pZqm-i57gxk](https://www.youtube.com/watch?v=pZqm-i57gxk).
%% begin Obsidian Notes %%
___

A video on a subset of [[Sadana24contextualOptSurvey|contextual optimization]] problems (largely graph traversal), with a focus on the [[Tang23end2endPredOptPyEPO|PyEPO]] implementation.

[Course Web Page: ML4CP](https://school.a4cp.org/summer2023/)

**FINISH THIS**

This is the video where JonD [said](https://growingenergylabs.slack.com/archives/D027MJ9CT25/p1718745820241049):

> ...they seem to say that there are serious problems if you are predicting parameter data and not just objective coefficients.

After watching this, it looks like the problem is with predicting constraints, as the (sub)gradients computed in these methods are not well-defined.  [[Khalil23predictThenOptimize#^6sl3|I'm not sure]] if PV+battery systems are "predicting constraints," but if they are, there may be help in [[Hu23branchLrnUnkParamCnstrnts]].  

See: [[Contextual Optimization#Contextual and constraints]]
# Introduction
- [01:13](https://www.youtube.com/watch?v=pZqm-i57gxk&t=74#t=01:13.66) linear cost functions, possible integer variables, we won't "care much about feasible set," whether it's convex or non-convex for now, "except for integrality"  (I think this means that it should be integrable?)
- you can address traditional optimization problem w/ appropriate algorithm: MILP, MIQCP, CP, custom
- [01:39](https://www.youtube.com/watch?v=pZqm-i57gxk&t=99#t=01:39.50) n optimization problems, 
	- each has its own objective function, output: (`c1-cn`, "cost vectors")
	- same feasible set
- `w` is decision variable vector (for graph probs discussed here, binary 0,1)
- independence
	- if assume independent opt problems, could run the independently and get same answer, i.e. `ci` aren't related
- [02:39](https://www.youtube.com/watch?v=pZqm-i57gxk&t=160#t=02:39.92) observed feature vector `X1-xhi`
	- costs depend upon feature vector: `ci = g(xi, theta)`.  
	- `g(xi, theta)` is the prediction part of the problem, the "forecaster"
	- cost being minimized is still *linear*: `c_hat^T w`
	- if knew `theta`, could just compute `ci` and then run normal optimization
	- if don't know `theta`, only `x`, then *estimate* `ci` and use that
- [06:19](https://www.youtube.com/watch?v=pZqm-i57gxk&t=380#t=06:19.53) learning problem is to learn `theta`
- [06:26](https://www.youtube.com/watch?v=pZqm-i57gxk&t=387#t=06:26.97) need gradient of cost w.r.t. `theta`
	- train
		- run optimizer w/ and estimated `ci_hat`
		- calc the gradient of cost w.r.t, `theta`
		- adjust `theta` to min cost (I think he said)
	- test time: use `g(x; theta)` and run optimizer
- [07:50](https://www.youtube.com/watch?v=pZqm-i57gxk&t=470#t=07:50.02) Example: route planning "s-t" shortest path
	- `xn` is the `nth` hour of the day
	- `ci,k` is the travel delay
	- `s` and `t` are route start/end nodes, many nodes to route through in between `s` and `t`
	- `cik` cost of travel on edge `i` at hour `k` (or whatever set of features indexed by `k`, I guess)
	- [10:04](https://www.youtube.com/watch?v=pZqm-i57gxk&t=604#t=10:04.10) *Prediction Problem* is travel time of an edge (road segment)
	- [10:44](https://www.youtube.com/watch?v=pZqm-i57gxk&t=645#t=10:44.84) `xk` is binary (1 if take edge `k` else 0)
- [11:40](https://www.youtube.com/watch?v=pZqm-i57gxk&t=701#t=11:40.72) *constraints*: he'll mention a recent paper on this on the last side of this lecture (note that the students were apparently mailed slides.  Could I get them?)
	- he won't talk the constraint problem here
	- @ but infeasibility constraints "ruin" the clean prediction learning shown in this lecture.
	- but, if constraints are available (not predicted), then can just modify the `lp` (linear predictor, I think)
- [13:36](https://www.youtube.com/watch?v=pZqm-i57gxk&t=816#t=13:36.38) why not use squared prediction error as the loss function ?  In graph...
	- circles are cost vs. x of choosing edge 1
	- squares, of choosing edge 2
	- dotted line is the actual cost
	- Djikestra (sp?) solves w/ greedy decision, I think, taking the edge the has lowest cost at a given node (no lookahead).  
	- but if you fit lines to predict cost w/ x
		- breakpoint where edge1 is optimal, shifts to the left
	- both lines are good fits (assuming that linear predictor) but they *shift the decision* point away from the true optimal
	- original paper fits really weird function to get the right decision point
	- This shows why simply lsq fitting prediction isn't ideal
- [20:01](https://www.youtube.com/watch?v=pZqm-i57gxk&t=1201#t=20:01.46) Regret (decision error)
	- `regret`: diff between *decision cost* w/ perfect prediction of *edge cost* minus cost w/ iestimated edge cost
# End-to-end Gradient descent
- [22:20](https://www.youtube.com/watch?v=pZqm-i57gxk&t=1341#t=22:20.55) **End-to-end Gradient Descent**
	- ![[Khalil23predictThenOptimize-20240624171725298.webp]]
	- assume differential models (linear regression --> deep learning)
	- assume fixed feasible region
		- s and t fixed
	- `epoch`: 1 pass through all training data
	- `batch`: a subset of training data 
	- note: solver (optimizer) *runs on each minibatch!*
	- `gradient`: chain rule derivation:
		- (gradient of decision vs. decision cost loss, is hard) 
			- x (gradient of decision cost_est vs. theta, easy, can get from NN pkg backprop pkg)
# SPO+
- [28:44](https://www.youtube.com/watch?v=pZqm-i57gxk&t=1724#t=28:44.26) why is 1st part of gradient above hard?
	- lp: all vertices are optimal solutions
	- so small change in regret means you can have a big jump to another vertex, 
	- making gradient undefined
- can't diff regret, but can optim. some simple upper bound on regret
- So SPO+ uses a convex upper bound on regret
    - SPO+ paper: [[Elmachtoub22SmartPredThenOptSPO+]]
	- used the SVM hinge loss
	- requires solving an minimization problem itself (not the main optimization) on the forward pass
	- not differentiable everywhere but have sub-gradient, so can do sub-gradient descent
		- this is also what you really do with an NN with RELU nodes (not diff @ 0)
- this is simple like full solve (?)
- [34:29](https://www.youtube.com/watch?v=pZqm-i57gxk&t=2069#t=34:29.35) any large problem will require hours to train, w/ SPO+, I think
- [37:36](https://www.youtube.com/watch?v=pZqm-i57gxk&t=2256#t=37:36.12): **don't need to differentiate NN steps** w/ this method; just need the values
	- [ ] ? what does mean?  you still need NN gradients, otherwise, you won't be able to train the NN w/ backprop
- [40:44](https://www.youtube.com/watch?v=pZqm-i57gxk&t=2445#t=40:44.58) SPO+ was the "funky" loss function shown previously.  A poor line fit but gives optimal solution
- [38:59](https://www.youtube.com/watch?v=pZqm-i57gxk&t=2339#t=38:59.49) for non-lp problem (like shortest path in example), can do relaxation
# PFYL:Perturbed Fenchel-Young Loss
- [42:06](https://www.youtube.com/watch?v=pZqm-i57gxk&t=2527#t=42:06.51): change setup (training data)
- assume don't observe edge travel times, only optimal solutions
- e.g. Amazon drivers may take different the estimated results; task was to solve for these routes, since Amazon drivers saw something not seen by algorithm (the researchers knew these routes were optimal, somehow)
- [43:50](https://www.youtube.com/watch?v=pZqm-i57gxk&t=2630#t=43:50.31) best solution in challenge was non-ML method
- [44:54](https://www.youtube.com/watch?v=pZqm-i57gxk&t=2694#t=44:54.08) can't do this in SPO+ method: requires knowing c, not available here
- [45:12](https://www.youtube.com/watch?v=pZqm-i57gxk&t=2712#t=45:12.02) PFYL: Perturbed Fenchel-Young Loss
	- PFYL paper: [[Berthet20LrnDiffPerturbOptPFYL]]
	- invented for structured prediction, not shortest path
	- idea: estimate something like gradient of regret w.r.t predictions, by subtracting from optimal cost, the average cost of perturbed samples of your estimated cost
	- expensive b/c must solve a ton of optimization probs in the average, but many not need many to average (can sometimes get "average" of one optimization)
# "Learning to Rank" reduces solver calls
- [47:51](https://www.youtube.com/watch?v=pZqm-i57gxk&t=2872#t=47:51.85) do observe the "coefficients".  See table
- use surrogates e.g. "Learning to Rank" paper
	- somehow have solutions to the shortest path problem
	- compute loss of 2 predictions of objective function path cost)
	- rank the solutions vs. true objective??
	- want to predict cost that maintain this ranking (all you need, since you pick one in the end)
	- error is then "rank error," how you select
	- collect these solutions during gradient descent
	- Learning-to-rank papers mentioned
		- [[Mandi22DecisionFocusLearnToRank]]
		- [[Mulamba21contrastiveLossPredAndOpt]]
- This is less label-intensive than regression, not so harsh as classification
- [51:17](https://www.youtube.com/watch?v=pZqm-i57gxk&t=3078#t=51:17.76) implemented in PyEPO
- [ ] ? Is this only for discrete problems?  For batteries, could the classes be "full discharge", "full charge", 'do nothing"?
	- i.e. is battery operation analogous to a choice of fixed paths, over time, where the nodes are only for discrete problems?  Could the classes be "full discharge", "full charge", 'do nothing"?
	- each step you could only pick 1 of these three for the next state
	- "path" cost would be charging cost or discharge profit
- Later, he [[Khalil23predictThenOptimize#^bcjh|uses ResNet-18 as a predictor]] with transfer learning I suppose, with good results
# PyEPO Programming
- [[Tang23end2endPredOptPyEPO|PyEPO: A PyTorch-based End-to-End Predict-then-Optimize Library for Linear and Integer Programming]]
- [56:57](https://www.youtube.com/watch?v=pZqm-i57gxk&t=3418#t=56:57.83) optimization and learning side are integrated, w/ benchmarking facilities, mainly synthetic
- PYOMO/Gurobi/custom + PyTorch/sklearn
	- sklearn would be for a min-error prediction e.g. RF.  Any other use?
- has the algorithms above e.g. SPO+, ranking, ...
- Benchmarks
	- [01:01:44](https://www.youtube.com/watch?v=pZqm-i57gxk&t=3704#t=1:01:44.41) Bernoulli configurable polynomial dependence
	- [01:03:55](https://www.youtube.com/watch?v=pZqm-i57gxk&t=3836#t=1:03:55.83) Warcraft shortest path
		- won't work w/ linear model, so must train more complicated 
		- too many pixels to flatten the image and feed to NN
		- below, used ResNet
- [01:06:36](https://www.youtube.com/watch?v=pZqm-i57gxk&t=3997#t=1:06:36.57) Gurobi optimization
	- looks relatively simple
	- example has constraints.  
		- ? Aren't constraints a problem? As mentioned above?
	- [01:08:05](https://www.youtube.com/watch?v=pZqm-i57gxk&t=4086#t=1:08:05.84) [[Tang23end2endPredOptPyEPO|PyEPO]] has integrated support for model solve, if don't use Gurobi, need to add some stuff, I guess
- [01:08:20](https://www.youtube.com/watch?v=pZqm-i57gxk&t=4100#t=1:08:20.39): creating dataset: must use a PyTorch object for this
- [01:09:36](https://www.youtube.com/watch?v=pZqm-i57gxk&t=4177#t=1:09:36.59) creating a model (PyTorch linear regression example)
	- [01:10:43](https://www.youtube.com/watch?v=pZqm-i57gxk&t=4243#t=1:10:43.08) End-to-end training in PyTorch
# PyEPO experimental results
- synthetic data benchmark w/ varying degree polynomial true prediction function
	- [01:11:39](https://www.youtube.com/watch?v=pZqm-i57gxk&t=4299#t=1:11:39.30) was in their arXiv paper
	- [01:13:28](https://www.youtube.com/watch?v=pZqm-i57gxk&t=4409#t=1:13:28.58) End-to-end learning w/ SPO+ (end to end) beats 2-stage w/ linear regression learner (features to cost, not end to end)
		- [ ] ? Is SPO+ end to end also learning a linear regression cost model?
	- [01:13:37](https://www.youtube.com/watch?v=pZqm-i57gxk&t=4418#t=1:13:37.77) but 2 stage RF not so bad
	- [01:14:22](https://www.youtube.com/watch?v=pZqm-i57gxk&t=4463#t=1:14:22.97) says you'll lose to two-stage method if have a lot of data e.g. RF w/ 5k training point TSP beats all end-to-end
		- # better to do accurate prediction and 2 stage model if have lots of data!
			- but that required and easy-to-learn function
		- [ ] ? Do we have "easy to learn" w/ the data we have problems?
			- seems like no
				- AEMO price
				- C&I load
- [01:15:33](https://www.youtube.com/watch?v=pZqm-i57gxk&t=4534#t=1:15:33.92) SPO+ or PYYL are best of both worlds?
	- want both low MSE and low regret
	- 2 algs are on Pareto frontier (best o' both)
		- the algs
			- SPO+ w/ L2 regularization on predicted coeffs
			- PFYL w/ L2 regularization
	- still polynomial synthetic test data
		- *looks like PFYL might be slightly* better: lower computation, slightly better MSE and regret
		- 2 stage opt w/ separate RF predictor: better MSE but worse regret
			-  1000 training samples)
	- tune the regularization lambda
		- [ ] ? is this weighting MSE and getting whatever regret??
		- he recommends this, as practitioners would see reasonable predictions, not crazy ones that give optimal decisions
		- do *hyperparam tuning on this lambda*
- [01:17:32](https://www.youtube.com/watch?v=pZqm-i57gxk&t=4652#t=1:17:32.09):Warcraft Shortest Path Benchmark
	- ResNet-18 (5 layers of) for this 2D test ^bcjh
	- But 10K training points, ResNet powerful
	- By itself, it has near optimal regret
	- SPO+ is tied for best
	- PFYF: almost zero regret too
		- advantage, doesn't see the cost cost
		- does best at matching optimal path
# Summary
- In written form: [[Tang23end2endPredOptPyEPO|PyEPO: A PyTorch-based End-to-End Predict-then-Optimize]]
- [01:19:20](https://www.youtube.com/watch?v=pZqm-i57gxk&t=4761#t=1:19:20.63) predict-then-optimize is "highly practical"
- but stochastic optimizers are "a different perspective," could be equivalent, I think he kind of says: [01:19:29](https://www.youtube.com/watch?v=pZqm-i57gxk&t=4770#t=1:19:29.75) 
- SPO+ and PFYL very effective for end-to-end
- noise-contrastive and learning to rank results will be published soon
	- [ ] # look for this paper
- 2-stage is adequate if have large scale data
 (1000 training samples) gives  (1000 training samples) gives 
	- **predictions in constraints**: see [[Hu23branchLrnUnkParamCnstrnts]]
		- when predictions are in constraints, loss for infeasible is undefined
		- Also see [[Contextual Optimization#Contextual and constraints]] and [[Contextual Optimization#Does a PV+Battery System Predict Constraints?]]
	- **reduce train time**: one kind of this is [[Tang24fastPredictConeBinOptCaVE]]
	- **applications**
___
%% end Obsidian Notes %%

%% Import Date: 2024-06-21T12:01:40.872-07:00 %%
