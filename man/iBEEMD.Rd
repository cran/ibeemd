\name{iBEEMD}
\alias{iBEEMD}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Scale decomposition for polygon data.
}
\description{
Similar to 2-dimensional wavelet decomposition, for a given irrelular-lattice 
field represented by spatial polygons dataframe, the method decompose the field 
into different scales and a global trend component by EEMD method. The scale 
components are also called also called intrinsic mode functions (IMFs), which
represent different scale information in the spatial field.
}
\usage{
iBEEMD(spPolysDf, valueField = names(spPolysDf)[1], nMaxIMF = 10, tolSift = 0.05, 
neemd = 1000, wnsd = 0.05, fmodel = "thinplate", fig = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{spPolysDf}{
a SpatialPolygonsDataFrame object.
}
  \item{valueField}{
a field name that stores value.
}
  \item{nMaxIMF}{
maximum number of components to be decomposed.
}
  \item{tolSift}{
sift tolerence, a small number.
}
  \item{neemd}{
number of EEMD iterations, a large number can make a stable result.
}
  \item{wnsd}{
standard deviation of added noise; it is a ratio to the standard deviation of above data.
}
  \item{fmodel}{
surface fitting function ("thinplate", "gaussian", "cubic", "multiquadric").
}
  \item{fig}{
whether plot decomposed results.
}
}
\value{
A SpatialPolygonsDataFrame with original value, decomposed imfs and global trend.
}
\references{
Hu, M.-G. and J.-F. Wang, et al. A hierarchical-scale decomposition method for irregular lattice field. Computers & Geosciences, submitted.

Huang, N. E. and Z. Shen, et al. The empirical mode decomposition and the Hilbert spectrum for nonlinear and non-stationary time series analysis. Proceedings of The Royal Society A - Mathematical, Physical & Engineering Sciences, 1998, 454(1971): 903-995.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
\dontrun{
library(rgdal)

# polygon data
mydata <- system.file("extdata/simu.shp", package = "ibeemd")

layer <- basename(mydata)
layer <- substr(layer, 1, nchar(layer)-4)
mydataDf <- readOGR(dsn=mydata, layer=layer)
#spplot(mydataDf)

rslt <- iBEEMD(
		spPolysDf = mydataDf, 
		valueField = "value",  
		nMaxIMF = 10, 
		tolSift = 0.05,
		neemd = 500,
		wnsd = 0.05,
		fmodel = "thinplate",
		fig = TRUE)
}
#spplot(rslt)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
