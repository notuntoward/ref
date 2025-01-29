---
created date: 2024-10-22T09:21:46-07:00
modified date: 2024-10-22T09:21:46-07:00
---
Gemni and Copilot were both wrong in their first answers -- obvious self-contradictions that a human would detect. Gemni corrected itself after a correction prompt (<span style="color:#ff0000">verify this!</span>) but Copilot was still wrong after two correction prompts (could continue this with the <span style="color:#92d050">Restart button</span>, which sometimes helps, and is worth pointing out in any case) 

Also, stochasticity and non-reproducibilty (the bane of sofware test engineers (A lead-in to LLMOPS)): Copilot got it right after I restarted.
# Gemni
## Initial Prompt (Gemni)
Wrong
![[Bing Copilot and Google Gemni Errors-20240308124237254.webp]]
## Correction Prompt (Gemni)

I believe it fixed the error
![[__temp__Bing Copilot and Google Gemni Errors-20240308124341209.webp]]
# Initial Prompt (Copilot)

Copilot didn't listen to correction prompts until I cleared its mind (clicked the new topic button)

**Points to make**
- flushed that big context buffer to clear its mind
- nice references on the bottom (Gemni rarely provides them, Zak says they're an open question, or something like that)
- different references for right answer
- ["2 of 4"](#Correction%20Prompt%202%20(Copilot)]) and [[#Copilot hitting context Window Limit|"4 of 4"]] context window limits, forces a restart to keep computation tractable.
- further questions can be useful

![[Bing Copilot and Google Gemni Errors-20240308124551002.webp]]
## Correction Prompt #1 (Copilot)
Wrong
![[Bing Copilot and Google Gemni Errors-20240308124642523.webp]]
## Correction Prompt #2 (Copilot)
Still wrong, shows 2 of 4
![[__temp__Bing Copilot and Google Gemni Errors-20240308124731857.webp]]
## Start over w/ New Topic
![[Errors -- Bing Copilot and Google Gemni-20240308145117389.webp]]
![[Errors -- Bing Copilot and Google Gemni-20240308151950752.webp]]
Note the different sources used for the answer above...
![[Errors -- Bing Copilot and Google Gemni-20240308152126355.webp]]
Is it clear on the x and y axes?  Yes.
![[__temp__Errors -- Bing Copilot and Google Gemni-20240308145335547.webp]]
The follow-on questions.  Also, note the "2 of 4" warning.  You'll have to restart at "4 of 4".  This is how Copilot limits its context window.
![[Errors -- Bing Copilot and Google Gemni-20240308145357157.webp]]
## Additional question click response also correct
![[Errors -- Bing Copilot and Google Gemni-20240308153334791.webp]]
![[__temp__Errors -- Bing Copilot and Google Gemni-20240308153317553.webp]]

<span style="color:#0070c0">Below is the above screenshotted response, in full, retrieved by using the copilot copy button.</span>

Certainly! Let’s explore an example of how the **inverse supply curve** operates in practice, specifically in the context of electricity markets.

1. **Electricity Market Scenario**:
    
    - Imagine a regional electricity market where power suppliers generate electricity and sell it to consumers.
    - The market equilibrium price (where supply equals demand) is initially set at $50 per megawatt-hour (MWh).
2. **Regular Supply Curve**:
    
    - Suppose we start with a regular upward-sloping supply curve for electricity.
    - As the price of electricity increases, more suppliers are willing to produce and sell electricity.
    - For instance:
        - At $40/MWh, suppliers offer 1000 MWh.
        - At $50/MWh (the equilibrium price), suppliers offer 1200 MWh.
        - At $60/MWh, suppliers offer 1400 MWh.
3. **Inverse Supply Curve**:
    
    - Now, let’s consider the inverse supply curve, which shows the relationship between the **price** and the **quantity supplied**.
    - As prices rise, suppliers adjust their production levels differently:
        - At a higher price (e.g., $60/MWh), suppliers are willing to produce and offer **less** electricity (say, 1400 MWh).
        - At a lower price (e.g., $40/MWh), suppliers are willing to produce and offer **more** electricity (say, 1000 MWh).
    - The inverse supply curve slopes downward, indicating this negative correlation.
4. **Factors Influencing the Inverse Supply Curve**:
    
    - **Production Costs**: Suppliers consider their costs (fuel, labor, maintenance) when deciding how much electricity to produce. Higher costs lead to a steeper inverse supply curve.
    - **Resource Availability**: If renewable energy sources (like wind or solar) are abundant, the inverse supply curve may be flatter.
    - **Technological Constraints**: Some power plants can’t ramp up or down quickly, affecting their responsiveness to price changes.
5. **Market Shifts**:
    
    - Changes in demand or supply conditions shift the inverse supply curve.
    - For example:
        - If a heatwave increases electricity demand, the curve shifts to the right (higher quantity supplied at each price).
        - If a new natural gas plant comes online, the curve shifts to the left (lower quantity supplied at each price).
6. **Implications**:
    
    - Understanding the inverse supply curve helps policymakers and market participants make informed decisions.
    - It affects pricing strategies, investment decisions, and grid stability.

Remember, while bananas might not directly apply to electricity markets, the concept of inverse relationships remains essential for understanding supply dynamics! 🍌⚡️
## Copilot hitting context Window Limit

<span style="color:#0070c0">This is what it looks like when you've reached the context window limit:</span>

![[__temp__Errors -- Bing Copilot and Google Gemni-20240308153731779.webp]]

# Demographic data errors: Funny

## Prompt

> Compare the UK, France, Germany, the US, Mexico and Canada. Consider population, population density, total economy size, GDP per capital, average life span, and working hours per year.

## Gemini

**Funny**

**Gemini gets GDP per capita comparison right in the table (presumably) and <mark style="background: #FFB86CA6;">wrong in the table</mark>.  See the US vs. Canada**

![[Errors -- Bing Copilot and Google Gemni-20240329172024761.webp]]

**The same table in Markup**

| Feature                                       | UK     | France | Germany | US                                                 | Mexico | Canada                                             |
| --------------------------------------------- | ------ | ------ | ------- | -------------------------------------------------- | ------ | -------------------------------------------------- |
| Population (Millions)                         | 67.8   | 65.3   | 83.2    | 335.3                                              | 131.9  | 38.5                                               |
| Population Density (per sq km)                | 277    | 123    | 240     | 35                                                 | 66     | 4.1                                                |
| Total Economy Size (GDP in Trillions USD PPP) | 3.2    | 3.4    | 4.2     | 20.9                                               | 3.5    | 1.8                                                |
| GDP per Capita (USD PPP)                      | 45,850 | 40,964 | 48,432  | <mark style="background: #FFB86CA6;">63,416</mark> | 31,624 | <mark style="background: #FFB86CA6;">51,432</mark> |
| Average Lifespan (years)                      | 81.6   | 82.7   | 81.4    | 78.6                                               | 75.2   | 82.9                                               |
| Working Hours per Year                        | 1,673  | 1,608  | 1,573   | 1,783                                              | 2,124  | 1,767                                              |

drive_spreadsheetExport to Sheets

**Observations:**

- The US has the largest population by far, followed by Mexico and then Canada. However, Canada has the lowest population density.
- The US boasts the largest total economy, but <mark style="background: #FFB86CA6;">Canada has the highest GDP per capita among the North American countries</mark>.
- Mexico has the lowest GDP per capita and the shortest average lifespan.
- Canada shares similarities with both Europe (high lifespan, lower working hours) and the US (larger economy).
- The US has the longest working hours.

**Additional Points:**

- Consider healthcare systems: The US has a private system, while most others have universal healthcare.
- Language: The UK, France, and Germany have their own dominant languages. The US and Canada are predominantly English-speaking, while Mexico is Spanish-speaking.

Remember, this is a snapshot. Each country has a rich history and culture that contributes to these statistics.

## Copilot

**Copilot <mark style="background: #FFB86CA6;">forgets Canada</mark>!**

![[__temp__Errors -- Bing Copilot and Google Gemni-20240329173155283.webp]]

**Same response in markdown**

Copilot

Certainly! Let’s compare some key aspects of the UK, France, Germany, the US, Mexico, and Canada:

1. <mark style="background: #FFB86CA6;">**Population**:</mark>
    
    - [UK: Approximately **67.96 million** people](https://en.wikipedia.org/wiki/Demographics_of_France)[1](https://en.wikipedia.org/wiki/Demographics_of_France).
    - [France: Around **67.8 million** inhabitants](https://en.wikipedia.org/wiki/Demographics_of_France)[2](https://www.statista.com/topics/5677/demography-in-france/).
    - [Germany: Approximately **83.26 million** people](https://en.wikipedia.org/wiki/Demographics_of_France)[3](https://bing.com/search?q=Germany+population).
    - [US: About **341.34 million** people](https://bing.com/search?q=US+population)[4](https://bing.com/search?q=US+population).
    - [Mexico: Around **129.39 million** people](https://www.worldometers.info/world-population/mexico-population/)[5](https://www.worldometers.info/world-population/mexico-population/).
2. **Population Density**:
    
    - [UK: **280 people per square kilometer**](https://en.wikipedia.org/wiki/Demographics_of_France)[1](https://en.wikipedia.org/wiki/Demographics_of_France).
    - [France: **119 people per square kilometer**](https://en.wikipedia.org/wiki/Demographics_of_France)[1](https://en.wikipedia.org/wiki/Demographics_of_France).
    - [Germany: **226 people per square kilometer**](https://en.wikipedia.org/wiki/Demographics_of_France)[6](https://en.wikipedia.org/wiki/Demographics_of_Germany).
    - [US: **36 people per square kilometer**](https://www.worldometers.info/world-population/us-population/)[7](https://www.worldometers.info/world-population/us-population/).
    - [Mexico: **66 people per square kilometer**](https://en.wikipedia.org/wiki/Demographics_of_France)[5](https://www.worldometers.info/world-population/mexico-population/).
3. **Total Economy Size (GDP)**:
    
    - [UK: **$2.94 trillion** (2022)](https://en.wikipedia.org/wiki/Demographics_of_France) [1](https://en.wikipedia.org/wiki/Demographics_of_France).
    - [France: **$2.71 trillion** (2022)](https://en.wikipedia.org/wiki/Demographics_of_France) [8](https://www.worldometers.info/world-population/france-population/).
    - [Germany: **$4.24 trillion** (2022)](https://en.wikipedia.org/wiki/Demographics_of_France) [3](https://bing.com/search?q=Germany+population).
    - [US: **$22.675 trillion** (2022)](https://en.wikipedia.org/wiki/Demographics_of_France) [7](https://www.worldometers.info/world-population/us-population/).
    - [Mexico: **$1.27 trillion** (2022)](https://en.wikipedia.org/wiki/Demographics_of_France) [5](https://www.worldometers.info/world-population/mexico-population/).
4. **GDP per Capita**:
    
    - [UK: **$43,300** (2022)](https://en.wikipedia.org/wiki/Demographics_of_France) [1](https://en.wikipedia.org/wiki/Demographics_of_France).
    - [France: **$41,000** (2022)](https://en.wikipedia.org/wiki/Demographics_of_France) [8](https://www.worldometers.info/world-population/france-population/).
    - [Germany: **$51,000** (2022)](https://en.wikipedia.org/wiki/Demographics_of_France) [3](https://bing.com/search?q=Germany+population).
    - [US: **$68,000** (2022)](https://en.wikipedia.org/wiki/Demographics_of_France) [7](https://www.worldometers.info/world-population/us-population/).
    - [Mexico: **$10,000** (2022)](https://en.wikipedia.org/wiki/Demographics_of_France) [5](https://www.worldometers.info/world-population/mexico-population/).
5. **Average Life Span**:
    
    - [UK: **82.2 years**](https://en.wikipedia.org/wiki/Demographics_of_France) [1](https://en.wikipedia.org/wiki/Demographics_of_France).
    - [France: **82.2 years**](https://en.wikipedia.org/wiki/Demographics_of_France) [8](https://www.worldometers.info/world-population/france-population/).
    - [Germany: **81.2 years**](https://en.wikipedia.org/wiki/Demographics_of_France) [6](https://en.wikipedia.org/wiki/Demographics_of_Germany).
    - US: **Not Available**.
    - Mexico: **Not Available**.
6. **Working Hours per Year**:
    
    - [UK: Approximately **1,676 hours** per year](https://en.wikipedia.org/wiki/Demographics_of_France) [1](https://en.wikipedia.org/wiki/Demographics_of_France).
    - [France: Around **1,482 hours** per year](https://en.wikipedia.org/wiki/Demographics_of_France) [8](https://www.worldometers.info/world-population/france-population/).
    - [Germany: Approximately **1,363 hours** per year](https://en.wikipedia.org/wiki/Demographics_of_France) [6](https://en.wikipedia.org/wiki/Demographics_of_Germany).
    - [US: Approximately **1,779 hours** per year](https://en.wikipedia.org/wiki/Demographics_of_France) [7](https://www.worldometers.info/world-population/us-population/).
    - [Mexico: Approximately **2,255 hours** per year](https://en.wikipedia.org/wiki/Demographics_of_France) [5](https://www.worldometers.info/world-population/mexico-population/).

Keep in mind that these figures are approximate and subject to change. If you need more detailed information or have any other questions, feel free to ask!