#' Flat UI Color Palettes
#'
#' Color palettes inspired by the colors used in \emph{Flat UI Colors}.
#'
#' @param palette Palette type.
#' Currently there are three available option:
#' \code{"default"} (10-color palette).
#' \code{"flattastic"} (12-color palette).
#' \code{"aussie"} (10-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#'
#' @export pal_flatui
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Clara Jégousse <\email{cat3@@hi.is}>
#'
#' @examples
#' library("scales")
#' show_col(pal_flatui("default")(10))
#' show_col(pal_flatui("flattastic")(12))
#' show_col(pal_flatui("aussie")(10))
#' show_col(pal_flatui("aussie", alpha = 0.6)(10))
pal_flatui <- function(palette = c("default", "flattastic", "aussie"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"flatui"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' Flat UI Color Scales
#'
#' See \code{\link{pal_flatui}} for details.
#'
#' @inheritParams pal_flatui
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_flatui
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Clara Jégousse <\email{cat3@@hi.is}>
#'
#' @rdname scale_flatui
#'
#' @examples
#' library("ggplot2")
#' data("diamonds")
#'
#' p1 <- ggplot(
#'   subset(diamonds, carat >= 2.2),
#'   aes(x = table, y = price, colour = cut)
#' ) +
#'   geom_point(alpha = 0.7) +
#'   geom_smooth(method = "loess", alpha = 0.1, size = 1, span = 1) +
#'   theme_bw()
#'
#' p2 <- ggplot(
#'   subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
#'   aes(x = depth, fill = cut)
#' ) +
#'   geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
#'   theme_bw()
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
  discrete_scale("colour", "flatui", pal_flatui(palette, alpha), ...)
}

#' @export scale_colour_flatui
#' @rdname scale_flatui
scale_colour_flatui <- scale_color_flatui

#' @export scale_fill_flatui
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_flatui
scale_fill_flatui <- function(palette = c("default", "flattastic", "aussie"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("fill", "flatui", pal_flatui(palette, alpha), ...)
}
