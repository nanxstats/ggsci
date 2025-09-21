#' Journal of Clinical Oncology color palettes
#'
#' Color palette inspired by plots in _Journal of Clinical Oncology_.
#'
#' @param palette Palette type.
#'   Currently there is one available option: `"default"`
#'   (10-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_jco
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @examples
#' library("scales")
#' show_col(pal_jco("default")(10))
#' show_col(pal_jco("default", alpha = 0.6)(10))
pal_jco <- function(palette = c("default"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"jco"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' Journal of Clinical Oncology color scales
#'
#' See [pal_jco()] for details.
#'
#' @inheritParams pal_jco
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_jco
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @rdname scale_jco
#'
#' @examples
#' example_scatterplot() + scale_color_jco()
#' example_barplot() + scale_fill_jco()
scale_color_jco <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_jco(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "jco", palette = pal_jco(palette, alpha), ...)
  }
}

#' @export scale_colour_jco
#' @rdname scale_jco
scale_colour_jco <- scale_color_jco

#' @export scale_fill_jco
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_jco
scale_fill_jco <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_jco(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "jco", palette = pal_jco(palette, alpha), ...)
  }
}
