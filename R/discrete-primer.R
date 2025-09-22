#' Primer design system palette
#'
#' The Primer design system data visualization palette.
#'
#' @param palette Palette type.
#'   Currently there is one available option: `"mark17"`
#'   (17-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_primer
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @references
#' GitHub (2025). "Primer data visualization colors."
#' <https://primer.style/product/ui-patterns/data-visualization/>
#'
#' @examples
#' library("scales")
#' show_col(pal_primer("mark17")(17))
#' show_col(pal_primer("mark17", alpha = 0.6)(17))
pal_primer <- function(palette = c("mark17"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"primer"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' Primer color scales
#'
#' See [pal_primer()] for details.
#'
#' @inheritParams pal_primer
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_primer
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @references
#' GitHub (2025). "Primer data visualization colors."
#' <https://primer.style/product/ui-patterns/data-visualization/>
#'
#' @rdname scale_primer
#'
#' @examples
#' example_scatterplot() + scale_color_primer()
#' example_barplot() + scale_fill_primer()
scale_color_primer <- function(palette = c("mark17"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_primer(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "primer", palette = pal_primer(palette, alpha), ...)
  }
}

#' @export scale_colour_primer
#' @rdname scale_primer
scale_colour_primer <- scale_color_primer

#' @export scale_fill_primer
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_primer
scale_fill_primer <- function(palette = c("mark17"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_primer(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "primer", palette = pal_primer(palette, alpha), ...)
  }
}
