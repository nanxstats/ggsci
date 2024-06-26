% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/discrete-nejm.R
\name{scale_color_nejm}
\alias{scale_color_nejm}
\alias{scale_colour_nejm}
\alias{scale_fill_nejm}
\title{NEJM color scales}
\usage{
scale_color_nejm(palette = c("default"), alpha = 1, ...)

scale_colour_nejm(palette = c("default"), alpha = 1, ...)

scale_fill_nejm(palette = c("default"), alpha = 1, ...)
}
\arguments{
\item{palette}{Palette type.
Currently there is one available option: \code{"default"}
(8-color palette).}

\item{alpha}{Transparency level, a real number in (0, 1].
See \code{alpha} in \code{\link[grDevices:rgb]{grDevices::rgb()}} for details.}

\item{...}{Additional parameters for \code{\link[ggplot2:discrete_scale]{ggplot2::discrete_scale()}}.}
}
\description{
See \code{\link[=pal_nejm]{pal_nejm()}} for details.
}
\examples{
library("ggplot2")
data("diamonds")

ggplot(
  subset(diamonds, carat >= 2.2),
  aes(x = table, y = price, colour = cut)
) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "loess", alpha = 0.1, size = 1, span = 1) +
  theme_bw() +
  scale_color_nejm()

ggplot(
  subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
  aes(x = depth, fill = cut)
) +
  geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
  theme_bw() +
  scale_fill_nejm()
}
\author{
Nan Xiao | \email{me@nanx.me} | \url{https://nanx.me}
}
