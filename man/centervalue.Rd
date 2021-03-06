\name{centervalue}
\alias{centervalue}
\title{Pick Center Value from Matrix}
\usage{
  centervalue(x)
}
\arguments{
  \item{x}{a square matrix}
}
\description{
  Pick the value in the center of a square matrix.
  Auxiliary function to be used by functions called by
  \code{\link{focal.function}}.
}
\details{
  See for example the code of \code{\link{resid.median}}.
}
\examples{
( m <- matrix( round(runif(9,1,10)), ncol=3 ) )
centervalue(m)
}
\seealso{
  \code{\link{focal.function}}, \code{\link{resid.median}}
}
\keyword{utilities}

