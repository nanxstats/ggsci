#' Flat UI color palettes
#'
#' Color palettes inspired by the Flat UI colors.
#'
#' @param palette Palette type. Currently there are three available options:
#'   - `"default"` (10-color palette).
#'   - `"flattastic"` (12-color palette).
#'   - `"aussie"` (10-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_flatui
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Clara Jégousse | \email{cat3@hi.is}
#'
#' @examples
#' library("scales")
#' show_col(pal_flatui("default")(10))
#' show_col(pal_flatui("flattastic")(12))
#' show_col(pal_flatui("aussie")(10))
#' show_col(pal_flatui("aussie", alpha = 0.6)(10))
pal_flatui <- function(palette = c("default", "flattastic", "aussie"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"flatui"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' Flat UI color scales
#'
#' See [pal_flatui()] for details.
#'
#' @inheritParams pal_flatui
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_flatui
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Clara Jégousse | \email{cat3@hi.is}
#'
#' @rdname scale_flatui
#'
#' @examples
#' p1 <- example_scatterplot()
#' p2 <- example_barplot()
#'
#' p1 + scale_color_flatui()
#' p2 + scale_fill_flatui()
#'
#' p1 + scale_color_flatui(palette = "default")
#' p2 + scale_fill_flatui(palette = "default")
#'
#' p1 + scale_color_flatui(palette = "flattastic")
#' p2 + scale_fill_flatui(palette = "flattastic")
#'
#' p1 + scale_color_flatui(palette = "aussie")
#' p2 + scale_fill_flatui(palette = "aussie")
scale_color_flatui <- function(palette = c("default", "flattastic", "aussie"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_flatui(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "flatui", palette = pal_flatui(palette, alpha), ...)
  }
}

#' @export scale_colour_flatui
#' @rdname scale_flatui
scale_colour_flatui <- scale_color_flatui

#' @export scale_fill_flatui
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_flatui
scale_fill_flatui <- function(palette = c("default", "flattastic", "aussie"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_flatui(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "flatui", palette = pal_flatui(palette, alpha), ...)
  }
}
