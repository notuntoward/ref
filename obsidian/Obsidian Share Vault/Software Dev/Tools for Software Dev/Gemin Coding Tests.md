---
created date: 2025-07-13T13:08:23-05:00
modified date: 2025-07-13T13:16:54-05:00
---
# Calorie and Exercise Grapher
## Prompt
```
Make a dashboard showing time series graphs of my cronology.com calorie data. In the top plot, plot my daily calorie intake and consumption.  On the graph below that, make a double y-axis graph.  On the left axis, plot the daily net calories; on the right axis, plot the rolling net calorie sum.

The number of days in the rolling sum should be configurable by a control.

The plots should be scrollable and zoomable, and the x-axes of the two graphs should be tied, so they show the same time region.

Create a new public GitHub repo called "calorie_plot", initialize a Python uv environment, and ensure all generated code uses and updates this environment

Download the calorie data from the cronology site itself.  Here are two examples of code that can do this:

[GitHub - jrmycanady/gocronomet...](https://github.com/jrmycanady/gocronometer)
[GitHub - jrmycanady/cronometer...](https://github.com/jrmycanady/cronometer-export)

Cache the data and update the cache when the program is started.

For this project, always use `uv add` (not `uv pip install`) when installing dependencies.

```