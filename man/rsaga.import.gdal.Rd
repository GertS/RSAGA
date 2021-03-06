\name{rsaga.import.gdal}
\alias{rsaga.import.gdal}
\title{Import Grid Files to SAGA grid format using GDAL}
\usage{
  rsaga.import.gdal(in.grid, out.grid, env = rsaga.env(),
    ...)
}
\arguments{
  \item{in.grid}{file name of a grid in a format supported
  by GDAL}

  \item{out.grid}{output SAGA grid file name; defaults to
  \code{in.grid} with the file extension being removed;
  file extension should not be specified, it defaults to
  \code{.sgrd}}

  \item{env}{RSAGA geoprocessing environment created by
  \code{\link{rsaga.env}}}

  \item{...}{additional arguments to be passed to
  \code{rsaga.geoprocessor}}
}
\description{
  These functions provide simple interfaces for reading and
  writing grids from/to ASCII grids and Rd files. Grids are
  stored in matrices, their headers in lists.
}
\details{
  The GDAL Raster Import module of SAGA imports grid data
  from various file formats using the Geospatial Data
  Abstraction Library (GDAL) by Frank Warmerdam. As of SAGA
  GIS 2.0.7, GDAL version 1.8.0 is used. More information
  is available at \url{http://www.gdal.org/}.

  If \code{in.grid} has more than one band (e.g. RGB
  GEOTIFF), then output grids with file names of the form
  \eqn{in.grid{\_}01.sgrd}{in.grid_01.sgrd},
  \eqn{in.grid{\_}02.sgrd}{in.grid_02.sgrd} etc. are
  written, one for each band.

  The following raster formats are currently supported.
  Last updated for SAGA GIS 2.0.7; for an updated list in
  SAGA GIS 2.1.0 call
  \code{rsaga.html.help("io_gdal","GDAL: Import Raster")}
  \itemize{ \item{VRT}{Virtual Raster}
  \item{GTiff}{GeoTIFF} \item{NITF}{National Imagery
  Transmission Format} \item{RPFTOC}{Raster Product Format
  TOC format} \item{HFA}{Erdas Imagine Images (.img)}
  \item{SAR_CEOS}{CEOS SAR Image} \item{CEOS}{CEOS Image}
  \item{JAXAPALSAR}{JAXA PALSAR Product Reader (Level
  1.1/1.5)} \item{GFF}{Ground-based SAR Applications
  Testbed File Format (.gff)} \item{ELAS}{ELAS}
  \item{AIG}{Arc/Info Binary Grid} \item{AAIGrid}{Arc/Info
  ASCII Grid} \item{SDTS}{SDTS Raster} \item{DTED}{DTED
  Elevation Raster} \item{PNG}{Portable Network Graphics}
  \item{JPEG}{JPEG JFIF} \item{MEM}{In Memory Raster}
  \item{JDEM}{Japanese DEM (.mem)} \item{GIF}{Graphics
  Interchange Format (.gif)} \item{BIGGIF}{Graphics
  Interchange Format (.gif)} \item{ESAT}{Envisat Image
  Format} \item{BSB}{Maptech BSB Nautical Charts}
  \item{XPM}{X11 PixMap Format} \item{BMP}{MS Windows
  Device Independent Bitmap} \item{DIMAP}{SPOT DIMAP}
  \item{AirSAR}{AirSAR Polarimetric Image}
  \item{RS2}{RadarSat 2 XML Product} \item{PCIDSK}{PCIDSK
  Database File} \item{PCRaster}{nPCRaster Raster File}
  \item{ILWIS}{ILWIS Raster Map} \item{SGI}{SGI Image File
  Format 1.0} \item{SRTMHGT}{SRTMHGT File Format}
  \item{Leveller}{Leveller heightfield}
  \item{Terragen}{Terragen heightfield} \item{ISIS3}{USGS
  Astrogeology ISIS cube (Version 3)} \item{ISIS2}{USGS
  Astrogeology ISIS cube (Version 2)} \item{PDS}{NASA
  Planetary Data System} \item{TIL}{nEarthWatch .TIL}
  \item{ERS}{nERMapper .ers Labelled} \item{L1B}{NOAA Polar
  Orbiter Level 1b Data Set} \item{FIT}{FIT Image}
  \item{GRIB}{GRIdded Binary (.grb)} \item{RMF}{Raster
  Matrix Format} \item{MSGN}{EUMETSAT Archive native
  (.nat)} \item{RST}{Idrisi Raster A.1}
  \item{INGR}{Intergraph Raster} \item{GSAG}{Golden
  Software ASCII Grid (.grd)} \item{GSBG}{Golden Software
  Binary Grid (.grd)} \item{GS7BG}{Golden Software 7 Binary
  Grid (.grd)} \item{COSAR}{COSAR Annotated Binary Matrix
  (TerraSAR-X)} \item{TSX}{TerraSAR-X Product}
  \item{COASP}{DRDC COASP SAR Processor Raster} \item{R}{nR
  Object Data Store} \item{PNM}{Portable Pixmap Format
  (netpbm)} \item{DOQ1}{nUSGS DOQ (Old Style)}
  \item{DOQ2}{USGS DOQ (New Style)} \item{ENVI}{nENVI .hdr
  Labelled} \item{EHdr}{ESRI .hdr Labelled}
  \item{GenBin}{nGeneric Binary (.hdr Labelled)}
  \item{PAux}{PCI .aux Labelled} \item{MFF}{nVexcel MFF
  Raster} \item{MFF2}{Vexcel MFF2 (HKV) Raster}
  \item{FujiBAS}{nFuji BAS Scanner Image} \item{GSC}{GSC
  Geogrid} \item{FAST}{nEOSAT FAST Format} \item{BT}{VTP
  .bt (Binary Terrain) 1.3 Format} \item{LAN}{Erdas
  .LAN/.GIS} \item{CPG}{Convair PolGASP} \item{IDA}{Image
  Data and Analysis} \item{NDF}{NLAPS Data Format}
  \item{EIR}{nErdas Imagine Raw} \item{DIPEx}{DIPEx}
  \item{LCP}{FARSITE v.4 Landscape File (.lcp)}
  \item{GTX}{NOAA Vertical Datum .GTX} \item{LOSLAS}{NADCON
  .los/.las Datum Grid Shift} \item{NTv2}{NTv2 Datum Grid
  Shift} \item{RIK}{Swedish Grid RIK (.rik)}
  \item{USGSDEM}{USGS Optional ASCII DEM (and CDED)}
  \item{GXF}{GeoSoft Grid Exchange Format}
  \item{NWT_GRD}{Northwood Numeric Grid Format .grd/.tab}
  \item{NWT_GRC}{Northwood Classified Grid Format
  .grc/.tab} \item{ADRG}{ARC Digitized Raster Graphics}
  \item{SRP}{Standard Raster Product (ASRP/USRP)}
  \item{BLX}{Magellan topo (.blx)} \item{SAGA}{SAGA GIS
  Binary Grid (.sdat)} \item{KMLSUPEROVERLAY}{Kml Super
  Overlay} \item{XYZ}{ASCII Gridded XYZ} \item{HF2}{HF2/HFZ
  heightfield raster} \item{OZI}{OZI} }
}
\author{
  Alexander Brenning (R interface), Olaf Conrad / Andre
  Ringeler (SAGA module), Frank Warmerdam (GDAL)
}
\references{
  GDAL website: \url{http://www.gdal.org/}
}
\seealso{
  \code{read.ascii.grid}, \code{rsaga.esri.to.sgrd},
  \code{read.sgrd}, \code{read.Rd.grid}
}
\keyword{file}
\keyword{interface}
\keyword{spatial}

