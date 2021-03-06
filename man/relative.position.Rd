\name{relative.position}
\alias{relative.position}
\alias{relative.rank}
\title{Relative Topographic Position}
\usage{
  relative.position(x)

  relative.rank(x, ties.method = "average")
}
\arguments{
  \item{x}{a square matrix with the grid data from the
  moving window, possibly containing \code{NA} values}

  \item{ties.method}{see \code{\link{rank}}}
}
\value{
  If \code{x} is provided, a numeric value in the interval
  [0,1] is returned.

  If \code{x} is missing, a character vector of same length
  giving suggested variable (or file) names, here
  \code{"relpos"} and \code{"relrank"}, respectively. See
  \code{\link{focal.function}} for details.
}
\description{
  \code{relative.position} and \code{relative.rank} are
  used with \code{\link{focal.function}} to determine the
  relative value of a grid cell compared to its
  surroundings, either on a metric scale or based on ranks.
}
\examples{
m = matrix( round(runif(9,1,10)), ncol=3 )
print(m)
relative.position(m)
relative.rank(m)
\dontrun{
focal.function("dem",fun=relative.rank,radius=5)
focal.function("dem",fun=relative.position,radius=5)
relrank = as.vector(read.ascii.grid("relrank")$data)
relpos  = as.vector(read.ascii.grid("relpos")$data)
plot(relpos,relrank,pch=".")
cor(relpos,relrank,use="complete.obs",method="pearson")
}
}
\seealso{
  \code{\link{focal.function}}, \code{\link{rank}},
  \code{\link{centervalue}}
}
\keyword{spatial}

