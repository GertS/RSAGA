\name{rsaga.env}
\alias{rsaga.env}
\title{Set up the RSAGA Geoprocessing Environment}
\usage{
  rsaga.env(workspace = ".",
    cmd = ifelse(Sys.info()["sysname"] == "Windows", "saga_cmd.exe", "saga_cmd"),
    path, modules, version, cores, parallel = FALSE,
    check.libpath = TRUE, check.SAGA = TRUE,
    check.PATH = Sys.info()["sysname"] == "Windows",
    check.os.default = TRUE,
    os.default.path = rsaga.default.path(), lib.prefix)
}
\arguments{
  \item{workspace}{path of the working directory for SAGA;
  defaults to the current directory (\code{"."}).}

  \item{cmd}{name of the SAGA command line program;
  defaults to \code{saga_cmd.exe}, its name under Windows}

  \item{path}{path in which to find \code{cmd};
  \code{rsaga.env} is usually able to find SAGA on your
  system if it is installed; see Details.}

  \item{modules}{path in which to find SAGA libraries; see
  Details}

  \item{version}{optional character string: SAGA GIS (API)
  version, e.g. \code{"2.0.8"}; if missing, a call to
  \code{\link{rsaga.get.version}} is used to determine
  version number of SAGA API}

  \item{cores}{optional numeric argument, or \code{NA}:
  number of cores used by SAGA GIS; supported only by SAGA
  GIS 2.1.0 (and higher), ignored otherwise (with a
  warning). Multicore-enabled SAGA GIS modules such as the
  one used by \code{\link{rsaga.pisr}} seem to run in
  multicore mode by default when this argument is not
  specified, therefore \code{cores} should only be
  specified to use a smaller number of cores than available
  on a machine.}

  \item{parallel}{optional logical argument (default:
  \code{FALSE}): if \code{TRUE}, run RSAGA functions that
  are capable of parallel processing in parallel mode; note
  that this is completely independent of the behaviour of
  SAGA GIS (which can be controlled using the \code{cores}
  argument); currently only some RSAGA functions support
  parallel processing (e.g.,
  \code{\link{pick.from.ascii.grid}} or
  \code{\link{rsaga.get.modules}}). \code{parallel=TRUE}
  requires that a parallel backend such as \pkg{doSNOW} or
  \pkg{doMC} is available and has been started prior to
  calling any parallelized RSAGA function, otherwise
  warnings may be generated}

  \item{check.libpath}{if \code{TRUE} (default), first look
  for SAGA GIS in the folder where the RSAGA package is
  installed}

  \item{check.SAGA}{if \code{TRUE} (default), next check
  the path given by the environment variable \code{SAGA},
  if it exists}

  \item{check.PATH}{if \code{TRUE} (default on Windows),
  next look for SAGA GIS in all the paths in the
  \code{PATH} environment variable; defaults to
  \code{FALSE} on non-Windows OS}

  \item{check.os.default}{if \code{TRUE}, look for SAGA GIS
  in the folder specified by \code{os.default.path}.}

  \item{os.default.path}{on Windows,
  \code{C:/Progra~1/SAGA-GIS}; on unix, an attempt is made
  to locate \code{saga_cmd}}

  \item{lib.prefix}{character string: a possible
  (platform-dependent) prefix for SAGA GIS library names;
  if missing (recommended), a call to
  \code{\link{rsaga.lib.prefix}} tries to determine the
  correct prefix, e.g. \code{""} on Windows systems and
  \code{"lib"} on non-Windows systems with SAGA GIS
  pre-2.1.0. Try specifying \code{""} or \code{"lib"}
  manually if this causes problems, and contact the package
  maintainer if the detection mechanism fails on your
  system (indicate your \code{Sys.info()["sysname"]} and
  your SAGA GIS version)}
}
\value{
  A list with components \code{workspace}, \code{cmd},
  \code{path}, \code{modules}, \code{version}, \code{cores}
  and \code{parallel} with values as passed to
  \code{rsaga.env} or default values as described in the
  Details section.
}
\description{
  \code{rsaga.env} creates a list with system-dependent
  information on SAGA path, module path and data (working)
  directory. This kind of a list is required by most RSAGA
  geoprocessing functions and is referred to as the 'RSAGA
  geoprocessing environment.'
}
\details{
  IMPORTANT: Unlike R functions such as
  \code{\link{options}}, which changes and saves settings
  somewhere in a global variable, \code{\link{rsaga.env}}
  does not actually 'save' any settings, it simply creates
  a list that can (and has to) be passed to other
  \code{rsaga.*} functions. See example below.

  I strongly recommend to install SAGA GIS in
  \code{"C:/Program Files/SAGA-GIS"} in the case of
  English-language Windows platforms (the equivalent
  non-English installation folder in the case of
  non-English Windows versions seems to work as well). If
  this is the only SAGA GIS copy on the computer and you do
  \emph{not} define a Windows environment variable
  \code{SAGA}, then RSAGA should normally be able to find
  your SAGA GIS installation in this folder.

  \code{rsaga.env} tries to collect infromation on the
  (R)SAGA environment. If \code{path} is missing,
  \code{rsaga.env} first looks for an environment variable
  \code{SAGA}; if this is undefined, it checks the current
  working directory, then the paths given in the PATH
  environment variable, and finally the function's guess is
  \code{"C:/Progra~1/SAGA-GIS"} (or \code{"/usr/local/bin"}
  on non-Windows systems).

  The default \code{modules} folder on Windows systems is
  the \code{modules} subfolder of the SAGA binaries'
  folder. The \code{SAGA_MLB} environment variable is
  \emph{not} checked by \code{rsaga.env}.

  On Unix (and Mac OS X) systems, the default
  \code{modules} folder is as specified in the
  \code{SAGA_MLB} environment variable. If this is empty /
  not set, then the following backup path is used. If
  \code{path} ends with "/bin", then "/bin" is changed to
  "/lib/saga" and taken as the \code{modules} path;
  otherwise, \code{/usr/local/lib/saga} is used.
}
\note{
  Note that the default \code{workspace} is \code{"."}, not
  \code{getwd()}; i.e. the default SAGA workspace folder is
  not fixed, it changes each time you change the R working
  directory using \code{setwd}.
}
\examples{
\dontrun{
# Check the default RSAGA environment on your computer:
myenv <- rsaga.env()
myenv
# SAGA data in C:/sagadata, binaries in C:/SAGA-GIS, modules in C:/SAGA-GIS/modules:
myenv <- rsaga.env(workspace="C:/sagadata", path="C:/SAGA-GIS")
# Unix: SAGA in /usr/bin (instead of the default /usr/local/bin),
# and modules in /use/lib/saga:
# myenv <- rsaga.env(path="/usr/bin")
# Use the 'myenv' environment for SAGA geoprocessing:
rsaga.hillshade("dem","hillshade",env=myenv)
# ...creates (or overwrites) grid "C:/sagadata/hillshade.sgrd"
# derived from digital elevation model "C:/sagadata/dem.sgrd"

# Same calculation with different SAGA version:
# (I keep several versions in SAGA-GIS_2.0.x folders:)
myenv05 = rsaga.env(path = "C:/Progra~1/SAGA-GIS_2.0.5")
rsaga.hillshade("dem","hillshade205",env=myenv05)
}
}
\author{
  Alexander Brenning
}
\seealso{
  \code{\link{rsaga.get.version}}
}
\keyword{interface}
\keyword{spatial}

