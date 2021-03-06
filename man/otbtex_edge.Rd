% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rs_textures.R
\name{otbtex_edge}
\alias{otbtex_edge}
\title{Calculates edges for a given kernel size.}
\usage{
otbtex_edge(input = NULL, out = "edge", ram = "8192",
  filter = "gradient", filter.touzi.xradius = 1,
  filter.touzi.yradius = 1, channel = NULL, retRaster = FALSE,
  outDir = NULL, verbose = FALSE, giLinks = NULL)
}
\arguments{
\item{input}{of GeoTiff containing 1 ore more gray value band(s)}

\item{out}{the output mono band image containing the edge features}

\item{ram}{reserved memory in MB}

\item{filter}{the choice of edge detection method (gradient/sobel/touzi)}

\item{filter.touzi.xradius}{x radius of the Touzi processing neighborhood (if filter==touzi) (default value is 1 pixel)}

\item{filter.touzi.yradius}{y radius of the Touzi processing neighborhood (if filter==touzi) (default value is 1 pixel)}

\item{channel}{sequence of bands to be processed}

\item{retRaster}{boolean if TRUE a raster stack is returned}

\item{outDir}{output Directory}

\item{verbose}{switch for system messages default is FALSE}

\item{giLinks}{list. of GI tools cli pathes}
}
\description{
Calculates edges for a given kernel size. return list of geotiffs containing thelocal statistics for each channel
}
\note{
the otb is used for filtering. please provide a GeoTiff file
}
\examples{
\dontrun{
##- required packages
require(uavRst)
require(link2GI)
setwd(tempdir())

## check if OTB exists
giLinks <- list()
giLinks$otb <- link2GI::linkOTB()

if (giLinks$otb$exist) {
data("pacman")
pacman<-raster::disaggregate(pacman,10)
raster::writeRaster(pacman,"pacman.tif",overwrite=TRUE)

##- calculate Sobel edge detection
r<-otbtex_gray(input="pacman.tif",
               filter = "erode",
               structype = "ball", 
               structype.ball.xradius = 3,
               structype.ball.yradius = 3 ,
               retRaster = TRUE)

##- visualize all layers
raster::plot(r[[1]])
}
}
}
\author{
Chris Reudenbach
}
