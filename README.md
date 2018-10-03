# cladoRcpp
cladoRcpp: C++ implementations of phylogenetic cladogenesis calculations

Various cladogenesis-related calculations that are slow in pure R are implemented in C++ with Rcpp. These include the calculation of the probability of various scenarios for the inheritance of geographic range at the divergence events on a phylogenetic tree, and other calculations necessary for models which are not continuous-time markov chains (CTMC), but where change instead occurs instantaneously at speciation events.  Typically these models must assess the probability of every possible combination of (ancestor state, left descendent state, right descendent state).  This means that there are up to (# of states)^3 combinations to investigate, and in biogeographical models, there can easily be hundreds of states, so calculation time becomes an issue.  C++ implementation plus clever tricks (many combinations can be eliminated a priori) can greatly speed the computation time over naive R implementations.

**Build status** on Travis-CI: [![Build Status](https://travis-ci.org/nmatzke/cladoRcpp.svg?branch=master)](https://travis-ci.org/nmatzke/cladoRcpp)

**NOTE:** As of 2018-10-03, a new version of rexpokit, 0.15, has been submitted on CRAN. This version includes minor modifications for trait-dependent dispersal models, and removes some dependencies previously needed by cladoRcpp/BioGeoBEARS. CRAN version is here, binaries should be available in a few days: [https://cran.r-project.org/package=rexpokit](https://cran.r-project.org/package=rexpokit)

**Release v0.15** registered on Zenodo: [![DOI](https://zenodo.org/badge/17001945.svg)](https://zenodo.org/badge/latestdoi/17001945)

**Zenodo link for release:** 

**Zenodo DOI for release:** 
