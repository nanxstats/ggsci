#' NEJM color palettes
#'
#' Color palette inspired by plots in
#' _The New England Journal of Medicine_.
#'
#' @param palette Palette type.
#'   Currently there is one available option: `"default"`
#'   (8-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_nejm
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @examples
#' library("scales")
#' show_col(pal_nejm("default")(8))
#' show_col(pal_nejm("default", alpha = 0.6)(8))
pal_nejm <- function(palette = c("default"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"nejm"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' NEJM color scales
#'
#' See [pal_nejm()] for details.
#'
#' @inheritParams pal_nejm
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_nejm
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @rdname scale_nejm
#'
#' @examples
#' example_scatterplot() + scale_color_nejm()
#' example_barplot() + scale_fill_nejm()
scale_color_nejm <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_nejm(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "nejm", palette = pal_nejm(palette, alpha), ...)
  }
}

#' @export scale_colour_nejm
#' @rdname scale_nejm
scale_colour_nejm <- scale_color_nejm

#' @export scale_fill_nejm
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_nejm
scale_fill_nejm <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_nejm(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "nejm", palette = pal_nejm(palette, alpha), ...)
  }
}
