\name{resid.median}
\alias{resid.median}
\alias{resid.minmedmax}
\alias{resid.quantile}
\alias{resid.quartiles}
\title{Residual Median and Quantile Filters for Grids}
\usage{
  resid.median(x)

  resid.minmedmax(x)

  resid.quantile(x, probs)

  resid.quartiles(x)
}
\arguments{
  \item{x}{a square matrix with the grid data from the
  moving window, possibly containing \code{NA} values}

  \item{probs}{numeric vector of probabilities in [0,1] to
  be passed to \code{\link{quantile}}}
}
\value{
  If \code{x} is provided, a numeric vector of length 1
  (\code{resid.median}), 3 (\code{resid.minmedmax} and
  \code{resid.quartiles}), or \code{length(probs)}
  (\code{resid.quantile}).

  If \code{x} is missing, a character vector of same length
  giving suggested variable (or file) names, such as
  \code{"rmed"}. See \code{\link{focal.function}} for
  details.
}
\description{
  These functions use the median and other quantiles to
  describe the difference between a grid value and its
  neighborhood. They are designed for use with
  \code{\link{focal.function}}.
}
\details{
  These functions are designed for being called by
  \code{\link{focal.function}}, which repeatedly passes the
  contents of a square or circular moving window to these
  functions.

  The \code{resid.median} function rests the value of the
  central grid cell from the median of the whole moving
  window. Thus, in terms of topography, a positive residual
  median indicates that this grid cell stands out compared
  to its surroundings. \code{resid.quantile} gives more
  flexibility in designing such residual attributes.
}
\seealso{
  \code{\link{focal.function}}, \code{\link{quantile}},
  \code{\link{median}}, \code{\link{centervalue}}
}
\keyword{spatial}

