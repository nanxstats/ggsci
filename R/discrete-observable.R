#' Observable 10 color palette
#'
#' The Observable 10 palette.
#'
#' @param palette Palette type.
#'   Currently there is one available option: `"observable10"`
#'   (10-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_observable
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @references
#' Pettiross J (2023). "Crafting data colors and staying on brand."
#' _Observable blog_. <https://observablehq.com/blog/crafting-data-colors>
#'
#' @examples
#' library("scales")
#' show_col(pal_observable("observable10")(10))
#' show_col(pal_observable("observable10", alpha = 0.6)(10))
pal_observable <- function(palette = c("observable10"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"observable"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' Observable 10 color scales
#'
#' See [pal_observable()] for details.
#'
#' @inheritParams pal_observable
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_observable
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @references
#' Pettiross J (2023). "Crafting data colors and staying on brand."
#' _Observable blog_. <https://observablehq.com/blog/crafting-data-colors>
#'
#' @rdname scale_observable
#'
#' @examples
#' example_scatterplot() + scale_color_observable()
#' example_barplot() + scale_fill_observable()
scale_color_observable <- function(palette = c("observable10"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_observable(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "observable", palette = pal_observable(palette, alpha), ...)
  }
}

#' @export scale_colour_observable
#' @rdname scale_observable
scale_colour_observable <- scale_color_observable

#' @export scale_fill_observable
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_observable
scale_fill_observable <- function(palette = c("observable10"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_observable(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "observable", palette = pal_observable(palette, alpha), ...)
  }
}
