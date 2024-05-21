#' Tron Legacy color palettes
#'
#' Color palettes inspired by the colors used in _Tron Legacy_.
#'
#' @param palette Palette type.
#'   Currently there is one available option: `"legacy"`
#'   (7-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_tron
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @examples
#' library("scales")
#' show_col(pal_tron("legacy")(7))
#' show_col(pal_tron("legacy", alpha = 0.6)(7))
pal_tron <- function(palette = c("legacy"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"tron"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' Tron Legacy color scales
#'
#' See [pal_tron()] for details.
#'
#' @inheritParams pal_tron
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_tron
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @rdname scale_tron
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
#'   theme_dark() +
#'   theme(
#'     panel.background = element_rect(fill = "#2D2D2D"),
#'     legend.key = element_rect(fill = "#2D2D2D")
#'   ) +
#'   scale_color_tron()
#'
#' ggplot(
#'   subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
#'   aes(x = depth, fill = cut)
#' ) +
#'   geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
#'   theme_dark() +
#'   theme(
#'     panel.background = element_rect(fill = "#2D2D2D")
#'   ) +
#'   scale_fill_tron()
scale_color_tron <- function(palette = c("legacy"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_tron(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "tron", palette = pal_tron(palette, alpha), ...)
  }
}

#' @export scale_colour_tron
#' @rdname scale_tron
scale_colour_tron <- scale_color_tron

#' @export scale_fill_tron
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_tron
scale_fill_tron <- function(palette = c("legacy"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_tron(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "tron", palette = pal_tron(palette, alpha), ...)
  }
}
