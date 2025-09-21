#' NPG journal color palettes
#'
#' Color palettes inspired by plots in journals published by
#' Nature Publishing Group, such as _Nature Reviews Cancer_.
#'
#' @param palette Palette type.
#'   Currently there is one available option: `"nrc"`
#'   (10-color palette inspired by _Nature Reviews Cancer_).
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_npg
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @examples
#' library("scales")
#' show_col(pal_npg("nrc")(10))
#' show_col(pal_npg("nrc", alpha = 0.6)(10))
pal_npg <- function(palette = c("nrc"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"npg"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' NPG journal color scales
#'
#' See [pal_npg()] for details.
#'
#' @inheritParams pal_npg
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_npg
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @rdname scale_npg
#'
#' @examples
#' example_scatterplot() + scale_color_npg()
#' example_barplot() + scale_fill_npg()
scale_color_npg <- function(palette = c("nrc"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_npg(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "npg", palette = pal_npg(palette, alpha), ...)
  }
}

#' @export scale_colour_npg
#' @rdname scale_npg
scale_colour_npg <- scale_color_npg

#' @export scale_fill_npg
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_npg
scale_fill_npg <- function(palette = c("nrc"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_npg(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "npg", palette = pal_npg(palette, alpha), ...)
  }
}
