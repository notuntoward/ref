---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---

Some kinda transform that captures characteristic patterns in multivariate time series which takes little training data ([[Buhler20aatadrivenMktSimSigTransfrm]]), and is also less vulnerable to concept shift (I think I remember).

I might try them for AEMO price prediction: [[Algorithms for AEMO]]
# Papers
- python lib: [[Loning19unifMLinterfaceTSsktime|sktime: A Unified Interface for Machine Learning with Time Series]]
	- implements [[Morrill21GenSignatureTSfeatExtract|Morril 21: Generalised Signature Method for Multivariate Time Series Feature Extraction]]
- price forecast: [[Sidogi23SigTransfrmStockLOB|A Signature Transform of Limit Order Book Data for Stock Price Prediction]]
- [[Akyildirim22sigMethodsMktAnmly|Applications of Signature Methods to Market Anomaly Detection]]
- [[Buhler20aatadrivenMktSimSigTransfrm|A Data-driven Market Simulator for Small Data Environments]]
- [[Pattnaik20LightGBMautoRgrsSktime|A LightGBM Autoregressor — Using Sktime]]