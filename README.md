# Kerry Flux Data

Standardised flux data for the [IE-Kil](http://www.europe-fluxdata.eu/home/site-details?id=IE-Kil) (Killorglin - Glencar) site in Co. Kerry, Ireland collected during the CarboEuropeIP (EU-FP6) (<http://carboeurope.org/ceip/>) project.

Existing standardised data for IE-Kil for the years 2002-2012 can be downloaded from the [European Fluxes Database Cluster](http://www.europe-fluxdata.eu).

This repository details steps taken to standardise the remaining data (i.e. 2012-2016) to complete the archive in the European Fluxes Database.

## Site details

IE-Kil (Killorglin)

- An Atlantic blanket bog
- Located near Glencar, Co. Kerry, in south-west Ireland
- Latitude: 51.9683611, Longitude: -9.9003056
- Area: ~450 ha
- Lies on sandstone bedrock
- Located in a valley at an elevation 145-170 m above sea level
- Composed of a large central pristine part (~220 ha), surrounded by disturbed peatland areas
- Instruments: Campbell Scientific dataloggers, ...
- Status: ...

Source: [Sottocornola (2007)](https://www.ucc.ie/en/media/research/hydromet/SottocornolaThesis.2007.pdf)

## Variables

The IE-Kil data already archived on the European Fluxes Database Cluster are Level 2 data, i.e. data provided by the PIs, half-hourly, not gap-filled or filtered but quality checked by the PIs.
The variables are listed [here](http://www.europe-fluxdata.eu/home/guidelines/obtaining-data/variables-and-formats).
They are also listed in a [TSV file](data/europe_fluxdata_variables.tsv) in the `data` folder.

Variables for the [raw data](data/ts_data_variables.tsv) and [flux data](data/flux_variables.tsv) are also available in the `data` folder.
These have been compiled from the data headers with additional descriptions from [Cantero et al. (2019)](https://doi.org/10.5281/zenodo.3187482) and [Jaimes (2014)](https://scholarworks.utep.edu/open_etd/1263).
A number of these variables cite [Webb et al. (1980)](https://doi.org/10.1002/qj.49710644707).

Variables used in the REddyProc R package are listed in another [TSV file](data/reddyproc_ameriflux_bgc_variables.tsv) and are mapped to [AmeriFlux variables](https://ameriflux.lbl.gov/data/aboutdata/data-variables/).

## Raw and flux data formats

The data (DAT) files come from Campbell Scientific dataloggers.

To view a DAT file's contents (first 10 lines):

```sh
sed -n '1,10p' 'file.dat'
```

If the DAT file is binary, the output looks something like this:

```text
"TOB3","1541","CR5000","1541","2.3","CPU:3D_LI_EB_DFnew.CR5","52197","2014-12-22 11:34:18"
"ts_data","100 MSEC","1024","57237140","26132","Sec100Usec","           0","   790944810"
"Ux","Uy","Uz","co2","h2o","Ts","press","diag_csat","diag_irga"
"m/s","m/s","m/s","mg/(m^3)","g/(m^3)","C","kPa","unitless","unitless"
"Smp","Smp","Smp","Smp","Smp","Smp","Smp","Smp","Smp"
"IEEE4B","IEEE4B","IEEE4B","IEEE4B","IEEE4B","IEEE4B","IEEE4B","IEEE4B","IEEE4B"
Pd�.�@������:D)�@ݿbA3M�B�$A
`B��󷾩��D)�T@ݟ�A4Z�B�$@�A��      G�?�x�D)��@�v�A6��B�$@���=%�T@.D)��@ݞ�A3�!B�$@�A�����?y�_D)�h@�oA4�B��A��?Ұ!?|��D)��@ޢ�A=7BB��A
�?�`B�p�D*�@�DA1�rB��@��@89Y�� �D*l@�*
                                      A3�B�@��?��ؾ�t�D)�F@���A�B�$@�;e?����|�   D)�(@��mA6��B�1R@��i@J����D)��@�]�A5��B�,k@�fg@���>�SD)�@޷�A2U�B�$@�@G
>��WD)�d@ކ@A4��B�$@�+@V�Ϳ2�!D)�@ޗA2�B�$@ӗ�@����XD)��@�|/A4��B�@|v�?�~���-D)�@ޖ<A3ipB�(�@�hs>D�>�XD)�@ނ�A5�B�:@�%�A��?\I�D)�t@�A3��B�$@��?��D)֎@�d�A3��B�$@�bN?*�=�ȵD)��@�tNA3F�B�$@��>��
                                                                                           C�D)��@߸9A5Y�B�$@���>�o���D)�@�.�A50]B�$@�K�?��>.�D)ܩ@ތVA4��B�$@p�>�?D�kD)��@�,�A5D�B�$@���>�1(>�E�D)�]@�$A3�B�$@����bN?�&�D)�@��
```

If the DAT file is a text file, the output looks something like this:

```text
"TOA5","2806","CR1000","2806","CR1000.Std.06","CPU:3D_LI_TGA_VNOTDNEW.CR1","21445","ts_data"
"TIMESTAMP","RECORD","Ux","Uy","Uz","co2","h2o","n2o","Ts","press","diag_csat","t_hmp","e_hmp"
"TS","RN","m/s","m/s","m/s","mg/m^3","g/m^3","umol/mol","C","kPa","unitless","C","kPa"
"","","Smp","Smp","Smp","Smp","Smp","Smp","Smp","Smp","Smp","Smp","Smp"
"2014-12-22 11:47:39.3",761139393,1.69375,0.68975,0.8642501,760.738,8.81152,"NAN",12.08542,99.28229,0,11.51643,1.219314
"2014-12-22 11:47:39.4",761139394,1.551,0.1625,1.36275,760.2671,8.790375,"NAN",12.10226,99.24676,0,11.51643,1.220242
"2014-12-22 11:47:39.5",761139395,1.51725,-0.11075,1.74625,760.1978,8.794267,"NAN",12.16629,99.24676,0,11.80331,1.2455
"2014-12-22 11:47:39.6",761139396,1.95925,-0.34375,0.6390001,760.7865,8.813287,"NAN",12.07193,99.24676,0,11.61206,1.227055
"2014-12-22 11:47:39.7",761139397,1.3605,-0.455,1.206,760.8245,8.806199,"NAN",12.12418,99.25624,0,11.70769,1.235777
"2014-12-22 11:47:39.8",761139398,0.5765,-0.9160001,1.22775,760.9031,8.796409,"NAN",12.12582,99.22072,0,11.70769,1.236716
```

Binary data are in the TOB3 (Table Oriented Binary 3) format, while the text-based data are in the TOA5 (Table Oriented ASCII 5) format.
Binary data can be viewed and converted into TOA5 by installing the free [PC400](https://www.campbellsci.eu/pc400) software (Windows only; requires admin rights to install) from Campbell Scientific and using the Card Convert utility.
More information can be found in this [LI-COR EddyPro guide](https://www.licor.com/env/support/EddyPro/topics/processing-ascii-and-tob1-files.html#PreparingrawfluxdataloggedbyaCampbellDataloggerforprocessing).
TOA5 files can be processed just like any other CSV file in R.

## Notebooks

Notebooks demonstrating the methods used can be found [here](docs/).

## Installation

Set-up a Conda virtual environment:

```sh
conda env create
conda activate kerry-flux
R -e "IRkernel::installspec()"
```

Note: On Windows, use `R.exe` instead of `R`.

Install R packages:

```r
install.packages("REddyProc")
```

## Further reading

References and links related to this topic can be found in this Zotero library:
<https://www.zotero.org/groups/4706660/climag/collections/2ITV79EF>

## Licence

Scripts are licenced under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).
