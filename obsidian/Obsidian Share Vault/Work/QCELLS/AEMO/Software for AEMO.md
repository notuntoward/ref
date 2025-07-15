---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---
Unchecked means interesting software I haven't looked at.  Checked means I have.  No checkbox means this is an FYI.

# AEMO Software Overviews
- [ ] [GitHub AEMO Repositories](https://github.com/topics/aemo
- [ ] [A Hackers Guide to AEMO & NEM Data - ADG Efficiency](https://adgefficiency.com/hackers-aemo/)
- [ ] [Open Source Tools | Collaboration on Energy and Environmental Markets](https://www.ceem.unsw.edu.au/open-source-tools)
# Data Getting 
- [x] [SparkMMS: Custom AEMO MMS Data Model CSV reader for Apache Spark](https://github.com/niftimus/SparkMMS)
	- really is Spark, though, so install is complicated
- [x] [[NEMSEER AEMO Data Downloader]]
	- problem: [[2023-11-21#NEM Missing Data Bug]]
- [nem-data: Download NEM Australian electricity grid data from AEMO.](https://github.com/ADGEfficiency/nem-data)
- [x] [NEMOSIS – NEM Open Source Information Service](zotero://select/library/items/BYFPFZG2)
- [Collaboration on Energy and Environmental Markets (CEEM) · GitHub](https://github.com/UNSW-CEEM?language=python)
# Forecasting
- [Visualising demand forecast convergence using nemseer and xarray - NEMSEER 1.0.6 documentation](https://nemseer.readthedocs.io/en/latest/examples/visualising_p5min_demand_forecasts.html)
- [Energy price convergence in 2021 - NEMSEER 1.0.6 documentation](https://nemseer.readthedocs.io/en/latest/examples/price_convergence_2021.html)
# Simulation
- [ ] [NEMStorageUnderUncertainty](https://github.com/prakaa/NEMStorageUnderUncertainty)
	- Modelling to study how imperfect foresight and information affects storage operation. Case studies using data from the Australian NEM and AEMO
- [ ] [nem-bidding-dashboard](https://github.com/UNSW-CEEM/nem-bidding-dashboard)
	- Dashboard (Web app?) & python for collating, processing and visualizing data relevant to understanding participant behavior in the Australian NEM wholesale spot market.
	- Web App at [NEM Bidding Dashboard](https://nembiddingdashboard.org)
- [nempy](https://github.com/UNSW-CEEM/nempy)
	- models NEM dispatch procedure. Can formulate very simple dispatch models, or more complex ones by adding features like ramping constraints, interconnectors, FCAS markets and more.
- [energy-market-deep-learning](https://github.com/UNSW-CEEM/energy-market-deep-learning)
	- Experiments in using deep learning to model competition in liberalized electricity markets.
	- Provides an adversarial reinforcement learning model of a restructured electricity market, specifically Australia's National Electricity Market. It is intended to work as an environment plugin for Elon Musk & Sam Altman's OpenAI Gym ([Gym](https://github.com/openai/gym) is deprecated by "drop in replacement," [Gymnasium](https://github.com/Farama-Foundation/Gymnasium))
- [CEEM-Gists: A code snippet wiki](https://github.com/UNSW-CEEM/CEEM-Gists)
	- [opennem_facilities.py](https://github.com/UNSW-CEEM/CEEM-Gists/blob/main/snippets/aemo_data/opennem_facilities.py): downloads and restructures DUID data
	- [create_parquet_partitions.py](https://github.com/UNSW-CEEM/CEEM-Gists/blob/main/snippets/aemo_data/create_parquet_partitions.py): Chunk large monthly AEMO table CSVs into parquet partitions