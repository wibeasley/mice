% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mice.impute.2lonly.mean.R
\name{mice.impute.2lonly.mean}
\alias{mice.impute.2lonly.mean}
\title{Imputation of the mean within the class}
\usage{
mice.impute.2lonly.mean(y, ry, x, type, wy = NULL, ...)
}
\arguments{
\item{y}{Vector to be imputed}

\item{ry}{Logical vector of length \code{length(y)} indicating the 
the subset \code{y[ry]} of elements in \code{y} to which the imputation 
model is fitted. The \code{ry} generally distinguishes the observed 
(\code{TRUE}) and missing values (\code{FALSE}) in \code{y}.}

\item{x}{Numeric design matrix with \code{length(y)} rows with predictors for 
\code{y}. Matrix \code{x} may have no missing values.}

\item{type}{Vector of length \code{ncol(x)} identifying random and class
variables.  The class variable (only one is allowed) is coded as \code{-2}.}

\item{wy}{Logical vector of length \code{length(y)}. A \code{TRUE} value 
indicates locations in \code{y} for which imputations are created.}

\item{...}{Other named arguments.}
}
\value{
Vector with imputed data, same type as \code{y}, and of length 
\code{sum(wy)}
}
\description{
Imputes the mean of within the class
}
\details{
Observed values in \code{y} are averaged within the class, and replicated to
the missing \code{y} within that class. If there are no observed data in the
class, all entries of the class are set to \code{NaN}.  This function is
primarily useful for repairing incomplete data that are constant within the
class, but that vary over the classes.
}
\seealso{
Other univariate \code{2lonly} functions: \code{\link{mice.impute.2lonly.norm}},
  \code{\link{mice.impute.2lonly.pmm}}
}
\author{
Gerko Vink, Stef van Buuren, 2013
}
\keyword{datagen}
