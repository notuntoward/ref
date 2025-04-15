---
created date: 2025-04-14T15:40:50-07:00
modified date: 2025-04-15T11:55:43-07:00
---

==wind_trader/              <-- Your project root directory==
==├── pyproject.toml              <-- **PLACE THE REFINED FILE HERE**==
├── README.md                   <-- Project documentation (put it here)
├── main.py                     <-- Simple script to run a demo (put it here)
├── notebooks/                  <-- Keep your original notebook here for reference
│   └── trader_Nhours_pyomo.ipynb
==├── src/                        <-- Main source code directory==
==│   └── trading_optimizer/      <-- The actual Python package==
==│       ├── __init__.py         <-- Makes it a package (can be empty)==
==│       ├── config.py           <-- LimsAndInits, constants, config loading logic==
==│       ├── optimizer.py        <-- OptimizerMarketHour class== **kinda: I'm not clear on path**
==│       ├── orchestration.py    <-- run_daily_optimization function **nah, I'm putting it all in optimizer==
==│       └── utils/              <-- Utility sub-package **don't need this dir** 
│           ├── __init__.py     <-- Makes 'utils' a sub-package (can be empty)
│           └── sample_data.py  <-- sample_data_generator functions (or keep generator separate if preferred) **belongs in test==**
│           └── plot.py         <-- Optional: Move stackplot here if considered a utility FOR the package
├── tests/                      <-- Directory for tests
│   ├── __init__.py
│   └── test_optimizer.py       <-- Example test file
│   └── utils/                  <-- Optional: For test-specific utilities
│       └── __init__.py
==├── data/                       <-- For sample data files (e.g., .npz output)
│   └── energy_market_samples.npz # Example output from generator==
└── .venv/                      <-- Virtual environment created by 'uv venv' (usually gitignored)


# Installation
## Create and Activate virtual environment
In the `wind_trader` root directory:

```
uv venv
```

In Linux/macOS:
```
source .venv/bin/activate  
``` 

In Windows:
```
.\.venv\Scripts\activate 
```

Still in the `wind_trader` root directory:
## Install in editable mode

```
uv pip install -e .[dev]
```

`-e`: "editable" -- changes made to src code are immediately reflected without needing to reinstall.
`.`: Tells pip to install the package defined by pyproject.toml in the current directory.
`[dev]`: Installs the optional development dependencies listed in pyproject.toml

