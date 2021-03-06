\name{rsaga.contour}
\alias{rsaga.contour}
\title{Contour Lines from a Grid}
\usage{
  rsaga.contour(in.grid, out.shapefile, zstep, zmin, zmax,
    ...)
}
\arguments{
  \item{in.grid}{input: digital elevation model (DEM) as
  SAGA grid file (default file extension: \code{.sgrd})}

  \item{out.shapefile}{output: contour line shapefile.
  Existing files will be overwritten!}

  \item{zstep,zmin,zmax}{lower limit, upper limit, and
  equidistance of contour lines}

  \item{...}{arguments to be passed to
  \code{\link{rsaga.geoprocessor}}}
}
\value{
  The type of object returned depends on the \code{intern}
  argument passed to the \code{\link{rsaga.geoprocessor}}.
  For \code{intern=FALSE} it is a numerical error code (0:
  success), or otherwise (the default) a character vector
  with the module's console output.
}
\description{
  Creates a contour lines shapefile from a grid file in
  SAGA grid format.
}
\author{
  Alexander Brenning (R interface), Olaf Conrad (SAGA
  module)
}
\seealso{
  \code{\link{rsaga.geoprocessor}}
}
\keyword{interface}
\keyword{spatial}

