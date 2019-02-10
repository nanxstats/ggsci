#' Lancet Journal Color Palettes
#'
#' Color palettes inspired by plots in Lancet journals,
#' such as \emph{Lancet Oncology}.
#'
#' @param palette Palette type.
#' Currently there is one available option: \code{"lanonc"}
#' (9-color palette inspired by \emph{Lancet Oncology}).
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#'
#' @export pal_lancet
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @examples
#' library("scales")
#' show_col(pal_lancet("lanonc")(9))
#' show_col(pal_lancet("lanonc", alpha = 0.6)(9))
pal_lancet <- function(palette = c("lanonc"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"lancet"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' Lancet Journal Color Scales
#'
#' See \code{\link{pal_lancet}} for details.
#'
#' @inheritParams pal_lancet
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_lancet
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @rdname scale_lancet
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
#'   theme_bw() + scale_color_lancet()
#' 
#' ggplot(
#'   subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
#'   aes(x = depth, fill = cut)
#' ) +
#'   geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
#'   theme_bw() + scale_fill_lancet()
scale_color_lancet <- function(palette = c("lanonc"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("colour", "lancet", pal_lancet(palette, alpha), ...)
}

#' @export scale_colour_lancet
#' @rdname scale_lancet
scale_colour_lancet <- scale_color_lancet

#' @export scale_fill_lancet
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_lancet
scale_fill_lancet <- function(palette = c("lanonc"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("fill", "lancet", pal_lancet(palette, alpha), ...)
}
