---
category: literaturenote
tags: 
citekey: Donte23optInLoopTalk
status: unread
dateread: 
ZoteroTags: obsLitNote
aliases:
  - Optimization-in-the-loop ML for energy and climate
  - Optimization-in-the-loop ML for energy and
publisher: ""
citation key: Donte23optInLoopTalk
DOI: ""
created date: 2024-08-24T12:15:06-07:00
modified date: 2024-08-24T12:15:06-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/IX3DPI2J)   | [**URL**](https://www.youtube.com/watch?v=yren7Dq92yc) | [[Donti23optInLoopTalk.pdf|PDF]]
>
> 
> **Abstract**
> Title: Optimization-in-the-loop ML for energy and climate  Speaker: Priya Donti, MIT and Climate Change AI  Abstract: Addressing climate change will require concerted action across society, including the development of innovative technologies. While methods from machine learning (ML) have the potential to play an important role, these methods often struggle to contend with the physics, hard constraints, and complex decision-making processes that are inherent to many climate and energy problems. To address these limitations, I present the framework of “optimization-in-the-loop ML,” and show how it can enable the design of ML models that explicitly capture relevant constraints and decision-making processes. For instance, this framework can be used to design learning-based controllers that provably enforce the stability criteria or operational constraints associated with the systems in which they operate. It can also enable the design of task-based learning procedures that are cognizant of the downstream decision-making processes for which a model’s outputs will be used. By significantly improving performance and preventing critical failures, such techniques can unlock the potential of ML for operating low-carbon power grids, improving energy efficiency in buildings, and addressing other high-impact problems of relevance to climate action.  About the speaker: Priya Donti is an Assistant Professor at MIT EECS and LIDS, whose research focuses on machine learning for forecasting, optimization, and control in high-renewables power grids. Specifically, her work explores methods to incorporate the physics and hard constraints associated with electric power systems into deep learning workflows. Priya is also the co-founder of Climate Change AI, a global non-profit initiative to catalyze impactful work at the intersection of climate change and machine learning. Priya received her Ph.D. in Computer Science and Public Policy from Carnegie Mellon University, and is a recipient of the MIT Technology Review’s 2021 “35 Innovators Under 35” award, the ACM SIGEnergy Doctoral Dissertation Award, the Siebel Scholarship, the U.S. Department of Energy Computational Science Graduate Fellowship, and best paper awards at ICML (honorable mention), ACM e-Energy (runner-up), PECI, the Duke Energy Data Analytics Symposium, and the NeurIPS workshop on AI for Social Good.  Location: This is an online seminar. Connect using Zoom.  Date: 2023-11-02 15:00  Upcoming seminars:      2023-11-09, 15:00: Nataša Sladoje, Uppsala University     2023-11-16, 15:00: Jonas Hellgren, RISE     2023-11-30, 16:00: Ben Weinstein, University of Florida     2023-12-07, 15:00: Stefan Bauer, TU Munich     All times are in CET.  More information and coming seminars: https://ri.se/lm-sem  – The Learning Machines Team
> 
> 
> **FirstDirector**:: Donti, Priya  
~    
> **Title**:: "Optimization-in-the-loop ML for energy and climate"  
> **Date**:: 2023-11-06  
> **Citekey**:: Donte23optInLoopTalk  
> **ZoteroItemKey**:: IX3DPI2J  
> **itemType**:: videoRecording  
> **DOI**::   
> **URL**:: https://www.youtube.com/watch?v=yren7Dq92yc  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: obsLitNote
> **Related**:: 

> _Optimization-in-the-Loop ML for Energy and Climate_. Directed by Priya Donti, 2023. _YouTube_, [https://www.youtube.com/watch?v=yren7Dq92yc](https://www.youtube.com/watch?v=yren7Dq92yc).
%% begin Obsidian Notes %%
___

# Raw Video Notes
## ML use
- [09:09](https://www.youtube.com/watch?v=yren7Dq92yc&t=549#t=09:09.13) examples: adaptively control generators, inverters, batteries
	- ML dynamic, data-driven
	- but ML goes for best mean perf
- [09:56](https://www.youtube.com/watch?v=yren7Dq92yc&t=597#t=09:56.68) : predicting demand
	- but trained separately, not aware of error tradeoffs
	- accuracy doesn't capture how "good" a forecast is
## Opt in Loop
	
- [11:44](https://www.youtube.com/watch?v=yren7Dq92yc&t=705#t=11:44.91) optimization in loop ML: her thing
	- not talking about gradient descent of ML in this case
	- means: can formulate opt. probs capturing decision procedures
		- embed those into ML model, OR into objective function
- [13:16](https://www.youtube.com/watch?v=yren7Dq92yc&t=797#t=13:16.73) Robust control
	- like reinf. lrn: model sets action based on system state
	- put saftety and robustness in that model
- [14:10](https://www.youtube.com/watch?v=yren7Dq92yc&t=850#t=14:10.48) forecasting
	- write relationship between forecast-based decision and feed back to forecasting model
	- hope model avoids learning to make costly errors
## Q&A
- *provable* optimization?  She'll get to that next
## Differentiable optimization
- put optimization in a deep NN layer
- backprop requires that everything is differentiable: layers, loss function, ....
- after solving opt, can write down opt. conds, figure out how to take derivs of them
- example: convex quadratic program
	- solve it w/ standard method
	- get KKT optimality condtions
		- describes all optimal solutions
	- take derives through them, get a matrix w/ primal and dual variables (derivatives of solutions to opt, both primal and dual variables) w.r.t all params
	- z is decision variable (output); everything else is an input or a parameter
	- can solve to get derivs
	- [23:48](https://www.youtube.com/watch?v=yren7Dq92yc&t=1429#t=23:48.97) use Jacobian vector trick for deriv of loss, for efficient backprop
- [24:38](https://www.youtube.com/watch?v=yren7Dq92yc&t=1479#t=24:38.64) other papers differentials through non-convex problems (she gives a list)
- inherit all benefits and limitations of solver
- input to output of NN comes from opt solver
- output to input gradient comes from diff. through some prop.  
- backprop wrapping everything doesn't guarantee optimality
- [26:53](https://www.youtube.com/watch?v=yren7Dq92yc&t=1614#t=26:53.86) computational overhead: 
	- opt. costs much more than standard NN layer.
	- so tradeoffs
		- so... fast inference somehow makes opt. be there only during training 
		- or abstract opt to a loss function during training
	- OR: if must learn constraints from scratch
		- learn constraints from data: need a lot more
		- but can provide some priors
- [28:18](https://www.youtube.com/watch?v=yren7Dq92yc&t=1699#t=28:18.93) is opt. anywhere in NN?  Doesn't that change input meanings?
	- yes, do have to do something so opt ins/outs make sense:
	- place as last layer if need output to have a certain meaning
	- inputs have certain meaning: then put opt in 1st layer
	- middle: pretrain part that's feeding into the opt. layer so know opt ouputs are reasonable w.r.t inputs, rest of NN continues end-to-end train
	- [29:38](https://www.youtube.com/watch?v=yren7Dq92yc&t=1778#t=29:38.07) if optimization is a good prior for something, then you can put it anywhere as a generic building block, mix w/ conv layers, etc.
- [30:20](https://www.youtube.com/watch?v=yren7Dq92yc&t=1820#t=30:20.34) how handle uncertainty, robust?
	- yes, you can, must think about assumptions, differentiable
	- write down stoch opt prob
	- in 2nd example, will discuss that
## Setting Hard Constraints
- [32:26](https://www.youtube.com/watch?v=yren7Dq92yc&t=1946#t=32:26.22) use opt in loop RL to guarantee hard constraints
- Two schools of RL vs. robust control
	- [33:20](https://www.youtube.com/watch?v=yren7Dq92yc&t=2000#t=33:20.38) RL/deep RP: "basically trial and error"
		- propose action and get feedback
		- update over time in simulator
		- get a good control policy
		- pro: well-performing policy
		- con: potential huge failures
	- [35:11](https://www.youtube.com/watch?v=yren7Dq92yc&t=2112#t=35:11.53) Robust control
		- write an uncertainty set
		- provable stability guarantees
		- pro: can reason about behavior
		- con: simple policies e.g. linear
- Do better?  Get pros of both?
- project NN-proposed action onto set of derived safe suggestions: take action that's that projection
- projection: can be an opt. problem.
- Train model on this system, back-propagating RL reward
- the projection is provably robust
- [39:01](https://www.youtube.com/watch?v=yren7Dq92yc&t=2342#t=39:01.63) isn't projection discrete? 
	- it's an L2 projection onto a 2nd order cone: a convex opt.
	- this reuses Lyapunov stability criteria, standard stuff
	- don't fully know underlying dynamics
	- it's linear in that state time evolution is linear function of state, action, disturbance
	- but dynamics described by lin model can be nonlin. b/c disturbance can be nonlin func of state, exogenous factors, etc.  But there's a bound on disturbance
- [39:52](https://www.youtube.com/watch?v=yren7Dq92yc&t=2393#t=39:52.91)  Lyapunov function: small means close to stability
	- exponential stability criterion: if controller reduces L. func by X always, then driving L. func to zero & that's stable
- [42:19](https://www.youtube.com/watch?v=yren7Dq92yc&t=2539#t=42:19.28) say you're at a state
	- what actions guarantee stability even if uncertainty of dynamics are as bad as possible (comparable to prob bound of forecast error?)
	- algebra lets you find it
## Results for Hard Constraint methods
- [43:40](https://www.youtube.com/watch?v=yren7Dq92yc&t=2621#t=43:40.59) synthetic data, I think
- graphs of "LQR cost"
- somewhat smaller (log scale) cost on 2 of her algorithms than under standard Robust LQR
- adversarial setting: construct the worst case disturbance 
	- average performance is better than Robust
	- but adversarial case about the same as robust
	- see that non-robust methods blow up
- says this is good
- downside: most computational intensive methods
	- reduced forms can help
	- lots of work to do on speed
## Energy efficient heating and cooling 
- [x] This is about this paper: [[Chen21enforcePolicyFeasibilityOpt]]
- [47:39](https://www.youtube.com/watch?v=yren7Dq92yc&t=2860#t=47:39.72) Controller for HVAC.  Need to handle comfortable temp, supply water temp, ...
- [ ] # Would this be more like battery operation?
## Downstream decision making (forecasting related)
- [50:18](https://www.youtube.com/watch?v=yren7Dq92yc&t=3018#t=50:18.11) decision-cognizant electricity demand forecasting.  Sounds like a papers read:
	- [x] from slides and [Donti Publications](https://priyadonti.com/publications/), the papers were:
		- [x] # DAK2017: [[Donti17taskEndToEndLrnStochOpt]]
		- [x] # DRK2021: [[Donti21learnMethHardCnstrntsDC3|DC3: A learning method for]]
- [50:40](https://www.youtube.com/watch?v=yren7Dq92yc&t=3041#t=50:40.71) the usual forecasting algorithm: min RMSE, neg log lik, etc.: **cost is a distance** between predicted and actual
- But **decision cost** made as result of forecast is what matters
- [53:07](https://www.youtube.com/watch?v=yren7Dq92yc&t=3188#t=53:07.59) opt is differentiable so can backprop through it
- # **BUT** probabilistic, assume gaussian demand, so predict mean and std.  Not great.
- [54:22](https://www.youtube.com/watch?v=yren7Dq92yc&t=3262#t=54:22.25) Demo
	- accuracy-optimizing model has better avg. acc
	- but task-based forecast has lower error cost (39% better)
## Summary
...
## Q&A
- [57:21](https://www.youtube.com/watch?v=yren7Dq92yc&t=3442#t=57:21.88) : what is decision "cost" in last example?
	- reliability cost and economic
- [58:03](https://www.youtube.com/watch?v=yren7Dq92yc&t=3484#t=58:03.61) how generalizable?
	- they generally train forecast model for accuracy first
	- then fine-tune on task loss
	- but not clear when robust approach works better than straight accuracy training
- [59:25](https://www.youtube.com/watch?v=yren7Dq92yc&t=3565#t=59:25.49) explainability?
	- how far from optimality? etc.?
	- how see causality fitting in?
	- answer:
		- here, don't need to prove what NN does in detail
		- only what output does (when optimization is on output end, in forecasting)
		- this establishes trustworthiness
		- causality: no strong opinions
- [01:01:28](https://www.youtube.com/watch?v=yren7Dq92yc&t=3688#t=1:01:28.02) how NN opt. different from physics-informed NN?
	- [ ] ? phys-inf: embedded in NN, loss suggests, allows tradeoff between performance and constraints (the forecast example, I think?)
	- if in last layer projection (as in opt example, I think) giving no option, but encourage NN to do best it can.

___
%% end Obsidian Notes %%



%% Import Date: 2024-05-08T17:59:57.185-07:00 %%
