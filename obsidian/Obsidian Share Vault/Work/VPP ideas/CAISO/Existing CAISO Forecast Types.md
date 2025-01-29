---
created date: 2024-07-27T11:43:32-07:00
modified date: 2024-08-13T18:15:44-07:00
---

# Day Ahead

## Day Ahead Bid Possibilities

Copied from [Perplexity](https://www.perplexity.ai/search/what-are-all-the-bids-and-offe-FCMKeSWISl.SJBFlx2x7FA#0)

The CAISO day-ahead market allows for several types of bids and offers. Here are the main ones:

1. Energy Bids:
   - Can be submitted by generators and importers to sell energy, or by loads and exporters to buy energy[1].
   - Must be submitted by 10:00 AM the day before the trading day[2].
   - Prices are determined by the bidders, subject to a bid cap of $250/MWh and floor of $0/MWh[3].

2. Ancillary Services Bids:
   - For regulation up, regulation down, spinning reserve, and non-spinning reserve[1].
   - Must be submitted by 10:00 AM the day before the trading day[2].
   - Prices are set by bidders, with the market selecting the lowest-cost options[1].

3. Reliability Must-Run (RMR) Bids:
   - Submitted for units designated as RMR to meet local reliability needs[1].
   - Must be submitted by 10:00 AM the day before the trading day[2].
   - Prices are typically based on pre-determined contract rates.

4. Convergence (Virtual) Bids: ^a7f9
   - Can be submitted to buy or sell energy without physical backing[4].
   - Must be submitted by 10:00 AM the day before the trading day[2].
   - Prices are set by bidders, aiming to profit from differences between day-ahead and real-time prices[4].

5. Self-Schedules:
   - Fixed-price bids that are placed at the beginning of economic curves[3].
   - Must be submitted by 10:00 AM the day before the trading day[2].
   - Prices are effectively set by the bidder as they are willing to accept any market price.

6. Residual Unit Commitment (RUC) Bids:
   - Submitted by generators to provide additional capacity if needed[1].
   - Must be submitted by 10:00 AM the day before the trading day[2].
   - Prices are determined by bidders, with the market selecting the most cost-effective options.

All these bids and offers are processed through the day-ahead market, which closes at 10:00 AM the day before the trading day. The market results, including cleared bids and resulting prices, are published at 1:00 PM[1]. The prices for most of these bids are determined through the market clearing process, which uses locational marginal pricing to account for energy costs, transmission congestion, and losses[3].

Citations:
[1] https://www.caiso.com/market-operations/products-services
[2] https://www.caiso.com/documents/1210.pdf
[3] https://www.caiso.com/documents/presentation-existing-day-ahead-market-overview.pdf
[4] https://www.caiso.com/market-operations/products-services/convergence-bidding
[5] https://stakeholdercenter.caiso.com/initiativedocuments/revisedfinalproposal-day-aheadmarketenhancements.pdf

# Realtime

## Realtime Bid Possibilities
Copied from [Perplexity](https://www.perplexity.ai/search/what-are-all-the-bids-and-offe-FCMKeSWISl.SJBFlx2x7FA#1)

The CAISO real-time market allows for several types of bids and offers. Here are the main ones:

1. Energy Bids:
- Can be submitted by generators and importers to sell energy, or by loads and exporters to buy energy.
- Must be submitted 75 minutes before the start of the trading hour[4].
- Prices are determined by bidders, subject to market caps and floors.

2. Ancillary Services Bids:
- For regulation up, regulation down, spinning reserve, and non-spinning reserve.
- Must be submitted 75 minutes before the start of the trading hour[4].
- Prices are set by bidders, with the market selecting the lowest-cost options to meet reliability requirements[1].

3. Self-Schedules:
- Fixed-price bids that are given priority in the market clearing process.
- Must be submitted 75 minutes before the start of the trading hour[4].
- Prices are effectively set by the bidder as they are willing to accept any market price.

4. Exceptional Dispatch Bids:
- Used by CAISO to manually commit or dispatch resources for reliability reasons.
- Can be issued at any time, including after the regular market closes[4].
- Prices are typically based on the resource's bid or a pre-determined rate.

5. Residual Unit Commitment (RUC) Bids:
- Submitted by generators to provide additional capacity if needed.
- Must be submitted 75 minutes before the start of the trading hour[4].
- Prices are determined by bidders, with the market selecting the most cost-effective options.

The real-time market opens at 1:00 p.m. the day before the trading day and closes 75 minutes before the start of each trading hour[1]. Market results are published about 45 minutes prior to the start of the trading hour[1]. The real-time market system dispatches power plants every 15 and 5 minutes, with the ability to dispatch for single 1-minute intervals under certain grid conditions[1].

Prices in the real-time market are determined through a market clearing process that uses locational marginal pricing, accounting for energy costs, transmission congestion, and losses. The California ISO's full network model analyzes active transmission and generation resources to find the least-cost energy to serve demand[1].

Citations:
[1] https://www.caiso.com/market-operations/products-services
[2] https://www.caiso.com/documents/chapter3_realtimemarketperformance11-apr-06.pdf
[3] https://www.caiso.com/documents/section34-real-timemarket-asof-nov1-2023.pdf
[4] https://www.caiso.com/documents/2210.pdf
[5] https://www.caiso.com/documents/1210.pdf

# Byron's List of Important things to forecast for CAISO
From [Slack](https://growingenergylabs.slack.com/archives/C07ET8Q8GN4/p1721944953191909?thread_ts=1721944570.148229&cid=C07ET8Q8GN4)

## His Answer
No, but what's most important in the immediate term for us are:
- Real-time energy locational marginal prices
- Day-ahead energy locational marginal prices
- Regulation-up prices
- Regulation-down prices
- Regulation-up fractional deployment ("attenuation," "utilization)
- Regulation-down fractional deployment
## Chariot (ERCOT, Actually)
From [Slack](https://growingenergylabs.slack.com/archives/C07ET8Q8GN4/p1722001843027479?thread_ts=1721945562.969299&cid=C07ET8Q8GN4)

- [ ] # Collect the rest of sources that Byron linked to later in this thread (the one with the 3 pdfs)

Byron sez: Here are slides that have been presented by Harsh and include some of the most important benchmarking results thus far. (More stuff in this thread.)

[[work/CAISO/attachments/a0e7e6ca41d86eaec9a56fb9c5b091b1_MD5.pptx|Open: GES Workshop Jan 2024 - BOP Update v4.pptx]]
![[work/CAISO/attachments/a0e7e6ca41d86eaec9a56fb9c5b091b1_MD5.pptx]]


[[58464991181de55c5b8feb82c440e676_MD5.pptx|Open: GES Workshop - Bidding & Optimization Slides 3.17.23 HPBT - 4.1.2023 - Final.pptx]]
![[58464991181de55c5b8feb82c440e676_MD5.pptx]]

[[35313e386a603661b895dac89cbf9c2e_MD5.pptx|Open: Chariot Workshop March 2024 - BOP Update v5 (2).pptx]]
![[35313e386a603661b895dac89cbf9c2e_MD5.pptx]]
# Trading Intervals

## Bids for Trading Hour, regardless of price time interval
Copied from [Perplexity](https://www.perplexity.ai/search/what-are-all-the-bids-and-offe-FCMKeSWISl.SJBFlx2x7FA#3)

In the context of the CAISO real-time market, "trading hour" refers to the clock-time hours such as 09:00-10:00, 10:00-11:00, 11:00-12:00, and so on. These are fixed, hourly intervals that align with the standard clock.

Here's how the different market timeframes relate to these trading hours:

1. Hourly Block Scheduling:
   - Aligns directly with the clock-time trading hours (e.g., 09:00-10:00)

2. 15-Minute Market (FMM):
   - Divides each trading hour into four 15-minute intervals
   - For example, for the 09:00-10:00 trading hour:
     * 09:00-09:15
     * 09:15-09:30
     * 09:30-09:45
     * 09:45-10:00

3. 5-Minute Real-Time Dispatch (RTD):
   - Further divides each 15-minute interval into three 5-minute intervals
   - For the 09:00-09:15 interval, this would be:
     * 09:00-09:05
     * 09:05-09:10
     * 09:10-09:15

The bid submission deadline (75 minutes before the start of the trading hour) is based on these clock-time trading hours. For instance, bids for the 09:00-10:00 trading hour must be submitted by 07:45.

So, to directly answer your question: The "trading hour" refers to the standard clock-time hours, and the 15-minute and 5-minute intervals are subdivisions within these hourly blocks. The market doesn't use rolling hourly periods that start every 15 or 5 minutes; instead, it uses fixed hourly blocks that are then subdivided for more granular pricing and dispatch.

## Trading Hour: single price, regardless of price time interval
e.g. for 5 minute product (Copied from [Perplexity](https://www.perplexity.ai/search/what-are-all-the-bids-and-offe-FCMKeSWISl.SJBFlx2x7FA#4))

Based on the information provided in the search results, here's what we can determine about bidding for the 5-minute Real-Time Dispatch (RTD) in CAISO's real-time market:

1. Bid submission timing:
   - Bids for the real-time market, including the 5-minute RTD, must be submitted 75 minutes before the start of the trading hour[2][4].
   - For trading hour 10 (10:00-11:00), bids would need to be submitted by 08:45.

2. Bid coverage:
   - When you submit a bid for a trading hour in the real-time market, it applies to the entire hour[1][4].
   - You do not need to submit separate bids for each 5-minute interval within the hour.

3. Market processes:
   - The Real-Time Economic Dispatch (RTED) produces binding prices and dispatch instructions every 5 minutes[4].
   - However, this is based on the bids submitted for the entire trading hour.

4. Bid adjustment:
   - Once submitted, bids cannot be changed within the 75-minute window before the trading hour starts[2].

So, to directly answer your question: No, you do not need to bid on every 5-minute period over 10:00-11:00 separately. Your single bid submission for trading hour 10 will cover all twelve 5-minute intervals within that hour. The CAISO's real-time market software will use your bid to optimize dispatch and determine prices for each 5-minute interval, but you only need to submit one bid for the entire hour.

Citations:
[1] https://www.caiso.com/documents/section34-real-timemarket-asof-nov1-2023.pdf
[2] https://www.caiso.com/documents/2210.pdf
[3] https://www.caiso.com/Documents/Chapter3_RealTimeMarketPerformance.pdf
[4] https://www.westerneim.com/Documents/Presentation-MarketOverview-CAISO.pdf
[5] https://www.caiso.com/documents/chapter3_realtimemarketperformance05-apr-07.pdf

# Failure to deliver bided power
From [Perplexity](https://www.perplexity.ai/search/what-are-all-the-bids-and-offe-FCMKeSWISl.SJBFlx2x7FA#6)

Based on the information provided in the search results and the context of CAISO's real-time market operations, here's what typically happens if your actual power output varies significantly from your bid amount:

1. Dispatch instructions:
   - The CAISO's Real-Time Dispatch (RTD) produces binding dispatch instructions every 5 minutes.
   - You are expected to follow these dispatch instructions, which may differ from your original bid amount.

2. Uninstructed deviations:
   - If your actual output varies significantly from the dispatch instructions, this is considered an uninstructed deviation.
   - The CAISO monitors and analyzes uninstructed deviations as part of its market performance assessment.

3. Imbalance energy:
   - Differences between your actual output and dispatch instructions are settled as imbalance energy in the real-time market.
   - You may be paid for over-generation or charged for under-generation based on the 5-minute real-time prices.

4. Potential penalties:
   - While not explicitly mentioned in the search results, significant or persistent deviations from dispatch instructions may lead to penalties or other consequences under CAISO rules.

5. Impact on system reliability:
   - Large deviations can affect system reliability and may require the CAISO to take additional actions to balance supply and demand.

6. Market performance:
   - Significant deviations can contribute to price volatility in the real-time market.

7. Future bidding considerations:
   - Persistent inability to meet dispatch instructions may affect how the CAISO considers your resource in future market operations.

It's important to note that some level of variation is expected and accounted for in the market design. However, significant or persistent deviations from dispatch instructions can have broader impacts on market efficiency and system reliability. The CAISO continuously monitors and assesses market performance, including the behavior of individual resources, to ensure the overall effectiveness of the real-time market.

Citations:
[1] https://www.caiso.com/todays-outlook
[2] https://www.caiso.com/documents/chapter3_realtimemarketperformance11-apr-06.pdf
[3] https://www.caiso.com/Documents/Chapter3_RealTimeMarketPerformance.pdf
[4] https://www.caiso.com/Documents/Section27-CaliforniaISOMarkets-and-Processes-asof-Nov1-2023.pdf
[5] https://www.caiso.com/documents/1210.pdf