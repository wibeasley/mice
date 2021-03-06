% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getfit.R
\name{getfit}
\alias{getfit}
\title{Extract list of fitted model}
\usage{
getfit(x, i = -1L, simplify = FALSE)
}
\arguments{
\item{x}{An object of class \code{mira} or \code{mitml.result}, 
typically produced by a call to \code{with()}.}

\item{i}{An integer between 1 and \code{x$m} signaling the number of the
repeated analysis. The default \code{i= -1} return a list with all analyses.}

\item{simplify}{Should the return value be unlisted?}
}
\value{
If \code{i = -1} an object of class \code{mitml.result} containing 
all analyses, otherwise it returns the fitted object of 
the i'th repeated analysis.
}
\description{
\code{getfit} returns the list of objects containing the repeated analysis
results, or optionally, one of these fit objects.
}
\examples{

imp <- mice(nhanes)
fit <- with(imp, lm(bmi~chl+hyp))
getfit(fit)
getfit(fit, 2)

}
\seealso{
\code{\link[=mira-class]{mira}}, \code{\link{with.mids}}
}
\author{
Stef van Buuren, March 2012.
}
\keyword{manip}
