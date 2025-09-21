#' Futurama color palettes
#'
#' Color palettes inspired by the colors used in _Futurama_.
#'
#' @param palette Palette type.
#'   Currently there is one available option: `"planetexpress"`
#'   (12-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_futurama
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @examples
#' library("scales")
#' show_col(pal_futurama("planetexpress")(12))
#' show_col(pal_futurama("planetexpress", alpha = 0.6)(12))
pal_futurama <- function(palette = c("planetexpress"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"futurama"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' Futurama color scales
#'
#' See [pal_futurama()] for details.
#'
#' @inheritParams pal_futurama
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_futurama
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @rdname scale_futurama
#'
#' @examples
#' example_scatterplot() + scale_color_futurama()
#' example_barplot() + scale_fill_futurama()
scale_color_futurama <- function(palette = c("planetexpress"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_futurama(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "futurama", palette = pal_futurama(palette, alpha), ...)
  }
}

#' @export scale_colour_futurama
#' @rdname scale_futurama
scale_colour_futurama <- scale_color_futurama

#' @export scale_fill_futurama
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_futurama
scale_fill_futurama <- function(palette = c("planetexpress"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_futurama(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "futurama", palette = pal_futurama(palette, alpha), ...)
  }
}
