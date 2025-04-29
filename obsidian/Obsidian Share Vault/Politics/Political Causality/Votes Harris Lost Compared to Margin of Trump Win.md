---
modified date: 2025-04-24T17:10:33-07:00
---
# My Summary
- [ ] could make two columns Over performance and under performance
	- [ ] could make a net vote comparing binaries: white vs. non-white, men vs. women, LGBTQ vs. non-LGBTQ (surprisingly big number here.)
	- [ ] when binary, and it's split between Trump and Harris, estimate how many pro-Harris voters would have been lost to have attracted Trump voters from the other side.
- [ ] For Harris over-performers, add raw vote column, % overperform change needed for Trump win (of overperform and whole demo)
- [ ] graphs
- [ ] get data directly from sources and program it myself.
- [ ] graph s/ compare \# and % of voters Harris underperformers Harris needed to change vs. \# and % of Trump over-performers Harris needed to change in order to win (or something like that).  Want to clearly show that 
	- Harris could have, for example persuaded only a small percentage of men, and that there was no way for her to win by persuading even all of LGBTQ since there weren't enough of them
	- Somehow get at the fact that Harris's pounding on women was at the point of diminishing returns (the remaining women were hardcore R, very hard to persuade).  
	- [ ] Maybe Segment by R/D/I where, for example Ds and I's would be "persuadable" for Harris but not Rs?
- [ ] find polls showing what fraction of groups had "made up their minds"

**If AI data below is correct, then...**

| Factor                              | Number of voters | underperform % change for Harris win | underpeform  whole demo % change for Harris win |
| ----------------------------------- | ---------------- | ------------------------------------ | ----------------------------------------------- |
| **Harris lost by**                  | **2,284,967**    |                                      |                                                 |
| White under-performance             | 6,943,810        |                                      |                                                 |
| Straight under-performace           | 4,713,035        |                                      |                                                 |
| No College degree under-performance | 4,699,751        |                                      |                                                 |
| Men under-performance               | 3,867,981        |                                      |                                                 |
| "other candidates"                  | 2,918,109        |                                      |                                                 |
| $50k - $99,999 under-performance    | 1,142,554        |                                      |                                                 |
| < $30,000                           | 571,277          |                                      |                                                 |

- From [Perplexity](<#Perplexity Response>): 
	- Margin Harris lost by: 2,284,967 votes
	- Num Trump voters switching to Harris needed for a Harris win: 1,142,483 votes
	- "other candidates": 2,918,109 votes
# Notebook LM Response

From [NotebookLM](https://notebooklm.google.com/notebook/03eb1844-d5fb-4dd3-82ae-f3ae9b41ad7a).  I can't trust these numbers, but maybe they are suggestive?

## Prompt

I lost the one for this table, but for the previous table, it was:

> Summarize cases where, in the 2024 presidential race, voters voted disproportionately. by disproportionately, I mean compared to the overall population vote. For example, if 49.8% of voters voted for Trump, yet 55% of men voted for Trump, then the disproportion was 5.2%. Report disproportionalities in terms of percentage of that group, percentage of the electorate, absolute numbers, and how that number compares to the number of extra voters Harris would have needed to win the race, assuming that the number of voters stays constant (if voters were biased towards Harris, then this number should be positive)
> 
> Demographic axes to consider, gender, race, sexual preference, geography and immigrant status, economic class and education. Include cases where the (unsigned) disproportionate number is more than 25% of the number of votes Harris would have needed or Trump got.
> 
> Add a column showing the number of American voters in each demographic group. Do not hallucinate! Find authoritative source for every number. If you can't find it, then note that you can't find it and don't report a number. Provide a footnote every number. If you calculated a number, provide footnotes for all data sources you used to do the calculation.
> 
> If you don't have sufficient a sources, then get more and add them to the list of sources. Again, NEVER HALLUCINATE. ALWAYS SANITY CHECK YOUR NUMBERS. For example, do not tell me that the number of US female voters was 64,782, as you did before. This is easily disproven from public data. Check your work for consistency, and DO NOT MAKE UP NUMBERS.
> 
> Make a table.

## Response
Below is a table summarizing cases where voter demographics in the 2024 presidential race voted disproportionately compared to the overall population vote. Disproportionality is reported in terms of percentage of that group, absolute numbers, and how that number compares to 25% of the number of extra voters Harris would have needed to win the race (approximately 571,242) and 25% of Trump's margin of victory (approximately 571,242).

| Demographic Group           | Trump Vote Share (%) | Harris Vote Share (%) | Overall Trump Vote Share (%) | Overall Harris Vote Share (%) | Trump Disproportion (% of group) | Harris Disproportion (% of group) |       Estimated Number of Voters in Group        | Absolute Number of Disproportionate Trump Voters | Absolute Number of Disproportionate Harris Voters | Comparison to Harris's Needed Extra Votes (+ favors Harris) |
| :-------------------------- | :------------------: | :-------------------: | :--------------------------: | :---------------------------: | :------------------------------: | :-------------------------------: | :----------------------------------------------: | :----------------------------------------------: | :-----------------------------------------------: | :---------------------------------------------------------: |
| **Men**                     |          55          |          43           |             49.8             |             48.3              |               5.2                |               -5.3                | 72,961,903 [Calculated from 47% of 155,238,302]  |                    3,794,019                     |                    -3,867,981                     |                         -3,867,981                          |
| **Women**                   |          45          |          53           |             49.8             |             48.3              |               -4.8               |                4.7                | 82,276,399 [Calculated from 53% of 155,238,302]  |                    -3,949,267                    |                     3,867,991                     |                          3,867,991                          |
| **White**                   |          57          |          42           |             49.8             |             48.3              |               7.2                |               -6.3                | 110,219,194 [Calculated from 71% of 155,238,302] |                    7,935,782                     |                    -6,943,810                     |                         -6,943,810                          |
| **Black**                   |          13          |          86           |             49.8             |             48.3              |              -36.8               |               37.7                | 17,076,213 [Calculated from 11% of 155,238,302]  |                    -6,284,026                    |                     6,438,652                     |                          6,438,652                          |
| **Latino**                  |          46          |          51           |             49.8             |             48.3              |               -3.8               |                2.7                | 17,076,213 [Calculated from 11% of 155,238,302]  |                     -648,896                     |                      461,057                      |                           461,057                           |
| **LGBT Yes**                |          12          |          86           |             49.8             |             48.3              |              -37.8               |               37.7                |  12,419,064 [Calculated from 8% of 155,238,302]  |                    -4,694,406                    |                     4,680,017                     |                          4,680,017                          |
| **LGBT No**                 |          53          |          45           |             49.8             |             48.3              |               3.2                |               -3.3                | 142,819,238 [Calculated from 92% of 155,238,302] |                    4,570,216                     |                    -4,713,035                     |                         -4,713,035                          |
| **Income < $30,000**        |          46          |          50           |             49.8             |             48.3              |               -3.8               |                1.7                | 17,076,213 [Calculated from 11% of 155,238,302]  |                     -648,896                     |                      290,306                      |                           290,306                           |
| **Income $30k - $49,999**   |          52          |          46           |             49.8             |             48.3              |               2.2                |               -2.3                | 24,838,128 [Calculated from 16% of 155,238,302]  |                     546,440                      |                     -571,277                      |                          -571,277                           |
| **Income $50k - $99,999**   |          52          |          46           |             49.8             |             48.3              |               2.2                |               -2.3                | 49,676,257 [Calculated from 32% of 155,238,302]  |                    1,092,878                     |                    -1,142,554                     |                         -1,142,554                          |
| **Income $100k - $199,999** |          46          |          51           |             49.8             |             48.3              |               -3.8               |                2.7                | 43,466,725 [Calculated from 28% of 155,238,302]  |                    -1,651,735                    |                     1,173,602                     |                          1,173,602                          |
| **Income > $200,000**       |          46          |          52           |             49.8             |             48.3              |               -3.8               |                3.7                | 20,180,979 [Calculated from 13% of 155,238,302]  |                     -766,877                     |                      746,696                      |                           746,696                           |
| **No College Degree**       |          56          |          43           |             49.8             |             48.3              |               6.2                |               -5.3                | 88,485,872 [Calculated from 57% of 155,238,302]  |                    5,486,124                     |                    -4,699,751                     |                         -4,699,751                          |
| **College Graduate**        |          42          |          56           |             49.8             |             48.3              |               -7.8               |                7.7                | 66,752,435 [Calculated from 43% of 155,238,302]  |                    -5,206,690                    |                     5,140,000                     |                          5,140,000                          |

**Note on Geography and Immigrant Status:** The provided sources do not contain sufficient data to accurately report voter demographics and vote shares broken down by broad geographic regions or immigrant status in a way that allows for the calculation of absolute numbers of disproportionate voters exceeding the specified threshold. Therefore, these demographic axes are not included in the table.

**Footnotes:**
 Excerpts from "2024 United States presidential election - Wikipedia"
 "Exit poll results 2024 | CNN Politics" as cited in (Wikipedia's citation )

# Perplexity Response
From: [Perplexity](https://www.perplexity.ai/search/regarding-the-2024-election-fi-pD88PcElTxiwkraMIFGPkA#3)

## Prompt
how many people voted in total.  Make a table of this, along with the percentages.
## Reponse
Here is a table summarizing the total number of votes cast in the 2024 U.S. presidential election, along with the vote counts and percentages for each major candidate and others:

| Candidate        | Votes       | Percentage |
| :--------------- | :---------- | :--------- |
| Donald Trump     | 77,302,580  | 49.8%      |
| Kamala Harris    | 75,017,613  | 48.3%      |
| Other Candidates | 2,918,109   | 1.9%       |
| **Total Votes**  | 155,238,302 | 100%       |

- The total number of people who voted: **155,238,302**[^3].
- Percentages are based on the total votes cast for president[^3].

These figures are consistent across official and reputable sources reporting on the 2024 election results[^3][^4][^5].

<div style="text-align: center">⁂</div>

[^1]: https://www.presidency.ucsb.edu/statistics/elections/2024

[^2]: https://www.usnews.com/news/national-news/articles/2024-11-15/how-many-people-didnt-vote-in-the-2024-election

[^3]: https://en.wikipedia.org/wiki/2024_United_States_presidential_election

[^4]: https://www.cfr.org/article/2024-election-numbers

[^5]: https://www.bbc.com/news/election/2024/us/results

[^6]: https://www.cnn.com/election/2024/results/president

[^7]: https://ballotpedia.org/Presidential_candidates,_2024

[^8]: https://www.britannica.com/event/United-States-presidential-election-of-2024

[^9]: https://ballotpedia.org/Election_results,_2024:_Analysis_of_voter_turnout_in_the_2024_general_election

[^10]: https://www.cookpolitical.com/vote-tracker/2024/electoral-college

[^11]: https://www.npr.org/2024/12/27/nx-s1-5222570/2024-politics-recap

[^12]: https://apnews.com/projects/election-results-2024/

[^13]: https://www.presidency.ucsb.edu/statistics/data/voter-turnout-in-presidential-elections

[^14]: https://apps.npr.org/2024-election-results/

[^15]: https://en.wikipedia.org/wiki/Voter_turnout_in_United_States_presidential_elections

[^16]: https://www.pewresearch.org/topic/politics-policy/us-elections-voters/election-2024/

[^17]: https://www.prri.org/spotlight/breaking-down-the-differences-between-voters-and-non-voters-in-the-2024-election/

[^18]: https://www.reddit.com/r/dataisbeautiful/comments/1k1dvv3/oc_us_presidential_election_results_as_percentage/

[^19]: https://www.fec.gov/documents/5644/2024presgeresults.pdf

[^20]: https://www.archives.gov/electoral-college/2024

# My related sources
- Geographic 2024 voting patterns:  [[Woodland24electAmericanNations|Woodland24: The 2024 Presidential Election and the American Nations]] 
- Male underperf: [[Hendrickson25demsManProblem|Hendrickson25: Democrats Have a Man Problem]] 