#' AAAS journal color palettes
#'
#' Color palettes inspired by plots in journals published by
#' American Association for the Advancement of Science (AAAS),
#' such as _Science_ and _Science Translational Medicine_.
#'
#' @param palette Palette type.
#'   Currently there is one available option: `"default"`
#'   (10-color palette inspired by _Science_).
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_aaas
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @examples
#' library("scales")
#' show_col(pal_aaas("default")(10))
#' show_col(pal_aaas("default", alpha = 0.6)(10))
pal_aaas <- function(palette = c("default"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"aaas"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' AAAS journal color scales
#'
#' See [pal_aaas()] for details.
#'
#' @inheritParams pal_aaas
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_aaas
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @rdname scale_aaas
#'
#' @examples
#' example_scatterplot() + scale_color_aaas()
#' example_barplot() + scale_fill_aaas()
scale_color_aaas <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_aaas(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "aaas", palette = pal_aaas(palette, alpha), ...)
  }
}

#' @export scale_colour_aaas
#' @rdname scale_aaas
scale_colour_aaas <- scale_color_aaas

#' @export scale_fill_aaas
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_aaas
scale_fill_aaas <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_aaas(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "aaas", palette = pal_aaas(palette, alpha), ...)
  }
}
