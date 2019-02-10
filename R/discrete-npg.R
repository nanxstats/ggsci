#' NPG Journal Color Palettes
#'
#' Color palettes inspired by plots in journals published by
#' Nature Publishing Group, such as \emph{Nature Reviews Cancer}.
#'
#' @param palette Palette type.
#' Currently there is one available option: \code{"nrc"}
#' (10-color palette inspired by \emph{Nature Reviews Cancer}).
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#'
#' @export pal_npg
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @examples
#' library("scales")
#' show_col(pal_npg("nrc")(10))
#' show_col(pal_npg("nrc", alpha = 0.6)(10))
pal_npg <- function(palette = c("nrc"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"npg"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' NPG Journal Color Scales
#'
#' See \code{\link{pal_npg}} for details.
#'
#' @inheritParams pal_npg
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_npg
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @rdname scale_npg
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
#'   theme_bw() + scale_color_npg()
#' 
#' ggplot(
#'   subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
#'   aes(x = depth, fill = cut)
#' ) +
#'   geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
#'   theme_bw() + scale_fill_npg()
scale_color_npg <- function(palette = c("nrc"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("colour", "npg", pal_npg(palette, alpha), ...)
}

#' @export scale_colour_npg
#' @rdname scale_npg
scale_colour_npg <- scale_color_npg

#' @export scale_fill_npg
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_npg
scale_fill_npg <- function(palette = c("nrc"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("fill", "npg", pal_npg(palette, alpha), ...)
}
