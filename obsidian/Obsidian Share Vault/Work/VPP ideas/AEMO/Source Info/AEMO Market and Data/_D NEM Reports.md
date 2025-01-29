---
tags:
  - AEMO
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---
From: [\_D NEM reports](https://visualisations.aemo.com.au/aemo/di-help/Content/Framework_and_Glossary/_DFiles.htm?TocPath=Framework%7C_____4)

**Update**: This table isn't available in NEMSEER.  When I try to download it, I see: ValueError: Forecast type should be one of ('P5MIN', 'PREDISPATCH', 'PDPASA', 'STPASA', 'MTPASA')

The \_D reports contain only the latest forecast for each forecasted half hour.  This is like the stupid way that the NYISO database vendor stores its forecast data.  However, this file will be shorter, and might be useful for debugging.
# \_D NEM Reports
[[2024-03-23]]

This topic explains the use of _D NEM reports and how they contrast with the normal reports, for example:

For more details, see the [\_D NEM reports](https://visualisations.aemo.com.au/aemo/di-help/Content/Framework_and_Glossary/_DFiles.htm?TocPath=Framework%7C_____4)

- NEXT_DAY_PREDISPATCH_D
- NEXT_DAY_PREDISPATCH

The _D NEM reports send the latest data for each Trading Interval where it is not subsequently superseded. In the example below for Next_Day_Predispatch_D data, it includes only the first Trading Interval as subsequent cases supersede all but the first period.

![[4bb2bc5a33bece5d8515cde39da599ac_MD5.png]]