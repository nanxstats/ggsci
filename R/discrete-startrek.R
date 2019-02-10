#' Star Trek Color Palettes
#'
#' Color palettes inspired by the colors used in \emph{Star Trek}.
#'
#' @param palette Palette type.
#' Currently there is one available option: \code{"uniform"}
#' (7-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#'
#' @export pal_startrek
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @examples
#' library("scales")
#' show_col(pal_startrek("uniform")(7))
#' show_col(pal_startrek("uniform", alpha = 0.6)(7))
pal_startrek <- function(palette = c("uniform"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"startrek"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' Star Trek Color Scales
#'
#' See \code{\link{pal_startrek}} for details.
#'
#' @inheritParams pal_startrek
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_startrek
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @rdname scale_startrek
#'
#' @examples
#' library("ggplot2")
#' data("diamonds")
#' 
#' ggplot(
#'   subset(diamonds, carat >= 2.2),
#'   aes(x = table, y = price, colour = cut)
#' ) +
#'   geom_point(alpha = 0.7) +
#'   geom_smooth(method = "loess", alpha = 0.1, size = 1, span = 1) +
#'   theme_bw() + scale_color_startrek()
#' 
#' ggplot(
#'   subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
#'   aes(x = depth, fill = cut)
#' ) +
#'   geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
#'   theme_bw() + scale_fill_startrek()
scale_color_startrek <- function(palette = c("uniform"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("colour", "startrek", pal_startrek(palette, alpha), ...)
}

#' @export scale_colour_startrek
#' @rdname scale_startrek
scale_colour_startrek <- scale_color_startrek

#' @export scale_fill_startrek
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_startrek
scale_fill_startrek <- function(palette = c("uniform"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("fill", "startrek", pal_startrek(palette, alpha), ...)
}
