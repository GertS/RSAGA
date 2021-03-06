\name{rsaga.filter.gauss}
\alias{rsaga.filter.gauss}
\title{Gauss Filter}
\usage{
  rsaga.filter.gauss(in.grid, out.grid, sigma,
    radius = ceiling(2 * sigma), ...)
}
\arguments{
  \item{in.grid}{input: SAGA GIS grid file (default file
  extension: \code{.sgrd})}

  \item{out.grid}{output: SAGA GIS grid file}

  \item{sigma}{numeric, >0.0001: standard deviation
  parameter of Gauss filter}

  \item{radius}{positive integer: radius of moving window}

  \item{...}{optional arguments to be passed to
  \code{\link{rsaga.geoprocessor}}, including the
  \code{env} RSAGA geoprocessing environment}
}
\value{
  The type of object returned depends on the \code{intern}
  argument passed to the \code{\link{rsaga.geoprocessor}}.
  For \code{intern=FALSE} it is a numerical error code (0:
  success), or otherwise (the default) a character vector
  with the module's console output.
}
\description{
  Smooth a grid using a Gauss filter.
}
\author{
  Alexander Brenning (R interface), Olaf Conrad (SAGA
  module)
}
\seealso{
  \code{\link{rsaga.filter.simple}}
}
\keyword{interface}
\keyword{spatial}

