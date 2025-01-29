---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---

**Update (12/21/24)**: I don't know what PERIODID is, but the time series looked better when I used PREDISPATCH_RUN_DATETIME as the runtime, and DATETIME as the forecasted time.

Question I asked NEM support on 2/18/24:

> What is PERIODID in MMS/PREDISPATCH/PREDISPATCHREGIONS ?  The documentation says:
> 
> "PERIODID is just a period count, starting from 1 for each Pre-Dispatch run. Use DATETIME to determine half hour period."
> 
> Does this mean that DATETIME is the time of the first interval being predicted in a forecast run, and that the time being forecasted is 
> 
> DATETIME + (PERIODID-1) * 30 minutes ?
> 
> When I organized the TOTALDEMAND forecasts using this assumption, the forecasted time series for each run appear to slip by one hour.
> 
> https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report.htm