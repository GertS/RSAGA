\name{set.file.extension}
\alias{default.file.extension}
\alias{get.file.extension}
\alias{set.file.extension}
\title{Determine or modify file name extensions}
\usage{
  set.file.extension(filename, extension,
    fsep = .Platform$file.sep)

  get.file.extension(filename, fsep = .Platform$file.sep)

  default.file.extension(filename, extension,
    force = FALSE)
}
\arguments{
  \item{filename}{character vector: file name(s), possibly
  including paths and extensions; a file name ending with a
  \code{"."} is interpreted as having extension \code{""},
  while a file name that doesn't contain a \code{"."} is
  interpreted has having no extension.}

  \item{extension}{character string: file extension,
  without the dot}

  \item{fsep}{character: separator between paths}

  \item{force}{logical argument to
  \code{default.file.extension}: force the file extension
  to be \code{extension} (same result as
  \code{set.file.extension}), or only set it to extension
  if it has not been specified?}
}
\value{
  character vector of same length as \code{filename}
}
\description{
  Function \code{get.file.extension} determines the file
  extension, \code{set.file.extension} changes it, and
  \code{default.file.extension} changes it only if it is
  not already specified.
}
\examples{
fnm = c("C:/TEMP.DIR/temp","C:/TEMP.DIR/tmp.txt","tempfile.")
get.file.extension(fnm)
set.file.extension(fnm,extension=".TMP")
default.file.extension(fnm,extension=".TMP")
}
\keyword{file}
\keyword{utilities}

