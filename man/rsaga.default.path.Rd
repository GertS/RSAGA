\name{rsaga.default.path}
\alias{rsaga.default.modules.path}
\alias{rsaga.default.path}
\title{Determine SAGA GIS default paths}
\usage{
  rsaga.default.path(sysname = Sys.info()["sysname"])

  rsaga.default.modules.path(sysname = Sys.info()["sysname"],
    saga.path = rsaga.default.path(sysname))
}
\arguments{
  \item{sysname}{character: name of the operating system,
  determined by default by \code{\link[base]{Sys.info}}:
  e.g., \code{"Windows"}, \code{"Linux"}, \code{"Darwin"}
  (for Mac OSX), or \code{"FreeBSD"}}

  \item{saga.path}{character: path with SAGA GIS binaries,
  as determined (e.g.) by \code{rsaga.default.path}}
}
\description{
  Internal functions that determine OS-specific default
  paths in which SAGA GIS binaries and modules might be
  located.
}
\details{
  These functions are used internally by
  \code{\link{rsaga.env}}. On Windows systems, the guess
  made by \code{rsaga.default.path} is
  \code{"C:/Progra~1/SAGA-GIS"}, and for the modules, it is
  the \code{"modules"} subfolder of the path with the
  binaries.

  On non-Windows systems, \code{rsaga.default.path} submits
  a \code{which saga_cmd} call to the operating system to
  find the binaries, usually in \code{/usr/local/bin} or in
  \code{/usr/bin}. To find the modules,
  \code{rsaga.default.modules.path} first checks if a
  \code{SAGA_MLB} environment variable exists. If not, it
  will replace the \code{/bin} part (if present) with
  \code{/lib/saga} or otherwise it just guesses that it's
  \code{/usr/local/lib/saga}.
}
\seealso{
  \code{\link{rsaga.env}}
}

