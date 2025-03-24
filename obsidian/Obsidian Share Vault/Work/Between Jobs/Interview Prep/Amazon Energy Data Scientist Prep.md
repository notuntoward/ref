---
created date: 2025-03-05T13:53:26-08:00
modified date: 2025-03-05T15:02:22-08:00
---

# 1st Interview
Interview details & Prep [email](https://mail.google.com/mail/u/0/#search/audit+chvinit_sent/FMfcgzQZTVmsGJdMwHpjBFsJZHRSvlKq). This says "The interview will be competency-based, focused on [Amazon's Leadership Principles](https://9n3bwgl2.r.us-west-2.awstrack.me/L0/https:%2F%2Fwww.amazon.jobs%2Fen%2Fprinciples/1/02010000klfb3qra-28j2kmbo-dht6-t3h7-594p-0le855nvnf00-000000/tjdKNhHDPwXCa3l_cfhzPFVnQK4=416)."
Phone interview prep [email](https://mail.google.com/mail/u/0/#inbox/FMfcgzQZTMQSZDCBpJjpKbXrkWLrflCR).  This says it will be technical, have some things about leadership principles

# Phone screening
From: [Phone screening](https://amazon.jobs/content/en/how-we-hire/phone-screening)

# Leadership Principles
From: [Leadership Principles](https://www.amazon.jobs/content/en/our-workplace/leadership-principles)

## Customer Obsession
Leaders start with the customer and work backwards. They work vigorously to earn and keep customer trust. Although leaders pay attention to competitors, they obsess over customers.
### Me
- ultrasound: doctors, techs, becoming a scanner
- QCELLS: ICAP yearly peak hour (VPP best), QCELLS AUS (30% savings)
## Ownership
Leaders are owners. They think long term and don’t sacrifice long-term value for short-term results. They act on behalf of the entire company, beyond just their own team. They never say “that’s not my job.”
### Me
- QCELLS: ICAP peak: operations team, standards for reliability, fallbacks, tests
## Invent and Simplify

Leaders expect and require innovation and invention from their teams and always find ways to simplify. They are externally aware, look for new ideas from everywhere, and are not limited by “not invented here.” As we do new things, we accept that we may be misunderstood for long periods of time.

### Me
- TenneT: pushed for DS code written by DS, not rewritten by DE; move from hand-coded to graph-based compute execution

## Are Right, A Lot
Leaders are right a lot. They have strong judgment and good instincts. They seek diverse perspectives and work to disconfirm their beliefs.


### Me
- I was wrong but corrected:  based on what I read, and a little past experience, I thought that skopt Bayesian was the best hyperparameter tuning library.  Other team went with Optuna and had good luck.  When I'd finished what I was doing, I went back and revisited that choice.  They were right, and I switched.
## Hire and Develop the Best
Leaders raise the performance bar with every hire and promotion. They recognize exceptional talent, and willingly move them throughout the organization. Leaders develop leaders and take seriously their role in coaching others. We work on behalf of our people to invent mechanisms for development like Career Choice.

## Insist on the Highest Standards
Leaders have relentlessly high standards — many people may think these standards are unreasonably high. Leaders are continually raising the bar and drive their teams to deliver high quality products, services, and processes. Leaders ensure that defects do not get sent down the line and that problems are fixed so they stay fixed.
## Learn and Be Curious
Leaders are never done learning and always seek to improve themselves. They are curious about new possibilities and act to explore them.
Leaders have relentlessly high standards — many people may think these standards are unreasonably high. Leaders are continually raising the bar and drive their teams to deliver high quality products, services, and processes. Leaders ensure that defects do not get sent down the line and that problems are fixed so they stay fixed.

### Me
- back to school twice, maybe 3X
- switched from speech PhD to energy
- many industries, had to learn each one
## Bias for Action
Speed matters in business. Many decisions and actions are reversible and do not need extensive study. We value calculated risk taking.

### Me
- True.  But need to assess reversible e.g. first impressions count

## Think Big
Thinking small is a self-fulfilling prophecy. Leaders create and communicate a bold direction that inspires results. They think differently and look around corners for ways to serve customers.

### Me
- IRPWIND: many labs wanted to do the least.  I held them to their committments
## Frugality
Accomplish more with less. Constraints breed resourcefulness, self-sufficiency, and invention. There are no extra points for growing headcount, budget size, or fixed expense.
### Me
- TenneT example, again
## Dive Deep
### Me
- supervised a lot of students
- IRPWIND, had to monitor results, report to experts where I wasn't the expert, so I had to be read with details
## Have Backbone; Disagree and Commit
Leaders are obligated to respectfully challenge decisions when they disagree, even when doing so is uncomfortable or exhausting. Leaders have conviction and are tenacious. They do not compromise for the sake of social cohesion. Once a decision is determined, they commit wholly.
### Me
- IRPWIND, again.  Had to do a lot of pushing
## Deliver Results
Leaders focus on the key inputs for their business and deliver them with the right quality and in a timely fashion. Despite setbacks, they rise to the occasion and never settle.
### Me
- IRPWIND again, final judges said my group was the best

## Strive to be Earth’s Best Employer
Leaders work every day to create a safer, more productive, higher performing, more diverse, and more just work environment. They lead with empathy, have fun at work, and make it easy for others to have fun. Leaders ask themselves: Are my fellow employees growing? Are they empowered? Are they ready for what’s next? Leaders have a vision for and commitment to their employees’ personal success, whether that be at Amazon or elsewhere.
## Success and Scale Bring Broad Responsibility
We started in a garage, but we’re not there anymore. We are big, we impact the world, and we are far from perfect. We must be humble and thoughtful about even the secondary effects of our actions. Our local communities, planet, and future generations need us to be better every day. We must begin each day with a determination to make better, do better, and be better for our customers, our employees, our partners, and the world at large. And we must end every day knowing we can do even more tomorrow. Leaders create more than they consume and always leave things better than how they found them.



# Behavioral-based interviewing
From: [Phone screening](https://amazon.jobs/content/en/how-we-hire/phone-screening)

ur interviews are rooted in behavioral-based questions. These questions ask about past situations or challenges you’ve faced and how you handled them, using Leadership Principles to guide the discussion.

We avoid brain teasers (e.g., “How many windows are in Manhattan?”). We’ve researched this approach and have found that those types of questions are unreliable when it comes to predicting success at Amazon.

Here are some examples of behavioral-based questions:

1. Tell me about a time when you were faced with a problem that had a number of possible solutions. What was the problem and how did you determine the course of action? What was the outcome?
- QCELLS: Many ways of forecasting.  My general approach:
	- start with simplest idea that's not too simple
	- increase complexity
	- Example: residential load forecast
		- time binning
		- ARIMA
		- FF NN
		- LSTM
		- Boosted Tree (BEST, also in literature)
		- TimeGPT

1. When did you take a risk, make a mistake, or fail? How did you respond, and how did you grow?
   - Example: How to predict the sum of wind farm gen
      - was sure local probabilistic predictions would be better
      - turned out that, given the data we had, joint at the sum was best
      - Response: accept I was wrong, realize that I skipped a "start simple step"

2. Describe a time you took the lead on a project.
   - many times, most challenging was definitely IRPWIND

3. What did you do when you needed to motivate a group of people or promote collaboration on a project?
   - IRPWIND:cooperation was a problem
      - tried to emphasize that another person needed something
      - ad to sometimes smooth over personality conflicts (Anna vs. "Dustin")
         - demonstrated that I followed the correct review procedure, that the process was fair
      - convince them that the result was worth it
      - reminded them of their commitments

4. How have you used data to develop a strategy?
   - example: analysis of price forecasting errors
      - looked at them individually, tried to covert the error into an error cost
      - found that lowest RMSE or whatever didn't always better or even best customer cost
      - anecdotal study & research: individual errors with same mag had different costs
         - but this was anecdotal required a lot of optimization team work
      - results: 
         - more skepticism about global metrics, pre-optimization
         - a research project on whether joint optimization and forecasting: "optimization in the loop"

When you respond, be sure to focus on the question asked. Ensure your answer is well-structured and provide examples using metrics or data if applicable. Reference recent situations whenever possible.
# Technical Interview
## Software Development interview topics
From: [Amazon Software Development In...](https://amazon.jobs/content/en/how-we-hire/interview-prep/software-development-topics)

