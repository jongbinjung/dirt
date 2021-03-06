% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/models.R
\name{rad_control}
\alias{rad_control}
\title{Given a policy and (optional) controls, generate a rad_control object}
\usage{
rad_control(pol, fit_fn = c("logit_coef", "gam_coef", "decbin_coef",
  "logit_avg", "gam_avg"), controls = NULL, use_speedglm = TRUE)
}
\arguments{
\item{pol}{a \code{\link{policy}} object}

\item{fit_fn}{string indicating the rad estimation model/procedure used.
\code{*_coef} methods use models without interaction between risk and
group, and return the coeficient on group membership. \code{*_avg} methods
will fit more flexible models (possibly with interactions), and compute
average ratios across the population. (TODO: better documentation is
expected)}

\item{controls}{character vector of additional controls to consider in the
second-stage model}

\item{use_speedglm}{whether or not to use \code{speedglm}, instead of
\code{stats::glm}, in cases where N > 2P (see details)}
}
\value{
a \code{rad_control} object constructed of \item{formula}{the formula
  used in model fitting} \item{label}{a character label associated with the
  model fit type} \item{grouping}{column name of group, as specified in
  \code{pol$grouping}} \item{fit}{a function of the form f(d, w = NULL, ...)
  for fitting a model with training data \code{d}} \item{pred}{function of
  the form g(m, d) for generating predictions for data \code{d} with model
  \code{m}} \item{method}{character string describing the method to use}
}
\description{
Given a policy and (optional) controls, generate a rad_control object
}
\details{
speedglm can potentially speed-up computation significantly, but
  only in cases where the number of rows is somewhat greater than the number
  of features (specifically, when N > 2P). In terms of FLOPs at each Fisher
  iteration, stats::glm requires (2np^2 - (2/3)p^3) FLOPS vs, (np^2 +
  (4/3)p^3) for speedglm.
}
