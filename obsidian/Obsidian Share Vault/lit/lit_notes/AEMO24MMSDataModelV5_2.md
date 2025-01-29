---
category: literaturenote
tags: ml/genAI
citekey: AEMO24MMSDataModelV5_2
status: unread
dateread: 
ZoteroTags: obsLitNote
aliases:
  - MMS Data Model Report v5.2
  - MMS Data Model Report v5.2
publisher: ""
citation key: AEMO24MMSDataModelV5_2
DOI: ""
created date: 2024-04-07T23:37:09-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/MD68K4RI)   | [**URL**](https://visualisations.aemo.com.au/aemo/di-help/Content/Data_Model/MMS_Data_Model.htm#MMSDataModelv52) | [[AEMO24MMSDataModelV5_2.pdf|PDF]]
>
> 
> **Abstract**
> These documents explain the packages, tables, and reports in the Electricity and Gas Data Models.  The MMS Data Model is the definition of the interface to participants of data published by AEMO from  the NEM system. A database conforming to the MMS Data Model can contain a local copy of all  current participant-specific data recorded in the main NEM production database. The target databases  have been called such names as the Participant Database, the Participant InfoServer and the Replica  Database.  The MMS Data Model includes database tables, indexes and primary keys. The model is currently  exposed as a physical model, so is different in presentation for each RDBMS. However, the same  logical model underlies all the physical models published by AEMO.  The MMS Data Model is the target model for products transferring data from AEMO to each  participant. Current product supplied by AEMO for data transfer is Participant Data Replication  (PDR), with some support for the superseded Parser.  Compatibility of the transfer products with the MMS Data Model is the responsibility of those  products and their configuration. AEMO’s intention is to supply the data transfer products pre- configured to deliver data consistent with the MMS Data Model, noting differences where they occur  (e.g. for historical reasons).  Entity Diagrams  The entity diagrams show the key columns. Relationships have now been included in many cases.  Note:  The National Electricity Market registration classification of Yarwun Power Station Unit 1  (dispatchable unit ID: YARWUN_1) is market non-scheduled generating unit. However, it is a  condition of the registration of this unit that the Registered Participant complies with some of the  obligations of a Scheduled Generator. This unit is dispatched as a scheduled generating unit with  respect to its dispatch offers, targets and generation outputs. Accordingly, information about  YARWUN_1 is reported as scheduled generating unit information
> 
> 
> **FirstAuthor**:: AEMO  
~    
> **Title**:: "MMS Data Model Report v5.2"  
> **Date**:: 2023-05-26  
> **Citekey**:: AEMO24MMSDataModelV5_2  
> **ZoteroItemKey**:: MD68K4RI  
> **itemType**:: report  
> **DOI**::   
> **URL**:: https://visualisations.aemo.com.au/aemo/di-help/Content/Data_Model/MMS_Data_Model.htm#MMSDataModelv52  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: obsLitNote
>**Related**:: 

> AEMO. _MMS Data Model Report v5.2_. v5.2, AEMO, 26 May 2023. _Zotero_, [https://visualisations.aemo.com.au/aemo/di-help/Content/Data_Model/MMS_Data_Model.htm#MMSDataModelv52](https://visualisations.aemo.com.au/aemo/di-help/Content/Data_Model/MMS_Data_Model.htm#MMSDataModelv52).
%% begin Obsidian Notes %%
___
The tables in this pdf are also available online, [here](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report.htm).

### Demand

Package Name: DEMAND_FORECASTS

Regional Demand Forecasts (For some reason, 30 minute/8 day intermittent forecasts seem to be listed below the “DEMAND” name, yet they are not regional, but per generator).  See my annotations

There are also UIGF forecasts (5 minute ahead intermittend forecasts): ([Harper, 2023](zotero://select/library/items/JGYU35F6)),

#### Demand Forecasts

Table Name: DEMANDOPERATIONALFORECAST

Shows Forecast Operational Demand for a particular date time interval

#### Demand Actuals

Table Name: DEMANDOPERATIONALACTUAL

Shows Actual Operational Demand for a particular date time interval

### Intermittent Generation

These seem to be per-generator, not summed to region.  Interesting tables are:  Identifying record for a given forecast of an intermittent generation. This table is the version table for the INTERMITTENT_GEN_FCST_DATA table which stores the individual forecast values.

The forecasts are

[Go to annotation](zotero://open-pdf/library/items/KPHA2EBK?page=234&annotation=2W6YZW6Z) “INTERMITTENT_GEN_FCST_DATA updates every 30 minutes when AEMO issues a new 30minute forecast of intermittent generation out to 8 days ahead.” ([AEMO, 2023, p. 234](zotero://select/library/items/MD68K4RI))

INTERMITTENT_GEN_FCST

INTERMITTENT_GEN_FCST_DATA

Stores the forecast generation (MW) for each interval within a given forecast of an intermittent generator.

INTERMITTENT_GEN_LIMIT

A submission of Upper MW Limit for an intermittent generating unit, by Trading Day and Trading Interval
___
%% end Obsidian Notes %%
> [!note]- Zotero Note (1)
> AEMO24MMSDataModelV5_2
> 
> The tables in this pdf are also available online, [here](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report.htm).
> 
> ### Demand
> 
> Package Name: DEMAND_FORECASTS
> 
> Regional Demand Forecasts (For some reasion, 30 minute/8 day intermittent forecasts seem to be listed below the “DEMAND” name, yet they are not regional, but per generator).  See my annotations
> 
> There are also UIGF forecasts (5 minute ahead intermittend forecasts): ([Harper, 2023](zotero://select/library/items/JGYU35F6)),
> 
> #### Demand Forecasts
> 
> Table Name: DEMANDOPERATIONALFORECAST
> 
> Shows Forecast Operational Demand for a particular date time interval
> 
> #### Demand Actuals
> 
> Table Name: DEMANDOPERATIONALACTUAL
> 
> Shows Actual Operational Demand for a particular date time interval
> 
> ### Intermittent Generation
> 
> These seem to be per-generator, not summed to region.  Interesting tables are:  Identifying record for a given forecast of an intermittent generation. This table is the version table for the INTERMITTENT_GEN_FCST_DATA table which stores the individual forecast values.
> 
> The forecasts are
> 
> [Go to annotation](zotero://open-pdf/library/items/KPHA2EBK?page=234&annotation=2W6YZW6Z) “INTERMITTENT_GEN_FCST_DATA updates every 30 minutes when AEMO issues a new 30minute forecast of intermittent generation out to 8 days ahead.” ([AEMO, 2023, p. 234](zotero://select/library/items/MD68K4RI))
> 
> INTERMITTENT_GEN_FCST
> 
> INTERMITTENT_GEN_FCST_DATA
> 
> Stores the forecast generation (MW) for each interval within a given forecast of an intermittent generator.
> 
> INTERMITTENT_GEN_LIMIT
> 
> A submission of Upper MW Limit for an intermittent generating unit, by Trading Day and Trading Interval
> 
> <small>📝️ (modified: 2024-04-04) [link](zotero://select/library/items/YQ2UE2MJ) - [web](http://zotero.org/users/60638/items/YQ2UE2MJ)</small>
>  
> ---


## Annotations%% begin annotations %%



### Imported: 2024-04-04 5:12 pm



<mark style="background-color: #5c6bc0">Quote</mark>
> Regional Demand Forecasts and Intermittent Generation forecasts.

<mark style="background-color: #66bb6a">Quote</mark>
> DEMANDOPERATIONALACTUAL

<mark style="background-color: #66bb6a">Quote</mark>
> DEMANDOPERATIONALFORECAST

<mark style="background-color: #66bb6a">Quote</mark>
> INTERMITTENT_GEN_FCST

<mark style="background-color: #66bb6a">Quote</mark>
> INTERMITTENT_GEN_FCST_DATA

<mark style="background-color: #66bb6a">Quote</mark>
> INTERMITTENT_GEN_LIMIT

<mark style="background-color: #66bb6a">Quote</mark>
> INTERMITTENT_P5_PRED

<mark style="background-color: #66bb6a">Quote</mark>
> Table: DEMANDOPERATIONALACTUAL

<mark style="background-color: #66bb6a">Quote</mark>
> DEMANDOPERATIONALFORECAST

<mark style="background-color: #66bb6a">Quote</mark>
> INTERMITTENT_GEN_FCST

<mark style="background-color: #5c6bc0">Quote</mark>
> INTERMITTENT_GEN_FCST_DATA updates every 30 minutes when AEMO issues a new 30minute forecast of intermittent generation out to 8 days ahead.

<mark style="background-color: #66bb6a">Quote</mark>
> INTERMITTENT_GEN_FCST_DATA

<mark style="background-color: #66bb6a">Quote</mark>
> INTERMITTENT_GEN_LIMIT


> Regional Demand Forecasts and Intermittent Generation forecasts.

<mark style="background-color: #66ba6a">Quote</mark>
> DEMANDOPERATIONALACTUAL

<mark style="background-color: #66ba6a">Quote</mark>
> DEMANDOPERATIONALFORECAST

<mark style="background-color: #66ba6a">Quote</mark>
> INTERMITTENT_GEN_FCST

<mark style="background-color: #66ba6a">Quote</mark>
> INTERMITTENT_GEN_FCST_DATA

<mark style="background-color: #66ba6a">Quote</mark>
> INTERMITTENT_GEN_LIMIT

<mark style="background-color: #66ba6a">Quote</mark>
> INTERMITTENT_P5_PRED

<mark style="background-color: #66ba6a">Quote</mark>
> Table: DEMANDOPERATIONALACTUAL

<mark style="background-color: #66ba6a">Quote</mark>
> DEMANDOPERATIONALFORECAST

<mark style="background-color: #66ba6a">Quote</mark>
> INTERMITTENT_GEN_FCST


> INTERMITTENT_GEN_FCST_DATA updates every 30 minutes when AEMO issues a new 30- minute forecast of intermittent generation out to 8 days ahead.

<mark style="background-color: #66ba6a">Quote</mark>
> INTERMITTENT_GEN_FCST_DATA

<mark style="background-color: #66ba6a">Quote</mark>
> INTERMITTENT_GEN_LIMIT


### Imported: 2024-04-07 11:37 pm



<mark style="background-color: #5c6bc0">Quote</mark>
> Regional Demand Forecasts and Intermittent Generation forecasts.

<mark style="background-color: #66bb6a">Quote</mark>
> DEMANDOPERATIONALACTUAL

<mark style="background-color: #66bb6a">Quote</mark>
> DEMANDOPERATIONALFORECAST

<mark style="background-color: #66bb6a">Quote</mark>
> INTERMITTENT_GEN_FCST

<mark style="background-color: #66bb6a">Quote</mark>
> INTERMITTENT_GEN_FCST_DATA

<mark style="background-color: #66bb6a">Quote</mark>
> INTERMITTENT_GEN_LIMIT

<mark style="background-color: #66bb6a">Quote</mark>
> INTERMITTENT_P5_PRED

<mark style="background-color: #66bb6a">Quote</mark>
> Table: DEMANDOPERATIONALACTUAL

<mark style="background-color: #66bb6a">Quote</mark>
> DEMANDOPERATIONALFORECAST

<mark style="background-color: #66bb6a">Quote</mark>
> INTERMITTENT_GEN_FCST

<mark style="background-color: #5c6bc0">Quote</mark>
> INTERMITTENT_GEN_FCST_DATA updates every 30 minutes when AEMO issues a new 30minute forecast of intermittent generation out to 8 days ahead.

<mark style="background-color: #66bb6a">Quote</mark>
> INTERMITTENT_GEN_FCST_DATA

<mark style="background-color: #66bb6a">Quote</mark>
> INTERMITTENT_GEN_LIMIT


%% end annotations %%



%% Import Date: 2024-04-07T23:37:27.915-07:00 %%
