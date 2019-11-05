# cladoRcpp
cladoRcpp: C++ implementations of phylogenetic cladogenesis calculations

This is a required dependency of [BioGeoBEARS](https://github.com/nmatzke/BioGeoBEARS), an R package for phylogenetic biogeography.

Various cladogenesis-related calculations that are slow in pure R are implemented in C++ with Rcpp. These include the calculation of the probability of various scenarios for the inheritance of geographic range at the divergence events on a phylogenetic tree, and other calculations necessary for models which are not continuous-time markov chains (CTMC), but where change instead occurs instantaneously at speciation events.  Typically these models must assess the probability of every possible combination of (ancestor state, left descendent state, right descendent state).  This means that there are up to (# of states)^3 combinations to investigate, and in biogeographical models, there can easily be hundreds of states, so calculation time becomes an issue.  C++ implementation plus clever tricks (many combinations can be eliminated a priori) can greatly speed the computation time over naive R implementations.

**Build status** on Travis-CI: [![Build Status](https://travis-ci.org/nmatzke/cladoRcpp.svg?branch=master)](https://travis-ci.org/nmatzke/cladoRcpp)

**Installation**

As cladoRcpp contains C++ code, it is easiest to install the pre-compiled binaries from CRAN. This is done from the R command line, with:

```
install.packages("cladoRcpp")
```

If you want to install the GitHub version, you will need gcc compilers installed on your machine. Then, install using devtools:

```
library(devtools)
install_github("nmatzke/cladoRcpp", INSTALL_opts="--byte-compile")
```

To see examples of the cladoRcpp calculations, see the example code with:

```
library(cladoRcpp)
?cladoRcpp
```


**NOTE:** As of 2018-10-03, a new version of cladoRcpp, 0.15, has been submitted on CRAN. This version includes minor modifications for trait-dependent dispersal models, and removes some dependencies previously needed by cladoRcpp/BioGeoBEARS. CRAN version is here, binaries should be available in a few days: [https://cran.r-project.org/package=cladoRcpp](https://cran.r-project.org/package=cladoRcpp)

**Release v0.15** registered on Zenodo: [![DOI](https://zenodo.org/badge/140660124.svg)](https://zenodo.org/badge/latestdoi/140660124)

**Zenodo link for release:** https://zenodo.org/badge/latestdoi/140660124

**Zenodo DOI for release:** http://dx.doi.org/10.5281/zenodo.1442932
