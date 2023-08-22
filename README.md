
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rcompendiumtest5

<!-- badges: start -->

[![License: GPL (\>=
2)](https://img.shields.io/badge/License-GPL%20%28%3E%3D%202%29-blue.svg)](https://choosealicense.com/licenses/gpl-2.0/)
[![Dependencies](https://img.shields.io/badge/dependencies-2/95-green?style=flat)](#)
<!-- badges: end -->

Research Compendium of the project on Open, Reproducible and Sustainable
code for epidemic analysis with R packages.

### How to cite

Please cite this compendium as in [Citing
rcompendiumtest5](https://avallecam.github.io/rcompendiumtest5/authors.html#citation).

    #> <p>Valle-Campos A (2023).
    #> <em>rcompendiumtest5: Research Compendium for Sustainable Analysis</em>.
    #> https://github.com/avallecam/rcompendiumtest5, https://avallecam.github.io/rcompendiumtest5/. 
    #> </p>

    #> @Manual{,
    #>   title = {rcompendiumtest5: Research Compendium for Sustainable Analysis},
    #>   author = {Andree Valle-Campos},
    #>   year = {2023},
    #>   note = {https://github.com/avallecam/rcompendiumtest5, https://avallecam.github.io/rcompendiumtest5/},
    #> }

### Content

This repository is structured as follow:

- [`data/`](https://github.com/avallecam/rcompendiumtest5/tree/master/data):
  contains all raw data required to perform analyses

- [`analyses/`](https://github.com/avallecam/rcompendiumtest5/tree/main/analyses/):
  contains R scripts to run each step of the workflow

- [`outputs/`](https://github.com/avallecam/rcompendiumtest5/tree/main/outputs):
  contains all the results created during the workflow

- [`figures/`](https://github.com/avallecam/rcompendiumtest5/tree/main/figures):
  contains all the figures created during the workflow

- [`R/`](https://github.com/avallecam/rcompendiumtest5/tree/main/R):
  contains R functions developed especially for this project

- [`man/`](https://github.com/avallecam/rcompendiumtest5/tree/main/man):
  contains help files of R functions

- [`DESCRIPTION`](https://github.com/avallecam/rcompendiumtest5/tree/main/DESCRIPTION):
  contains project metadata (author, date, dependencies, etc.)

- [`make.R`](https://github.com/avallecam/rcompendiumtest5/tree/main/make.R):
  main R script to run the entire project by calling each R script
  stored in the `analyses/` folder

### Usage

First, [clone the
repository](https://www.epirhandbook.com/en/version-control-and-collaboration-with-git-and-github.html?q=clone#clone-from-a-github-repository).
Then, to reproduce all the outputs, open R/RStudio and run:

``` r
source("make.R")
```

### Notes

- All required packages, listed in the `DESCRIPTION` file, will be
  installed (if necessary)
- All required packages and R functions will be loaded
- Some analyses listed in the `make.R` might take time
