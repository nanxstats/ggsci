#' Squid Game Color Palettes
#'
#' Color palettes inspired by the colors used in \emph{Squid Game}.
#'
#' @param palette Palette type.
#' Currently there is one available option: \code{"stair_room"}
#' (8-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#'
#' @export pal_squidgame
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Keith Turner <\email{khturner@@gmail.com}> |
#' <\href{https://amazon.com}{https://amazon.com}>
#'
#' @examples
#' library("scales")
#' show_col(pal_squidgame("stair_room")(8))
#' show_col(pal_squidgame("stair_room", alpha = 0.6)(8))
pal_squidgame <- function(palette = c("stair_room"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"squidgame"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' Squid Game Color Scales
#'
#' See \code{\link{pal_squidgame}} for details.
#'
#' @inheritParams pal_squidgame
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_squidgame
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Keith Turner <\email{khturner@@gmail.com}> |
#' <\href{https://amazon.com}{https://amazon.com}>
#'
#' @rdname scale_squidgame
#'
#' @examples
#' library("ggplot2")
#' data("diamonds")
#'
#' ggplot(
#'   subset(diamonds, carat >= 2.2),
#'   aes(x = table, y = price, colour = cut)
#' ) +
#'   geom_point(alpha = 0.7) +
#'   geom_smooth(method = "loess", alpha = 0.1, size = 1, span = 1) +
#'   theme_bw() + scale_color_squidgame()
#'
#' ggplot(
#'   subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
#'   aes(x = depth, fill = cut)
#' ) +
#'   geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
#'   theme_bw() + scale_fill_squidgame()
scale_color_squidgame <- function(palette = c("stair_room"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("colour", "squidgame", pal_squidgame(palette, alpha), ...)
}

#' @export scale_colour_squidgame
#' @rdname scale_squidgame
scale_colour_squidgame <- scale_color_squidgame

#' @export scale_fill_squidgame
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_squidgame
scale_fill_squidgame <- function(palette = c("stair_room"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("fill", "squidgame", pal_squidgame(palette, alpha), ...)
}
