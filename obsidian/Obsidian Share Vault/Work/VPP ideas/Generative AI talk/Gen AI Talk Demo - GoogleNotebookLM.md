---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---
Idea is to test google's new LLM notebook, [[NotebookLM]], an example of a writing aid with "source grounded AI," according to [[Forte24googleNotebookLM|How to Use NotebookLM (Google's New AI Tool)]].

# AEMO Price Curves

- [ ] # Do this w/ [[NotebookLM]], and then do the same w/ Gemini
## AEMO Price Curves and GoogleNotebookLM

**Link to the test notebook I made**: [PriceCurveThesis](https://notebooklm.google.com/notebook/e315667e-3475-4fa5-a49f-e441294b1015?pli=1)

On my 1st try, I found out that [[#NEMPY can do price curves for free?|NEMPY can do price curves for free?]]

- [ ] # When I redo this, don't forget to ask about [[AEMO24vulnerableTransmissionList|List of Vulnerable Transmission Lines]]
- [ ] # Ask about constraint equations

**What I got on my 3rd try**

- Said what Jon's thesis did, that it used a price curve
- asked which papers predict a price of the form that Jon could use
- said AEMO price formation is described by doc x
- said AEMO data is in doc y
- what data would be used to forecast a price curve?
- do generator and power line status affect price curves?
- what data needed for that

Unfortunately, I lost the conversation
- disappears as soon as the URL is visited again
- doesn't store prompts, only responses
- but if you pin one response, all others are deleted
- There is a copy button
- [ ] could I do a movie of this, and then fast forward, zoom and highlight stuff?

### AEMO session 4/4/2024:

Just in case I can recover this session, [here's the link](https://notebooklm.google.com/notebook/e315667e-3475-4fa5-a49f-e441294b1015?pli=1).
#### This was my first session, which took 5 minutes. The next two were better and took less time, but I lost them.  Below are copied responses w/o prompts (but [[#Screenshot of 1st session|Screenshot of 1st session]]).  I just need to redo this using the better prompts.  

**However** the very last response in this session was pretty good.
##### Response 1
**Price curves are used in optimizing battery operation** by providing a way to model the relationship between the price of electricity and the demand for electricity. 

* This information can then be used to make decisions about when to charge and discharge a battery in order to maximize profits. 
* For example, if the price of electricity is high, it may be more profitable to discharge the battery, while if the price of electricity is low, it may be more profitable to charge the battery.
##### Response 2
**Stochastic modeling** is a mathematical approach that incorporates uncertainty into the analysis of systems. It is used to represent and predict the behavior of systems where there is randomness or variability, and it allows for the quantification of the uncertainty in the system's outcomes. 

* One common application of stochastic modeling is in the simulation of complex systems, such as the behavior of financial markets or the spread of diseases. 
* Other applications include decision-making under uncertainty, such as optimizing the allocation of resources in a supply chain or determining the optimal price for a product. 
* Stochastic modeling is also used in the design of systems, such as communication networks and control systems, to ensure that they can handle uncertainty and maintain performance.
##### Response 3
**Several key ideas from the other sources could be applied to Jon Danadee's approach to optimizing battery operation using price curves:**

* **Incorporating auction data into price forecasting:** By leveraging auction data on supply and demand curves, it is possible to capture the dynamics of price formation and improve the accuracy of price forecasts. This can be achieved by combining time series models with techniques such as curve fitting to historical data.

* **Utilizing hybrid forecasting methods:** Combining multiple forecasting techniques, such as time series, regression, and neural networks, can improve the robustness and accuracy of price forecasts. By leveraging the strengths of different methods, hybrid approaches can capture complex patterns and non-linearities in the data.

* **Considering uncertainty in price forecasting:** Stochastic modeling techniques can be applied to account for uncertainty in price forecasts. This enables the development of more resilient battery operation strategies that can adapt to variations in electricity prices.

* **Optimizing battery operation under imperfect price forecasting:** The use of stochastic optimization techniques, such as Markov decision processes (MDPs), can help to optimize battery operation under imperfect price forecasting. MDPs allow for the explicit consideration of uncertainty and the formulation of optimal policies that maximize the expected reward or minimize the expected cost.

* **Incorporating degradation costs into optimization:** The cost of battery degradation should be factored into the optimization of battery operation. By considering the long-term impact of cycling on battery life, it is possible to develop charging and discharging strategies that minimize degradation while maintaining profitability.
##### Response 4
**Price curves are forecasted through various methods, including:**

* **Time series analysis:** Using historical price data to identify patterns and trends, and extrapolating them into the future.

* **Econometric models:** Incorporating economic factors such as demand, supply, and weather into statistical models to predict prices.

* **Curve fitting:** Fitting mathematical curves to historical price data to capture the relationship between price and various factors such as time, demand, and supply.

* **Structural models:** Simulating the behavior of electricity markets, including the interplay between supply and demand, to forecast prices.

* **Machine learning algorithms:** Employing artificial intelligence techniques to analyze large datasets of historical price data and identify patterns and correlations for price forecasting.
##### Response 5
**The AEMO Market Guide to Scheduled Loads and AEMO MMS data model can be used to generate a price curve compatible with Jon Donadee's PhD thesis by following these steps:**

1. **Collect historical price data from the AEMO MMS data model.** This data should include hourly prices for the relevant market region.
2. **Use econometric models or other statistical techniques to identify patterns and trends in the historical price data.** This will help to determine the relationship between price and various factors such as time, demand, and supply.
3. **Fit a mathematical curve to the historical price data.** This curve can then be used to forecast future prices.
4. **Validate the price curve by comparing its predictions to actual market prices.** This will help to ensure that the price curve is accurate and reliable.

Once the price curve has been validated, it can be used to optimize battery operation according to Jon Donadee's PhD thesis. The price curve can be used to predict future prices, which can then be used to determine the optimal charging and discharging schedule for the battery. This will help to maximize the battery's profitability and efficiency.
##### ... Response 8
**The following inputs and features would be useful in forecasting the AEMO market price:**

* **SCADA measurements of the power system**
* **Five-minute demand forecast values**
* **Constraint equations entered by AEMO**
* **Software setup**
* **Historical prices**
* **Load data**
* **Generator data**
* **Weather data**
* **Economic data**
* **News and events**

#### Screenshot of full 1st session

![[Gen AI Demo - GoogleNotebookLM-20240404191526431.webp]]

#### NEMPY can do price curves for free?

Interesting source info found in source reference number 5 or 6: you can run AEMO sims for $15k/year.  But somehow, NEMPY can do something equivalent (what?) for free?

- [ ] # what is it that NEMPY can do for free?

**Text snipped from the pdf from [[Gorman22nempyDsptchMdlAEMO|Nempy: A Python package for]]
(screenshot below)

`3.` To answer counter factual questions about historical dispatch outcomes. For example:

• What would have been the impact on market dispatch if a particular network constraint had not been present?

• How would have dispatch outcomes differed if a unit had offered a different bid into the market?

The answers to such questions have direct, and potentially large, financial implications for market participants. ==AEMO offers access to a production version of the market dispatch engine to allow participants to answer such questions== (Australian Energy Market Operator, 2021a). However, access is ==restricted to registered participants and is provided at a cost of $15,000 per year==. Additionally, users of this service are not provided with a copy of the dispatch engine, but access it by ==submitting input files to AEMO==. This prevents the use of this service to answer questions about how changes to the dispatch process, rather than the inputs, would affect dispatch outcomes. In contrast,== access to Nempy is not restricted==, it is free to use, and is open to modification.

Gorman et al., (2022). Nempy: A Python package for modelling the Australian National Electricity Market dispatch procedure. Journal of Open Source Software, 7(70), 3596. https://doi.org/10.21105/joss.03596

***Screenshot of source highlighting***

![[Gen AI Demo - GoogleNotebookLM-20240404193012262.webp]]

![[Gen AI Demo - GoogleNotebookLM-20240404194346299.webp]]

## AEMO price curves on Google Gemini

Redo AEMO prompts on Gemini, see how they're different.