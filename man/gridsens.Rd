% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/optim.R
\name{gridsens}
\alias{gridsens}
\title{Find parameter values that min/maximize sensitivity results via grid search}
\usage{
gridsens(pol, qs = c(0, 0.4, 0.5, 0.6, 1), dps = c(0, log(2)), d0s = c(0,
  log(2)), d1s = c(0, log(2)), params_grid = NULL, base_group = NULL,
  minority_groups = NULL, allow_sgv = FALSE, controls = NULL,
  fit_fn = "logit_coef", include_benchmark = FALSE, verbose = TRUE)
}
\arguments{
\item{pol}{object of class \code{policy}}

\item{qs}{vector q values to search}

\item{dps}{values to search for change in log-odds of treat = 1 if u = 1}

\item{d0s}{values to search for change in log-odds of response = 1 if treat =
0 and u = 1}

\item{d1s}{values to search for change in log-odds of response = 1 if treat =
1 and u = 1}

\item{params_grid}{(Optional) data frame with columns
\code{qb, qm, ab, am, d0b, d0m, d1b, d1m} indicating the parameter combinations
to be searched over. If specified, the parameter range argments (\code{qs} through \code{d1s})
are ignored.}

\item{base_group}{(Optional) single group that acts as the pivot/base; by
default, if the grouping variable is a factor, set to the first level,
otherwise set to the first of sorted unique values}

\item{minority_groups}{(Optional) groups to compare to the base group; by
default, set to every unique value other than the base group}

\item{allow_sgv}{logical; whether to allow for subgroup validity; i.e., if
\code{TRUE}, the delta parameters (\code{dp}, \code{d0}, \code{d1}) will be
allowed to vary between base/minority groups, but if \code{FALSE}, a single
value for each delta parameter will be used for each base/minority pair}

\item{controls}{vector of legitimate controls to use; the ones specified
within the policy object will be used if not specified}

\item{fit_fn}{string indicating the rad estimation model/procedure used.
\code{*_coef} methods use models without interaction between risk and
group, and return the coeficient on group membership. \code{*_avg} methods
will fit more flexible models (possibly with interactions), and compute
average ratios across the population. (TODO: better documentation is
expected)}

\item{include_benchmark}{logical; whether to include the two extreme
benchmark test results (default: FALSE)}

\item{verbose}{whether or not to print debug messages (0 = none, 1 = results
only, 2 = everything)}
}
\value{
a list-type object of class \code{gridsens} with the following
  elements \item{results}{\code{tidy} dataframe of second-stage model
  coefficients after searching for min/max values across specified sensitivy
  parameter values, independently for each minority group}
  \item{grid}{results from full grid}
  \item{base_case}{result from \code{compute_rad} on base policy with
  specified groups and controls} \item{base_group}{base group used in
  analysis}
}
\description{
Within specified values of sensitivity parameters, find the ones that achieve
minimum/maximum sensitivity results
}
