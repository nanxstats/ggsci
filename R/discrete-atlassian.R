#' Atlassian Design System palette
#'
#' The Atlassian Design System categorical data visualization palette.
#'
#' @param palette Palette type.
#'   Currently there is one available option: `"categorical8"`
#'   (8-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_atlassian
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @references
#' Atlassian (2025). "Atlassian Design System categorical chart colors."
#' <https://atlassian.design/foundations/color-new/data-visualization-color>
#'
#' @examples
#' library("scales")
#' show_col(pal_atlassian("categorical8")(8))
#' show_col(pal_atlassian("categorical8", alpha = 0.6)(8))
pal_atlassian <- function(palette = c("categorical8"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"atlassian"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' Atlassian Design System color scales
#'
#' See [pal_atlassian()] for details.
#'
#' @inheritParams pal_atlassian
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_atlassian
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @references
#' Atlassian (2025). "Atlassian Design System categorical chart colors."
#' <https://atlassian.design/foundations/color-new/data-visualization-color>
#'
#' @rdname scale_atlassian
#'
#' @examples
#' example_scatterplot() + scale_color_atlassian()
#' example_barplot() + scale_fill_atlassian()
scale_color_atlassian <- function(palette = c("categorical8"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_atlassian(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "atlassian", palette = pal_atlassian(palette, alpha), ...)
  }
}

#' @export scale_colour_atlassian
#' @rdname scale_atlassian
scale_colour_atlassian <- scale_color_atlassian

#' @export scale_fill_atlassian
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_atlassian
scale_fill_atlassian <- function(palette = c("categorical8"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_atlassian(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "atlassian", palette = pal_atlassian(palette, alpha), ...)
  }
}
