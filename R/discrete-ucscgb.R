#' UCSC Genome Browser color palette
#'
#' Color palette from UCSC Genome Browser chromosome colors.
#'
#' @param palette Palette type.
#'   Currently there is one available option: `"default"`
#'   (26-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_ucscgb
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @examples
#' library("scales")
#' show_col(pal_ucscgb("default")(26))
#' show_col(pal_ucscgb("default", alpha = 0.6)(26))
pal_ucscgb <- function(palette = c("default"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"ucscgb"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' UCSC Genome Browser color scales
#'
#' See [pal_ucscgb()] for details.
#'
#' @inheritParams pal_ucscgb
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_ucscgb
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @rdname scale_ucscgb
#'
#' @examples
#' example_scatterplot() + scale_color_ucscgb()
#' example_barplot() + scale_fill_ucscgb()
scale_color_ucscgb <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_ucscgb(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "ucscgb", palette = pal_ucscgb(palette, alpha), ...)
  }
}

#' @export scale_colour_ucscgb
#' @rdname scale_ucscgb
scale_colour_ucscgb <- scale_color_ucscgb

#' @export scale_fill_ucscgb
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_ucscgb
scale_fill_ucscgb <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_ucscgb(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "ucscgb", palette = pal_ucscgb(palette, alpha), ...)
  }
}
