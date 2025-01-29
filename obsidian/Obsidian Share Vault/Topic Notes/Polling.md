---
created date: 2024-10-23T13:59:03-07:00
modified date: 2024-11-03T11:54:56-08:00
tags:
  - polling
  - statistics
  - politics
---

# My Polling Ideas

## Generic underrepresented survey respondent model

Idea is to directly predict any kind of underrepresented voter, rather than correcting for R/D, education, etc. Hopefully, this would result in better [[Concept Drift and Adaptation]] handling.

- Do high quality, high financial reward, random selection surveys like in [[Lau23compareProbPanelsPoll]] , but collect a huge number of demographic and preference answers 
	- don't ask political questions
	- subsample the ones for each questionnaire so there aren't so many Qs
- Also do a bunch of low quality (of the type you want to correct) 
	- survey the subsamples of the same respondents who answered the high quality survey
	- ask political questions this time
	- track who did/didn't respond
- The learned model
	- Prediction target: probability of responding to a low quality survey
	- Prediction inputs: the demographic and preference answers
		- handle missing features (questions not in the subsample)
		- do feature selection
	- The prediction
		- handle missing features again
		- pr
- @ There are certainly infeasible things here. Think about it.

## Generic underrepresented voter model

Similar the [[#Generic underrepresented survey respondent model|Generic underrepresented survey respondent model]] but regression target is the probability of *not responding but actually voting*. Seems like this would more directly predict the thing polls care about: actual voters.

- would need to merge in voting data in order to figure out target
- not sure if "frequent voter" tags should be an input.  
	- Would be predictive but also cheating
	- Maybe feature is "frequent voter in last election"

## Poll frequency normalized exponential weighting

Somewhere, I read that current poll averages give more weight to more frequent polls. Also, I've heard that, near the 2024 General election, R polling firms are releasing polls more frequently. 

If these things are true, and if the R polls are simply more frequent, and not a last minute cloud of different polls, then this problem could be solved by normalizing a poll by the number of instances in it within the averaging time window i.e. Compute the same exponential time-weighting for all polls within the window, and then grouping the polls coming from the same poll maker, and dividing their weighted results by the number of polls by that maker.  Or something like that.  Would also have to deal with the fact that "exponential" is non-zero to t = -infinity.  Note that you'd have to do the normalizing before averaging across polls. 

If the more frequent polls are a last minute cloud of new polls by new poll makers, then this problem can be reduced by prohibiting new polls from entering into the all-polls average for, say, 10 weeks before the election. This won't totally solve the problem — a side effect could be that people make a bunch of fake polls right before the cutoff date, thus locking in the fakery until the end of the election.

- ? Is there a better solution to the poll cutoff date problem?

# References
- [[hill2024methodology|hill20: 2024 forecast methodology]] 
- [[kennedy2018evaluation|kennedy20: An evaluation of the 2016 election polls in the United States]] 
- [[Lau23compareProbPanelsPoll|Lau23: Comparing Two Types of Online Survey Samples]]: online-opt-in vs. probabilistic panels (seem more accurate)
- [[DFP22Polling|DFP22: 2022 Polling Accuracy Report]] 
- [[Kotak22ElectionPollsAre|Kotak22: Election polls are 95% confident but only 60% accurate]] 
- [[Weinburg20polls60pct|Weinburg20: Election Polls Are Only 60 Percent Accurate, Which Is 0 Percent Surprising.]] 
- [[Cohn24changePollsAvoid2020|Cohn24: How Polls Have Changed to Try to Avoid a 2020 Repeat]] 
- [[Kennedy24KeyThingsKnow|Kennedy24: Key things to know about U.S. election polling in 2024]] 
- [[Pew12PartyAffil2012pols|Pew12: Party Affiliation and Election Polls in 2012]] 
- [[Rakich23PollsWereHistorically|Rakich23: The Polls Were Historically Accurate In 2022]] 
- [[Gelman20pollUnskew|Gelman20: Towards principled unskewing: Viewing 2020 election polls through a corrective lens from 2016]] 
- [[Keeter21pollErr2020issue|Keeter21: What 2020’s election poll errors tell us about the accuracy of issue polling]] 
- [[Miller24harrisDominate|Miller24: Kamala Harris DOMINATES in Final Polls (w/ J. Ann Selzer)]]: underrep. voter correct by demog wgt?











