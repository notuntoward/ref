---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---
# AEMO Timestamp Endedness
From: [A Hackers Guide to AEMO & NEM Data - ADG Efficiency](https://adgefficiency.com/hackers-aemo/)

**AEMO timestamp with the ==time at the end of the interval==**. This means that `01/01/2018 14:00` refers to the time period `01/01/2018 13:30 - 01/01/2018 14:00`. This will be true for columns like `SETTLEMENTDATE`, which refer to an interval. Columns like `LASTCHANGED`, which refer to a single instant in time are not affected by this.

I prefer ==shifting the AEMO time stamp backwards by one step== of the index frequency (i.e. 5 minutes). This allows the following to be true:

```
dispatch_prices.loc['01/01/2018 13:30': '01/01/2018 14:00'].mean() == trading_price.loc['01/01/2018 13:30']
```

The shifting also allows easier alignment with external data sources such as weather, which is usually stamped with the timestamp at the beginning of the interval.

If the AEMO timestamp is not shifted, then the following is true:

```
dispatch_prices.loc['01/01/2018 13:35': '01/01/2018 14:05'].mean() == trading_price.loc['01/01/2018 14:00']
```

# AEMO Timestamp Zones, DST/ST
From: [Clarifying Notes about the Data](https://v6.nemreview.info/use/enjoy/data/datasets/glossary/index.aspx#:~:text=NEM%20Time,is%20stamped%20on%20this%20basis.)

**Clarifying Notes about the Data**
## NEM Time

First things first - it is essential to understand that the NEM is operated on ==**Australian Eastern Standard time (GMT + 10 hours)**== - which means ==**no daylight savings**==. All data published by AEMO (and hence updated by NEM-Review) is stamped on this basis.  

## NEM Time Intervals

It is important that you are aware that, in real-time, the NEM has operated in two different intervals:
### 5-minute Intervals
AEMO dispatches the market on a five-minute basis.

In doing so, AEMO takes generator's bids to supply, and assumes what the demand in each region will be at the end of the current five-minute (dispatch) interval to determine:

- what each generator should be producing at the end of the five minute interval, and hence
- the dispatch price.

It should be understood that the dispatch data is data derived from the dispatch algorithm for the end of each dispatch interval. Specifically in terms of generator production, regional demand, and interconnector flow:

- the data is an instantaneous value (i.e. MW rather than MWh); and
- the data is not actual metered data, but rather derived from calculations.

As of October 1st 2021, the market is also settled on a 5-minute basis - where previously, settlement (and hence 'trading') occured on 30-minute intervals. The change has meant that what comes under the banner of 'trading data' will have different meanings depending on which point in time you are analysing. Please read the section below about 30-minute intervals.
### 30-minute Intervals
Up until October 1st 2021, even though the dispatch process was operated on a 5-minute basis, commercially the NEM operated on a half-hour (trading) basis.  
  
The 30-minute trading interval data published by AEMO was just the time-weighted average of the 6 x five-minute dispatch data points within a given trading interval. Hence, it was not until just after 25 minutes into a trading interval that the trading data for that interval was known with certainty.  
  
The generators were paid the variable trading price for net production in the half hour, and wholesale market customers (and hence indirectly the energy users) paid the variable trading price for energy consumed in each given half hour.

On October 1st 2021, '5 Minute Settlement' came into full effect, hence trading data was no longer applicable to these 30-minute intervals. However, some other data sets will remain to be publshed on 30-minute intervals.

_**Please keep this information in mind when analsysing a data set relating to 'trading' with dates before, during or after October 1st, 2021.**_

# Run Times

P5MIN and Predispatch run times are actually available about one period before their stated run times.  If you don't consider that, you'll be looking at a forecast that's one period later than what you could have actually used.

- # Does this agree with the timing diagram [[Simon18tensorflowAWSaemoPriceFrcst#^eacc6d|here]]?  
- # Is this just correcting for the [[#AEMO Timestamp Endedness|AEMO Timestamp Endedness]]?

**From**: [Quick start - NEMSEER 1.0.7 do...](https://nemseer.readthedocs.io/en/latest/quick_start.html#core-concepts-and-information-for-users)
> AEMO ahead process tables with forecasted results typically have _three_ datetime columns:
> 1. A [forecasted time](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecasted-time) which the forecast outputs pertain to
> 2. A nominal [run time](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run-time). For most forecast types, this is reported in the `RUN_DATETIME` column.
> 3. An [actual run time](https://nemseer.readthedocs.io/en/latest/glossary.html#term-actual-run-time)
>     - The _actual_ run time can differ from the _nominal_ time. For example:
>         - The 18:15 `P5MIN` run (`RUN_DATETIME`) may actually be run/published at 18:10 (`LASTCHANGED`)
>         - The 18:30 `PREDISPATCH` run (`PREDISPATCHSEQNO`, which is parsed into `PREDISPATCH_RUN_DATETIME` by `nemseer`) may actually be run/published at 18:02 (`LASTCHANGED`)

## P5MIN correction

**From**: [Looking at 5-minute pre-dispat...](https://nemseer.readthedocs.io/en/latest/examples/p5min_demand_forecast_error_2021.html)
> The [actual run time](https://nemseer.readthedocs.io/en/latest/glossary.html#term-actual-run-time) of 5MPD is approximately 5 minutes before the nominal [run time](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run-time). We will adjust for this in this when calculating forecast ahead times. See the note in [this section](https://nemseer.readthedocs.io/en/latest/quick_start.html#core-concepts-and-information-for-users).

*Here's the P5MIN correction*:

```python
        """ Calculate P5MIN forecast demand error given actual and forecast demand
        Ahead time calculation reflects the fact that P5MIN actual run time is
        5 minutes before the nominal run time."""
        
        # left merge ensures all forecasted values have the corresponding actual value merged in
        merged = pd.merge(
            forecast_demand, actual_demand, on="forecasted_time", how="left"
        )
        if len(merged) > len(forecast_demand):
            raise ValueError(
                "Merge should return DataFrame with dimensions of forecast data"
            )
        # subtract 5 minutes from run time to get actual run time
        merged["ahead_time"] = merged["forecasted_time"] - (
            merged["RUN_DATETIME"] - timedelta(minutes=5)
        ) ```
## PREDISPATCH correction

**From:**[Looking at pre-dispatch demand...](https://nemseer.readthedocs.io/en/latest/examples/pd_demand_forecast_error_2021.html)
> The [actual run time](https://nemseer.readthedocs.io/en/latest/glossary.html#term-actual-run-time) of PD is approximately 30 minutes before the nominal [run time](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run-time). We will adjust for this in this when calculating forecast ahead times. See the note in [this section](https://nemseer.readthedocs.io/en/latest/quick_start.html#core-concepts-and-information-for-users).

*Here's the PREDISPATCH correction*:

```python
        """
        Calculate PD forecast demand error given actual and forecast demand
        Ahead time calculation reflects the fact that PD actual run time is
        30 minutes before the nominal run time.
        """
        # merge the two types of demand
        merged = pd.merge(
            forecast_demand,
            actual_demand,
            on=["forecasted_time", "REGIONID"],
            how="left",
        )
        if len(merged) > len(forecast_demand):
            raise ValueError(
                "Merge should return DataFrame with dimensions of forecast data"
            )
        # subtract 30 minutes from run time to get actual run time
        merged["ahead_time"] = merged["forecasted_time"] - (
            merged["run_time"] - timedelta(minutes=30)
        )
```