---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---

The [[NEMSEER AEMO Data Downloader]]
downloads data from the [MMSDM Historical Data SQLLoader](https://nemseer.readthedocs.io/en/latest/glossary.html#term-MMSDM-Historical-Data-SQLLOader)

### Overviews
- Glossary, tables: [A Hackers Guide to AEMO & NEM Data - ADG Efficiency](https://adgefficiency.com/hackers-aemo/)
- [JonL's AEMO Confluence Page](https://growingenergylabs.atlassian.net/wiki/spaces/~883646944/pages/8205828144/AUS+VPP?atlOrigin=eyJpIjoiOTEyMTU1OTRjYjUzNDNmZGIyNjI2NzA1NWVjMjg0NTEiLCJwIjoiY29uZmx1ZW5jZS1jaGF0cy1pbnQifQ)
### Demand
- Probably irrelevant to NEMSEER data since NEM and EMMS use different terms: [Demand Terms in EMMS Data Models](zotero://select/library/items/4HX48JGQ) 
- [NEMOSIS/examples/generator\_bidding\_data.ipynb at master · UNSW-CEEM/NEMOSIS · GitHub](https://github.com/UNSW-CEEM/NEMOSIS/blob/master/examples/generator_bidding_data.ipynb)

### Rooftop PV
The  [MMS Data Model Report Table](https://visualisations.aemo.com.au/aemo/nemweb/mmsdatamodelreport/electricity/mms%20data%20model%20report_files/MMS_112.htm) [3](https://visualisations.aemo.com.au/aemo/nemweb/mmsdatamodelreport/electricity/mms%20data%20model%20report_files/MMS_112.htm). contains this

Note that neither utility wind nor solar are in this table.
### Tables, Rooftop PV
- [Table: ROOFTOP_PV_ACTUAL](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_111.htm) ^96b448
	- Estimate of regional Rooftop Solar actual generation for each half-hour interval in a day
	- TYPE column:
		- DAILY- best quality estimated actuals, available day after
		- MEASUREMENT- best quality estimated actuals on day, delayed by 1 half hour
		- SATELLITE- estimated actuals using satellite imagery, delayed by 1 half hour
	- QI column: a data quality indicator
- [Table: ROOFTOP_PV_FORECAST](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_112.htm) ^caa277
	- is probabilistic
	- summed to region
	- Also: [AEMO | Nemweb data: Rooftop PV - Forecast](https://www.aemo.com.au/energy-systems/electricity/national-electricity-market-nem/data-nem/market-data-nemweb)
		- asdfasdf
			- asdfasdf
				- asdfasdf

### CSVs, Rooftop_PV

I see the zipped csv files [here](https://www.nemweb.com.au/Data_Archive/Wholesale_Electricity/MMSDM/2023/MMSDM_2023_09/MMSDM_Historical_Data_SQLLoader/DATA/) e.g.
- [PUBLIC_DVD_ROOFTOP_PV_ACTUAL_202309010000.zip](https://www.nemweb.com.au/Data_Archive/Wholesale_Electricity/MMSDM/2023/MMSDM_2023_09/MMSDM_Historical_Data_SQLLoader/DATA/PUBLIC_DVD_ROOFTOP_PV_ACTUAL_202309010000.zip)  
- [PUBLIC_DVD_ROOFTOP_PV_FORECAST_202309010000.zip](https://www.nemweb.com.au/Data_Archive/Wholesale_Electricity/MMSDM/2023/MMSDM_2023_09/MMSDM_Historical_Data_SQLLoader/DATA/PUBLIC_DVD_ROOFTOP_PV_FORECAST_202309010000.zip)
## Wind
- [MMS Data Model Report, Table: INTERMITTENT_GEN_FCST_DATA](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_101.htm#1) ^5a7a9c
	- INTERMITTENT_GEN_FCST_DATA updates every 30 minutes when AEMO issues a new 30-minute forecast of wind generation out to 8 days ahead.
## General intermittent, sometime just unsummed
- [Table: INTERMITTENT_FORECAST_TRK](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_132.htm#1)
	- Uniquely tracks which Intermittent Generation forecast was used for the DUID in which Dispatch run
	- Its in [MMS Data Model Report Package: DISPATCH](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_113.htm#1)

- [MMS Data Model Report some page](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_131_2.htm)
	- has a bunch of solar/wind/intermittent columns, probably actuals
	- not clear what table this is in though
	- Is distantly linked to [AEMO | Nemweb data](https://www.aemo.com.au/energy-systems/electricity/national-electricity-market-nem/data-nem/market-data-nemweb) 
		- has current and archived reports
		- each report [seems to be daily, some for next day too](https://nemweb.com.au/Reports/Current/)
		- 
- [MMS Data Model Report Table: INTERMITTENT_GEN_SCADA](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_104.htm)
	- INTERMITTENT_GEN_SCADA provides the SCADA <mark style="background: #ADCCFFA6;">Availability</mark> for every intermittent generating unit, including Elements Available (wind turbines/solar inverters) and Local Limit
	- organized by individual DUID for each unit
- List of Tables MMS Data Model Report
	- This is what the [google search result](https://www.google.com/search?q=wind+site%3A%2F%2Fnemweb.com.au%2FReports%2FCurrent%2FMMSDataModelReport%2FElectricity&sca_esv=575285569&sxsrf=AM9HkKmuQSfPuzJ2OU3qLlEoC3i4TrKzZA%3A1697834102389&ei=duQyZZe1F7zv0PEPk6mCsAk&ved=0ahUKEwiXyL30vIWCAxW8NzQIHZOUAJYQ4dUDCBE&uact=5&oq=wind+site%3A%2F%2Fnemweb.com.au%2FReports%2FCurrent%2FMMSDataModelReport%2FElectricity&gs_lp=Egxnd3Mtd2l6LXNlcnAiSHdpbmQgc2l0ZTovL25lbXdlYi5jb20uYXUvUmVwb3J0cy9DdXJyZW50L01NU0RhdGFNb2RlbFJlcG9ydC9FbGVjdHJpY2l0eUgAUABYAHAAeACQAQCYAQCgAQCqAQC4AQPIAQD4AQHiAwQYACBB&sclient=gws-wiz-serp) heading calls it (about the 9th search result)
	- But when I click on the [link given by the search](http://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_93.htm)
	- I go to [Package: DEMAND_FORECASTS](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_93.htm)
		- [Table: INTERMITTENT_DS_PRED](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_98.htm#1)
			- Unconstrained Intermittent Generation Forecasts (UIGF) for Dispatch
			- organized by "DUID (or Area for non-scheduled) where this forecast applies"
				- So I guess this could include utility solar and wind?
			- it's probabilistic
		- [Table: INTERMITTENT_DS_RUN](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_99.htm#1)
			- Unconstrained Intermittent Generation Forecasts (UIGF) for Dispatch.
			- It's per-generator, so ugh!
			- **difference between this table the the one above?**
		- [Table: INTERMITTENT_GEN_FCST](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_100.htm#1)
			- NOT INTERESTING, I think, unless need to combine forecast versions someday.  It's the Identifying record for a given forecast of an intermittent generation. This table is the version table for the INTERMITTENT_GEN_FCST_DATA table which stores the individual forecast values
		- [Table: INTERMITTENT_GEN_FCST_DATA](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_101.htm#1)
			- Seems to be only a wind power forecast. Yup, see above.
			- Stores the forecast generation (MW) for each interval within a given forecast of an intermittent generator.
			- INTERMITTENT_GEN_FCST_DATA updates every 30 minutes when AEMO issues a new 30-minute forecast of wind generation out to 8 days ahead.
		- [Table: INTERMITTENT_GEN_LIMIT](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_102.htm#1)
			- A submission of Upper MW Limit for an intermittent generating unit, by Trading Day and Trading Interval
			- DUID-ordered
		- [Table: INTERMITTENT_GEN_LIMIT_DAY](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_103.htm#1)
			- Summary record for an Upper MW Limit submission for an intermittent generating unit for a Trading Day
		- [Table: INTERMITTENT_GEN_SCADA](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_104.htm#1)
			- INTERMITTENT_GEN_SCADA provides the SCADA Availability for every intermittent generating unit, including Elements Available (wind turbines/solar inverters) and Local Limit
		- Rooftop PV tables (above)
- [MMS Data Model Report Table: DISPATCHREGIONSUM](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_131.htm)
	- View thought this might have solar, wind, etc. in it (org daily: 2023-10-02.org). There are some wind and solar things there e.g. SS_SOLAR_UIGF and SS_WIND_UIGF, but seem to be [only 5 minutes ahead forecasts](zotero://select/library/items/JGYU35F6).
- Promising looking tables easier to find in section 7.6 of the [MMS Data Model Report](zotero://select/library/items/MD68K4RI)
	- [DEMAND_FORECASTS : DEMANDOPERATIONALFORECAST](zotero://select/library/items/MD68K4RI)
	- [DEMAND ACTUALS : DEMANDOPERATIONALACTUAL](zotero://select/library/items/MD68K4RI)
	- [INTERMITTENT GENERATION](zotero://select/library/items/MD68K4RI)
- [Table: STPASA_REGIONSOLUTION](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_353.htm)
	- a volatility feature?
	- STPASA_REGIONSOLUTION shows the results of the regional capacity, maximum surplus reserve and maximum spare capacity evaluations for each period of the study.
	- STPASA_REGIONSOLUTION is updated each STPASA run (i.e every 2 hours).
	- Rows per day: 480
	- Note: [Table: MTPASA_REGIONSOLUTION](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report_files/MMS_431.htm) is obsolete at 2017 end
	- 


  

### Description

|   |
|---|
|STPASA_REGIONSOLUTION is public so is available to all participants.<br><br>Source<br><br>STPASA_REGIONSOLUTION is updated each STPASA run (i.e every 2 hours).<br><br>Volume<br><br>Rows per day: 480<br><br>Mb per month: 8|
