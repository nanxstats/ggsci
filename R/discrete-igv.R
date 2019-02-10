#' Integrative Genomics Viewer (IGV) Color Palettes
#'
#' Color palettes based on the colors used by
#' Integrative Genomics Viewer (IGV).
#'
#' @param palette Palette type.
#' There are two available options:
#' \code{"default"} (51-color palette);
#' \code{"alternating"} (2-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#'
#' @export pal_igv
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @references
#' James T. Robinson, Helga Thorvaldsd\'{o}ttir, Wendy Winckler,
#' Mitchell Guttman, Eric S. Lander, Gad Getz, Jill P. Mesirov.
#' Integrative Genomics Viewer. \emph{Nature Biotechnology} 29, 24--26 (2011).
#'
#' @examples
#' library("scales")
#' show_col(pal_igv("default")(51))
#' show_col(pal_igv("alternating")(2))
pal_igv <- function(palette = c("default", "alternating"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"igv"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' Integrative Genomics Viewer (IGV) Color Scales
#'
#' See \code{\link{pal_igv}} for details.
#'
#' @inheritParams pal_igv
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_igv
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @rdname scale_igv
#'
#' @examples
#' library("ggplot2")
#' data("diamonds")
#'
#' p1 <- ggplot(
#'   subset(diamonds, carat >= 2.2),
#'   aes(x = table, y = price, colour = cut)
#' ) +
#'   geom_point(alpha = 0.7) +
#'   geom_smooth(method = "loess", alpha = 0.1, size = 1, span = 1) +
#'   theme_bw()
#'
#' p2 <- ggplot(
#'   subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
#'   aes(x = depth, fill = cut)
#' ) +
#'   geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
#'   theme_bw()
#'
#' p1 + scale_color_igv()
#' p2 + scale_fill_igv()
#'
#' p1 + scale_colour_manual(
#'   values = rep(pal_igv("alternating")(2), times = 3)
#' )
#' p2 + scale_fill_manual(
#'   values = rep(pal_igv("alternating")(2), times = 3)
#' )
scale_color_igv <- function(palette = c("default", "alternating"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("colour", "igv", pal_igv(palette, alpha), ...)
}

#' @export scale_colour_igv
#' @rdname scale_igv
scale_colour_igv <- scale_color_igv

#' @export scale_fill_igv
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_igv
scale_fill_igv <- function(palette = c("default", "alternating"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("fill", "igv", pal_igv(palette, alpha), ...)
}
