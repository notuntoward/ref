---
number headings: first-level 1, max 6, 1.1, auto
modified date: 2024-07-28T14:15:01-07:00
created date: 2024-12-17T08:51:31-08:00
---
# 1 Unsorted ideas
- price curve built somehow from fast power whole market sim (said Pascal in [[2024-04-12#AI4OPT Meeting]])
- Convex neural nets as a price forecast.  See "optimal control via..." in [[University Forecasting Research Search#UW Clean Energy Institute]].  This would be better than the Pinson Polyhedral.  The tricky part would be the scenario, because even if it's probabilistic, you need the time quantiles.  You'd need to somehow parameterize all of the actions you'd likely take in the future, given that the future is some state with some probability.  Maybe random draws, so a fan?  Or maybe you can still do something "polyhedral-like" but better since it's an NN.  And even though it's not linear, solvable b/c it's a convex NN.  But is there something in the scenario gen paper below?
  - GenAI ideas about convex
    - prompt: Are there techniques for simplifying a light GBM model into a neural net, ideally one that is convex in input?
    - answers: 
      - model distillation: learn trained lightgbm function w/ NN, which presumabably could be convex using UW alg.
      - Hybrid models: here's a [hybrid lightbm/NN classifier](https://www.gurobi.com/resources/intro-to-optimization-through-the-lens-of-data-science/)
  - The elect mkt price forecast transformer (still in zotero, probably, not in obsidian yet)
- Scenario gen: "model-free renewable scenario..." in [[University Forecasting Research Search#UW Power and Energy Systems]]
- Better battery aging models.  See "optimal battery control under cycling..." in [[University Forecasting Research Search#UW Clean Energy Institute]]
- Real-time prediction of distribution outages... in [[University Forecasting Research Search#UW Power and Energy Systems]]
- learn and include battery aging model in optimization ala [[Shi19optBattCtrlAging]]
- [ ] # ... and so on.. collect ideas from the rest of the papers in [[University Forecasting Research Search#University of Washington EE Research]]
## 1.1 Aggregated forecast and optimization
- [[Gade24LeveragingP90Requirement]]
- maybe using [[#Polyhedral Prob Forecasts|Polyhedral Prob Forecasts]]

## 1.2 Physical Solar Model or Physical Battery Degradation Model
- make KAN [[Wolf24simpleKAN]] usable for one of these applications, 
- compare with PySR [[Cranmer23interpMLrgrssnPySR]]
- for batteries, compare with [[Shi19optBattCtrlAging]]
## 1.3 Net Demand Learning
- reusable representation for solar/battery/household load, something like [[Nivarthi23MultiTaskRepresentationLearning]] and related (a few in smart-connections links)
## 1.4 Polyhedral Prob Forecasts
- Pinson Polyhedral paper has [lots of cites](https://scholar.google.com/scholar?start=10&hl=en&as_sdt=5,48&sciodt=0,48&cites=3596007907843671217&scipsc=), including for aggregation
# 2 Skills to learn
## 2.1 Optimization
- Free 8 hour course: [Introduction to Optimization Through the Lens of Data Science - Gurobi Optimization](https://www.gurobi.com/resources/intro-to-optimization-through-the-lens-of-data-science/)
- Many opt (contextual?) ideas: [[VanHentenryck24AI4OPTAIInstitute|VanHentenryck24: AI4OPT: AI Institute for Advances in Optimization]] 
