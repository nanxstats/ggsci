#' Rick and Morty color palettes
#'
#' Color palettes inspired by the colors used in _Rick and Morty_.
#'
#' @param palette Palette type.
#'   Currently there is one available option: `"schwifty"`
#'   (12-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_rickandmorty
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @examples
#' library("scales")
#' show_col(pal_rickandmorty("schwifty")(12))
#' show_col(pal_rickandmorty("schwifty", alpha = 0.6)(12))
pal_rickandmorty <- function(palette = c("schwifty"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"rickandmorty"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' Rick and Morty color scales
#'
#' See [pal_rickandmorty()] for details.
#'
#' @inheritParams pal_rickandmorty
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_rickandmorty
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @rdname scale_rickandmorty
#'
#' @examples
#' example_scatterplot() + scale_color_rickandmorty()
#' example_barplot() + scale_fill_rickandmorty()
scale_color_rickandmorty <- function(palette = c("schwifty"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_rickandmorty(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "rickandmorty", palette = pal_rickandmorty(palette, alpha), ...)
  }
}

#' @export scale_colour_rickandmorty
#' @rdname scale_rickandmorty
scale_colour_rickandmorty <- scale_color_rickandmorty

#' @export scale_fill_rickandmorty
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_rickandmorty
scale_fill_rickandmorty <- function(palette = c("schwifty"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_rickandmorty(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "rickandmorty", palette = pal_rickandmorty(palette, alpha), ...)
  }
}
