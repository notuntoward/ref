---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---
### Data Getter Quick Start
From: [Quick start - NEMSEER 1.0.6 documentation](https://nemseer.readthedocs.io/en/latest/quick_start.html)

**Also**
* [[Software for AEMO]]
* [xarray: N-D labeled arrays and datasets in Python](zotero://select/library/items/FK8RI6SX)
* [NEMOSIS – NEM Open Source Information Service](zotero://select/library/items/BYFPFZG2)
* [AEMO glossary](zotero://select/library/items/LEQLCQE4)

`nemseer` lets you download <span style="color:#00b0f0">raw historical forecast</span> data from the [MMSDM Historical Data SQLLoader](https://nemseer.readthedocs.io/en/latest/glossary.html#term-MMSDM-Historical-Data-SQLLOader), cache it in the [parquet](https://nemseer.readthedocs.io/en/latest/quick_start.html#parquet) format and use `nemseer` to assemble and filter forecast data into a [`pandas.DataFrame`](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.html#pandas.DataFrame "(in pandas v2.1.1)") or [`xarray.Dataset`](https://docs.xarray.dev/en/stable/generated/xarray.Dataset.html#xarray.Dataset "(in xarray v2023.9.1.dev0)") for further analysis. Assembled queries can optionally be saved to a [processed cache](https://nemseer.readthedocs.io/en/latest/quick_start.html#processed-cache).

## Core concepts and information for users[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#core-concepts-and-information-for-users "Permalink to this heading")

### Glossary[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#glossary "Permalink to this heading")

Refer to the [glossary](https://nemseer.readthedocs.io/en/latest/glossary.html) for an overview of key terminology used in `nemseer`. This includes descriptions of datetimes accepted as inputs in `nemseer`:

-   [run\_start](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run_start)
    
-   [run\_end](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run_end)
    
-   [forecasted\_start](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecasted_start)
    
-   [forecasted\_end](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecasted_end)
    

Note

<span style="color:#00b0f0">AEMO</span> ahead process tables with <span style="color:#00b0f0">forecasted results typically have _three_ datetime columns:</span>

1.  A [forecasted time](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecasted-time) which the forecast outputs pertain to
    
2.  A nominal [run time](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run-time). For most forecast types, this is reported in the `RUN_DATETIME` column.
    
3.  An [actual run time](https://nemseer.readthedocs.io/en/latest/glossary.html#term-actual-run-time)
    
    -   The _actual_ run time can differ from the _nominal_ time. For example:
        
        -   The 18:15 `P5MIN` run (`RUN_DATETIME`) may actually be run/published at 18:10 (`LASTCHANGED`)
            
        -   The 18:30 `PREDISPATCH` run (`PREDISPATCHSEQNO`, which is parsed into `PREDISPATCH_RUN_DATETIME` by `nemseer`) may actually be run/published at 18:02 (`LASTCHANGED`)
            

The glossary also provides an overview of the various ahead processes run by AEMO, including:

-   [P5MIN](https://nemseer.readthedocs.io/en/latest/glossary.html#term-P5MIN)
	- `P5MIN` is run for every dispatch interval for the next hour.   
-   [PREDISPATCH](https://nemseer.readthedocs.io/en/latest/glossary.html#term-PREDISPATCH)
	- `PREDISPATCH` forecasts are generated every half hour at half-hourly resolution until the end of the last [trading day](https://nemseer.readthedocs.io/en/latest/glossary.html#term-trading-day) for which bid band price submission has closed (this occurs at 1230 EST).  See [Australian Energy Market Operator, 2021. Pre-dispatch operating procedure.](https://nemseer.readthedocs.io/en/latest/glossary.html#id17).
	- **Price forecast error sensitivities**
	- For both `P5MIN` and `PREDISPATCH`, the impact of demand forecast error on regional energy prices and interconnector flows are explored through a sensitivity analysis.  See: [Australian Energy Market Operator, 2021. Pre-Dispatch Sensitivities](https://nemseer.readthedocs.io/en/latest/glossary.html#id10) And [Australian Energy Market Operator, 2021. Pre-dispath operating procedure.](https://nemseer.readthedocs.io/en/latest/glossary.html#id18). Only sensitivites for `PREDISPATCH` are available via the [MMSDM Historical Data SQLLOader](https://nemseer.readthedocs.io/en/latest/glossary.html#term-MMSDM-Historical-Data-SQLLOader).>)
-   [PDPASA](https://nemseer.readthedocs.io/en/latest/glossary.html#term-PDPASA)
    
-   [STPASA](https://nemseer.readthedocs.io/en/latest/glossary.html#term-STPASA)
    
-   [MTPASA](https://nemseer.readthedocs.io/en/latest/glossary.html#term-MTPASA)
    

### Parquet[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#parquet "Permalink to this heading")

[Parquet](https://www.databricks.com/glossary/what-is-parquet) files can be loaded using data analysis packages such as [pandas](https://pandas.pydata.org/docs/reference/api/pandas.read_parquet.html), and work well with packages for handling large on-memory/cluster datasets (e.g. [polars](https://www.pola.rs/) and [dask](https://docs.dask.org/en/stable/generated/dask.dataframe.read_parquet.html)). Parquet offers efficient data compression and columnar data storage, which can mean faster queries from file. Parquet files also store file metadata (which can include table schema).

### Types of compiled data[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#types-of-compiled-data "Permalink to this heading")

`nemseer` has functionality that allows a user to <span style="color:#00b050">compile</span> data into two types of <span style="color:#00b0f0">in-memory data structures</span>:

-   [pandas DataFrames](https://pandas.pydata.org/pandas-docs/stable/user_guide/dsintro.html#dataframe). Pandas is a widely-used Python package for manipulating data.
    
-   Multi-dimensional [xarray Datasets](https://docs.xarray.dev/en/stable/user-guide/data-structures.html#dataset). xarray is intended for handling and querying data across multiple dimensions (e.g. the regional price forecast for a particular [forecasted time](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecasted-time) from a range of [run times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run-times))
    
    -   For more information, refer to the [_Getting started_](https://docs.xarray.dev/en/stable/getting-started-guide/index.html) section of the xarray documentation. The [xarray tutorial](https://tutorial.xarray.dev/intro.html) is also an excellent resource.
        
    -   Converting to xarray can be [memory-intensive](https://nemseer.readthedocs.io/en/latest/quick_start.html#managing-memory).
        

### Managing memory[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#managing-memory "Permalink to this heading")

Some q<span style="color:#00b0f0">ueries via `nemseer` may require a large amount of memory</span> to complete. While memory use is query-specific, we suggest that `nemseer` be used on a system with at least 8GB of RAM. <span style="color:#ffc000">16GB+ is preferable</span>.

However, there are <span style="color:#00b0f0">some things you can try </span>if you do run into issues with memory. The suggestions below also apply to large queries on powerful computers:

1.  You can use `nemseer` to <span style="color:#00b0f0">simply download raw data as CSVs</span> or to then cache data in the parquet format. Once you have a cache, you can use tools like [polars](https://www.pola.rs/) or [dask](https://docs.dask.org/en/stable/index.html) to <span style="color:#00b0f0">process chunks of data in parallel</span>. You may be able to reduce peak memory usage this way. It should be noted that `nemseer` converts a single AEMO CSV into a single parquet file. That is, it does not partition the parquet store.
    
2.  Conversion to [`xarray.Dataset`](https://docs.xarray.dev/en/stable/generated/xarray.Dataset.html#xarray.Dataset "(in xarray v2023.9.1.dev0)") can be memory intensive. As this usually occurs when the data to be converted has a high number of dimensions (as determined by `nemseer`), `nemseer` will print a warning prior to attempting to convert any such data. While [xarray integrates with dask](https://docs.xarray.dev/en/stable/user-guide/dask.html), this functionality is c<span style="color:#00b0f0">ontingent on loading data from a netCDF file.</span>
    

### <span style="color:#00b050">Processed cache</span>[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#processed-cache "Permalink to this heading")

The [processed\_cache](https://nemseer.readthedocs.io/en/latest/glossary.html#term-processed_cache) is optional, but may be useful for some users. Specifying a path for this argument will lead to `nemseer` <span style="color:#00b0f0">saving queries</span> (i.e. requested data filtered based on user-supplied [run times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run-times) and [forecasted times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecasted-times)) as [parquet](https://nemseer.readthedocs.io/en/latest/quick_start.html#parquet) (if the [`pandas.DataFrame`](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.html#pandas.DataFrame "(in pandas v2.1.1)") data structure is specified) or [netCDF](https://www.unidata.ucar.edu/software/netcdf/) (if the [`xarray.Dataset`](https://docs.xarray.dev/en/stable/generated/xarray.Dataset.html#xarray.Dataset "(in xarray v2023.9.1.dev0)") data structure is specified).

If subsequent `nemseer` queries include this [processed\_cache](https://nemseer.readthedocs.io/en/latest/glossary.html#term-processed_cache), `nemseer` will check file metadata of the relevant file types to see if a particular table query has already been saved. If it has, `nemseer` will compile data from the [processed\_cache](https://nemseer.readthedocs.io/en/latest/glossary.html#term-processed_cache).

Note

Because `nemseer` looks at metadata stored _in_ each file, it <span style="color:#00b0f0">does not care about the file name as long as file extensions are preserved</span> (i.e. `*.parquet`, `*.nc`). As such, files in the [processed\_cache](https://nemseer.readthedocs.io/en/latest/glossary.html#term-processed_cache) can be renamed from default file names assigned by `nemseer`.

<span style="color:#ff0000">Warning</span>

Saving to <span style="color:#ffc000">netCDF</span> will <span style="color:#00b0f0">let you load xarray objects into memory</span>. However, saving these datasets to netCDF files may take up <span style="color:#00b0f0">large amounts of hard disk</span> space.

### Deprecated tables[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#deprecated-tables "Permalink to this heading")

If tables have been deprecated, `nemseer` will print a warning when the table is being downloaded. Deprecated tables are documented [`here`](https://nemseer.readthedocs.io/en/latest/api.html#nemseer.data.DEPRECATED_TABLES "nemseer.data.DEPRECATED_TABLES").

## What can I query?[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#what-can-i-query "Permalink to this heading")

`nemseer` has <span style="color:#00b0f0">functionality to tell you what you can query.</span> This includes valid [forecast types](https://nemseer.readthedocs.io/en/latest/quick_start.html#forecast-types), [months and years](https://nemseer.readthedocs.io/en/latest/quick_start.html#date-range-of-available-data) for which data is available and requestable [tables](https://nemseer.readthedocs.io/en/latest/quick_start.html#table-availability).

Note

While these functions allow you to explicitly query this information, it’s worth noting that functions for [compiling data](https://nemseer.readthedocs.io/en/latest/quick_start.html#compiling-data) and [downloading raw data](https://nemseer.readthedocs.io/en/latest/quick_start.html#downloading-raw-data) <span style="color:#00b0f0">validate inputs and provide feedback when invalid</span> inputs (such as invalid forecast types or data date ranges) are supplied.

### Forecast types[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#forecast-types "Permalink to this heading")

You can access valid [forecast types](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecast-types) with the command below.

```
>>> import nemseer
>>> nemseer.forecast_types
('P5MIN', 'PREDISPATCH', 'PDPASA', 'STPASA', 'MTPASA')

```

### Date range of available data[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#date-range-of-available-data "Permalink to this heading")

The <span style="color:#00b0f0">years and months available</span> via AEMO’s [MMSDM Historical Data SQLLoader](https://nemseer.readthedocs.io/en/latest/glossary.html#term-MMSDM-Historical-Data-SQLLOader) can be queried as follows.

```
>>> import nemseer
>>> nemseer.get_data_daterange()
{...}

```

### Table availability[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#table-availability "Permalink to this heading")

You can also <span style="color:#00b0f0">see which tables are available</span> for a given year, month and [forecast type](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecast-type).

Below, we fetch [pre-dispatch](https://nemseer.readthedocs.io/en/latest/glossary.html#term-pre-dispatch) tables available for January 2022 (i.e. this month would include or be between [run\_start](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run_start) and [run\_end](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run_end)):

```
>>> import nemseer
>>> nemseer.get_tables(2022, 1, "PREDISPATCH")
['CASESOLUTION', 'CONSTRAINT', 'CONSTRAINT_D', 'INTERCONNECTORRES', 'INTERCONNECTORRES_D', 'INTERCONNECTR_SENS_D', 'LOAD', 'LOAD_D', 'MNSPBIDTRK', 'OFFERTRK', 'PRICE', 'PRICESENSITIVITIE_D', 'PRICE_D', 'REGIONSUM', 'REGIONSUM_D', 'SCENARIODEMAND', 'SCENARIODEMANDTRK']

```

AEMO’s [MMS Data Model reports](https://nemweb.com.au/Reports/Current/MMSDataModelReport/Electricity/MMS%20Data%20Model%20Report.htm) <span style="color:#00b0f0">describe tables and columns</span> that are available via `nemseer`.

#### `PREDISPATCH` tables[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#predispatch-tables "Permalink to this heading")

Note

For some pre-dispatch table (`CONSTRAINT`, `LOAD`, `PRICE`, `INTERCONNECTORRES` and `REGIONSUM`), there are two types of tables. Those ending with `_D` <span style="color:#00b0f0">only contain the latest forecast</span> for a particular interval, whereas those <span style="color:#00b0f0">without</span> `_D` <span style="color:#00b0f0">have all relevant forecasts</span> for an interval of interest.

## <span style="color:#ffc000">Compiling</span> data[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#compiling-data "Permalink to this heading")

The main use case of `nemseer` is to download raw data (if it is not available in the [raw\_cache](https://nemseer.readthedocs.io/en/latest/glossary.html#term-raw_cache)) and then compile it into a data format for further analysis/processing. To do this, `nemseer` has [`compile_data`](https://nemseer.readthedocs.io/en/latest/nemseer.html#nemseer.compile_data "nemseer.compile_data").

This function:

1.  Downloads the relevant raw data and converts it into [parquet](https://nemseer.readthedocs.io/en/latest/quick_start.html#parquet) in the [raw\_cache](https://nemseer.readthedocs.io/en/latest/glossary.html#term-raw_cache).
    
2.  If it’s supplied, interacts with a [processed\_cache](https://nemseer.readthedocs.io/en/latest/glossary.html#term-processed_cache) (see [below](https://nemseer.readthedocs.io/en/latest/quick_start.html#compiling-data-to-a-processed-cache)).
    
3.  <span style="color:#00b0f0">Returns a dictionary</span> consisting of compiled [`pandas.DataFrame`](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.html#pandas.DataFrame "(in pandas v2.1.1)")s or [`xarray.Dataset`](https://docs.xarray.dev/en/stable/generated/xarray.Dataset.html#xarray.Dataset "(in xarray v2023.9.1.dev0)")s (i.e. assembled and filtered based on the supplied [run times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run-times) and [forecasted times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecasted-times)) mapped to their corresponding table name.
    

For example, we can compile [STPASA](https://nemseer.readthedocs.io/en/latest/glossary.html#term-STPASA) forecast data contained in the `CASESOLUTION` and `CONSTRAINTSOLUTION` tables. The query below will filter [run times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run-times) between “2021/02/01 00:00” and “2021/02/28 00:00” and [forecasted times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecasted-times) between 09:00 on March 1 and 12:00 on March 3. The returned [`dict`](https://docs.python.org/3/library/stdtypes.html#dict "(in Python v3.12)") <span style="color:#00b0f0">maps each of the requested tables to their corresponding assembled and filtered datasets</span>. These datasets are [`pandas.DataFrame`](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.html#pandas.DataFrame "(in pandas v2.1.1)") as `data_format="df"` (this is the default for this argument).

```
>>> import nemseer
>>> data = nemseer.compile_data(
... run_start="2021/02/01 00:00",
... run_end="2021/02/28 00:00",
... forecasted_start="2021/03/01 09:00",
... forecasted_end="2021/03/01 12:00",
... forecast_type="STPASA",
... tables=["CASESOLUTION", "CONSTRAINTSOLUTION"],
... raw_cache="./nemseer_cache/",
... data_format="df",
... )
INFO: Downloading and unzipping CASESOLUTION for 2/2021
INFO: Downloading and unzipping CONSTRAINTSOLUTION for 2/2021
INFO: Converting PUBLIC_DVD_STPASA_CASESOLUTION_202102010000.CSV to parquet
INFO: Converting PUBLIC_DVD_STPASA_CONSTRAINTSOLUTION_202102010000.CSV to parquet
>>> data.keys()
dict_keys(['CASESOLUTION', 'CONSTRAINTSOLUTION'])

```

In the example above we include <span style="color:#00b0f0">argument names, but these can be omitted.</span>

You can also just <span style="color:#00b0f0">query a single table</span>, such as the query below:

```
>>> import nemseer
>>> data = nemseer.compile_data(
... "2021/02/01 00:00",
... "2021/02/28 00:00",
... "2021/03/01 09:00",
... "2021/03/01 12:00",
... "STPASA",
... "REGIONSOLUTION",
... "./nemseer_cache/",
... )
INFO: Downloading and unzipping REGIONSOLUTION for 2/2021
INFO: Converting PUBLIC_DVD_STPASA_REGIONSOLUTION_202102010000.CSV to parquet
>>> data.keys()
dict_keys(['REGIONSOLUTION'])

```

<span style="color:#ff0000">Note</span>

`nemseer` also <span style="color:#00b0f0">accepts datetimes with seconds</span> specified, so long as the seconds are `00`. This is because the datetime fields that are relevant to `nemseer` functionality are <span style="color:#00b0f0">specified to the nearest minut</span>e.

With datetimes specified down to seconds, you can the same datetimes for `nemseer` as you would for other related tools, such as [`NEMOSIS`](https://github.com/UNSW-CEEM/NEMOSIS) or [`NEMED`](https://github.com/UNSW-CEEM/NEMED).

We can also compile data to an [`xarray.Dataset`](https://docs.xarray.dev/en/stable/generated/xarray.Dataset.html#xarray.Dataset "(in xarray v2023.9.1.dev0)"). To do this, we need to set `data_format="xr"`:

```
>>> import nemseer
>>> data = nemseer.compile_data(
... "2021/02/01 00:00",
... "2021/02/28 00:00",
... "2021/02/28 00:30",
... "2021/02/28 00:55",
... "P5MIN",
... "REGIONSOLUTION",
... "./nemseer_cache/",
... data_format="xr",
... )
INFO: Downloading and unzipping REGIONSOLUTION for 2/2021
INFO: Converting PUBLIC_DVD_P5MIN_REGIONSOLUTION_202102010000.CSV to parquet
INFO: Converting REGIONSOLUTION data to xarray.
>>> data.keys()
dict_keys(['REGIONSOLUTION'])
>>> type(data['REGIONSOLUTION'])
<class 'xarray.core.dataset.Dataset'>

```

### Compiling data <span style="color:#ffc000">to a processed cache</span>[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#compiling-data-to-a-processed-cache "Permalink to this heading")

As outlined [above](https://nemseer.readthedocs.io/en/latest/quick_start.html#processed-cache), compiled data can be saved to the [processed\_cache](https://nemseer.readthedocs.io/en/latest/glossary.html#term-processed_cache) as <span style="color:#ffc000">parquet</span> (if `data_format` = “df”) or as <span style="color:#ffc000">netCDF</span> files (if `data_format` = “xr”).

If the same [processed\_cache](https://nemseer.readthedocs.io/en/latest/glossary.html#term-processed_cache) is supplied to subsequent queries, `nemseer` will check whether any portion of the subsequent query has already been saved in the [processed\_cache](https://nemseer.readthedocs.io/en/latest/glossary.html#term-processed_cache). If it has, `nemseer` will load data from the [processed\_cache](https://nemseer.readthedocs.io/en/latest/glossary.html#term-processed_cache), thereby bypassing any download/raw data compilation.

With a supplied [processed\_cache](https://nemseer.readthedocs.io/en/latest/glossary.html#term-processed_cache), we can save the query to parquet (`data_format` = “df”) or to netCDF (`data_format` = “xr”):

```
>>> import nemseer
>>> data = nemseer.compile_data(
... "2021/02/01 00:00",
... "2021/02/28 00:00",
... "2021/03/01 09:00",
... "2021/03/01 12:00",
... "STPASA",
... "REGIONSOLUTION",
... "./nemseer_cache/",
... processed_cache="./processed_cache/",
... )
INFO: Query raw data already downloaded to nemseer_cache
INFO: Writing REGIONSOLUTION to the processed cache as parquet

```

And if this saved query is a portion of another subsequent query, `nemseer` will load data from the [processed\_cache](https://nemseer.readthedocs.io/en/latest/glossary.html#term-processed_cache):

```
>>> import nemseer
>>> data = nemseer.compile_data(
... "2021/02/01 00:00",
... "2021/02/28 00:00",
... "2021/03/01 09:00",
... "2021/03/01 12:00",
... "STPASA",
... ["CASESOLUTION", "REGIONSOLUTION"],
... "./nemseer_cache/",
... processed_cache="./processed_cache/",
... )
INFO: Query raw data already downloaded to nemseer_cache
INFO: Compiling REGIONSOLUTION data from the processed cache
INFO: Writing CASESOLUTION to the processed cache as parquet

```

### Validation and feedback[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#validation-and-feedback "Permalink to this heading")

[`compile_data`](https://nemseer.readthedocs.io/en/latest/nemseer.html#nemseer.compile_data "nemseer.compile_data") will validate user inputs and provide feedback on valid inputs. Specifically, it validates:

1.  Basic datetime chronologies (e.g. [run\_end](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run_end) not before [run\_start](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run_start))
    
2.  Whether the requested [forecast type](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecast-type) and table type(s) are valid
    
3.  Whether the requested [run times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run-times) and `forecasted times` are valid for the requested [forecast type](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecast-type). In other words, forecasts that are run between [run\_start](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run_start) and [run\_end](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run_end) only produce data for a certain range of [forecasted times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecasted-times). This varies between [forecast types](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecast-types). For more information, refer to the forecast-specific datetime [`validators`](https://nemseer.readthedocs.io/en/latest/api.html#module-nemseer.forecast_type.validators "nemseer.forecast_type.validators").
    

### <span style="color:#ffc000">Getting valid run times for a set of forecasted times</span>[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#getting-valid-run-times-for-a-set-of-forecasted-times "Permalink to this heading")

If you’re interested in forecast data for a particular datetime range (i.e. between [forecasted\_start](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecasted_start) and [forecasted\_end](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecasted_end)) but not sure what the valid [run times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run-times) for this range are, <span style="color:#ffc000">you can us</span>e [`generate_runtimes`](https://nemseer.readthedocs.io/en/latest/nemseer.html#nemseer.generate_runtimes "nemseer.generate_runtimes").

This function returns the first [run\_start](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run_start) and last [run\_end](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run_end) between which forecast outputs for the [forecasted times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecasted-times) are available.

In the example below, we request [run times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run-times) that contain data for the [forecasted times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecasted-times) used in the [compiling data examples](https://nemseer.readthedocs.io/en/latest/quick_start.html#compiling-data):

```
>>> import nemseer
>>> nemseer.generate_runtimes("2021/03/01 09:00", "2021/03/01 12:00", "STPASA")
('2021/02/22 14:00', '2021/02/28 14:00')

```

You can see that in the [compiling data examples](https://nemseer.readthedocs.io/en/latest/quick_start.html#compiling-data) we had a wider [run time](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run-time) range. This is fine since filtering will only retain [run times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run-times) that contain the requested [forecasted times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecasted-times). The inverse is not true: [`compile_data`](https://nemseer.readthedocs.io/en/latest/nemseer.html#nemseer.compile_data "nemseer.compile_data") will raise errors if the requested [forecasted times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-forecasted-times) are not valid/do not have forecast outputs for the requested [run times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run-times).

## <span style="color:#ffc000">Downloading raw data</span>[#](https://nemseer.readthedocs.io/en/latest/quick_start.html#downloading-raw-data "Permalink to this heading")

You can download data to a cache using [`download_raw_data()`](https://nemseer.readthedocs.io/en/latest/nemseer.html#nemseer.download_raw_data "nemseer.download_raw_data"). This function <span style="color:#ffc000">only downloads</span> data to the [raw\_cache](https://nemseer.readthedocs.io/en/latest/glossary.html#term-raw_cache).

CSVs can be retained by specifying `keep_csv=True`.

Unlike [compiling data](https://nemseer.readthedocs.io/en/latest/quick_start.html#compiling-data), <span style="color:#00b0f0">only one set of datetimes</span> needs to be provided (though these datetimes are keyword arguments for this function):

1.  Provide `forecasted_start` and `forecasted_end` only. `nemseer` will determine the appropriate `run_start` and `run_end` for this forecasted range (via [`nemseer.generate_runtimes()`](https://nemseer.readthedocs.io/en/latest/nemseer.html#nemseer.generate_runtimes "nemseer.generate_runtimes")) and download the corresponding raw data.
    
2.  Provide `run_start` and `run_end` only. Dummy forecasted times are used.
    

```
>>> import nemseer
>>> nemseer.download_raw_data(
... forecast_type="P5MIN",
... tables="REGIONSOLUTION",
... raw_cache="./nemseer_cache/",
... forecasted_start="2020/01/02 00:00",
... forecasted_end="2020/01/02 00:30",
... keep_csv=False
... )
INFO: Downloading and unzipping REGIONSOLUTION for 1/2020
INFO: Converting PUBLIC_DVD_P5MIN_REGIONSOLUTION_202001010000.CSV to parquet

```

Alternatively, provide [run times](https://nemseer.readthedocs.io/en/latest/glossary.html#term-run-times):

```
>>> import nemseer
>>> nemseer.download_raw_data(
... forecast_type="P5MIN",
... tables="REGIONSOLUTION",
... raw_cache="./nemseer_cache/",
... run_start="2021/01/02 00:00",
... run_end="2021/01/02 00:30",
... keep_csv=False
... )
INFO: Downloading and unzipping REGIONSOLUTION for 1/2021
INFO: Converting PUBLIC_DVD_P5MIN_REGIONSOLUTION_202101010000.CSV to parquet

```


# Footnotes
[^1] Australian Energy Market Operator, 2021. Pre-dispatch operating procedure.