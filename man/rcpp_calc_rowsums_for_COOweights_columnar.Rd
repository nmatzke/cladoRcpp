% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cladoRcpp.R
\name{rcpp_calc_rowsums_for_COOweights_columnar}
\alias{rcpp_calc_rowsums_for_COOweights_columnar}
\title{Calculate sum of weights for each ancestral state}
\usage{
rcpp_calc_rowsums_for_COOweights_columnar(COO_weights_columnar,
  numstates = 1 + max(sapply(X = COO_weights_columnar, FUN = max)[1:3]),
  printmat = TRUE)
}
\arguments{
\item{COO_weights_columnar}{Transition probability matrix in COO-like format as 4 columns: 
ancestral index, left index, right index, conditional probability given ancestral states.
(assuming likelihood of descendants is 1). Indexes are 0-based.
Keep in mind that cladogenesis matrices exclude the null state
(a range of 0 areas), so if your states list starts with the 
null range (as is typical/default in DEC-style models)
then to get the R 1-based state indices requires e.g. 
COO_weights_columnar[[1]] + 2.}

\item{numstates}{The user should provide the number of states (WITHOUT counting the null range),
in case they are not all
present in \code{COO_weights_columnar}.  If empty, the function assumes that the highest 
index represents the last state, and adds 1 to get the number of states. This may be a 
hazardous assumption.}

\item{printmat}{Should the probability matrix output be printed to screen? (useful for debugging, but 
can be dramatically slow in R.app for some reason for even moderate numbers of states; perhaps 
overrunning the line length...)}
}
\value{
\code{rowsums} A vector of size (numstates)  giving the sum of the relative probabilites of 
each combination of descendant states, assuming the probabilities of the left- and right-states are 
all equal (set to 1). This is thus the sum of the weights, and dividing by this normalization vector 
means that the each row of the speciation probability matrix will sum to 1.  Default assumes the 
weights sum to 1 but this is not usually the case. Rsp_rowsums need only be calculated once per 
tree+model combination, stored, and then re-used for each node in the tree, yielding significant 
time savings.
}
\description{
This is a C++ implementation of \code{\link{rcpp_calc_anclikes_sp_rowsums}}.  It should
be substantially faster, as it requires only one pass through \code{COO_weights_columnar}.
}
\examples{
# For the basic logic of a probablistic cladogenesis model, see
?rcpp_calc_anclikes_sp

# For examples of running the functions, see the comparison of all functions at:
# ?cladoRcpp

}
\seealso{
\code{\link{rcpp_calc_anclikes_sp}}
#bibliography /Dropbox/_njm/__packages/cladoRcpp_setup/cladoRcpp_refs.bib
  @cite Matzke_2013
  @cite Matzke_2014
}
\author{
Nicholas Matzke \email{matzke@berkeley.edu}
}
