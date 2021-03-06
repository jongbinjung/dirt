% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/optim.R
\name{optimsens}
\alias{optimsens}
\title{Find parameter values that min/maximize sensitivity results via optim}
\usage{
optimsens(pol, range_q = c(0, 1), range_dp = c(0, log(2)), range_d0 = c(0,
  log(2)), range_d1 = c(0, log(2)), base_group = NULL,
  minority_groups = NULL, range_q_ratio = NULL, allow_sgv = FALSE,
  controls = NULL, fit_fn = "logit_coef", optim_control = list(),
  include_benchmark = FALSE, verbose = TRUE, debug = FALSE)
}
\arguments{
\item{pol}{object of class \code{policy}}

\item{range_q}{2D vector specifying min/max value of p(u = 1 | x)}

\item{range_dp}{2D vector specifying min/max value of change in log-odds of
treat = 1 if u = 1}

\item{range_d0}{2D vector specifying min/max value of change in log-odds of
response = 1 if treat = 0 and u = 1}

\item{range_d1}{2D vector specifying min/max value of change in log-odds of
response = 1 of treat = 1 and u = 1}

\item{base_group}{(Optional) single group that acts as the pivot/base; by
default, if the grouping variable is a factor, set to the first level,
otherwise set to the first of sorted unique values}

\item{minority_groups}{(Optional) groups to compare to the base group; by
default, set to every unique value other than the base group}

\item{range_q_ratio}{(Optional) 2D vector. If set, the minority and base
values of q will not be allowed to vary independently, but instead will be
constrained to vary by the given range of log odds. ie q_minority =
inv.logit(logit(q_base) + u), where u is in range_q_ratio}

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

\item{optim_control}{list of control parameters passed to \code{optim}}

\item{include_benchmark}{logical; whether to include the two extreme
benchmark test results (default: FALSE)}

\item{verbose}{whether or not to print debug messages (0 = none, 1 = results
only, 2 = everything)}

\item{debug}{logical flag, if TRUE, returns a list of results and the
expanded data frame used to fit model}
}
\value{
a list-type object of class \code{optimsens} with the following
  elements \item{results}{\code{tidy} dataframe of second-stage model
  coefficients after searching for min/max values across specified sensitivy
  parameter ranges, independently for each minority group}
  \item{optim}{nested data frame where the \code{$optim} column contains the
  optimization results} \item{base_case}{result from \code{compute_rad} on
  base policy with specified groups and controls} \item{base_group}{base
  group used in analysis}
}
\description{
Within specified range of sensitivity parameters, find the ones that achieve
minimum/maximum sensitivity results
}
\details{
If any of the \code{range_} arguments are set to a single value
  (instead of a 2D vector), the corresponding paramter will be fixed and not
  explored for the optimization
}
