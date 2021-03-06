\name{rsaga.get.version}
\alias{rsaga.get.version}
\title{Determine SAGA GIS version}
\usage{
  rsaga.get.version(env = rsaga.env(version = NA), ...)
}
\arguments{
  \item{env}{list, setting up a SAGA geoprocessing
  environment as created by \code{\link{rsaga.env}}. Note
  that \code{version=NA} ensures that
  \code{\link{rsaga.env}} won't call
  \code{rsaga.get.version} itself.}

  \item{...}{additional arguments to
  \code{\link{rsaga.geoprocessor}}}
}
\value{
  A character string defining the SAGA GIS (API) version.
  E.g., \code{"2.0.8"}.
}
\description{
  Determine SAGA GIS version.
}
\details{
  The function first attempts to determine the SAGA version
  directly through a system call \code{saga_cmd --version},
  which is supported by SAGA GIS 2.0.8. If this fails,
  \code{saga_cmd -h} is called, and it is attempted to
  extract the version number of the SAGA API from the
  output generated, which works for 2.0.4+.
}
\examples{
\dontrun{
myenv <- rsaga.env()
myenv$version
# rsaga.env actually calls rsaga.get.version:
rsaga.get.version()

# I keep several versions of SAGA GIS in SAGA-GIS_2.0.x folders:
myenv05 = rsaga.env(path = "C:/Progra~1/SAGA-GIS_2.0.5", version = NA)
# Check if it's really version 2.0.5 as suggested by the folder name:
rsaga.get.version(env = myenv05)
}
}
\seealso{
  \code{\link{rsaga.env}}
}
\keyword{interface}
\keyword{spatial}

