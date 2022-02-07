#' Frontiers Color Palettes
#'
#' Color palettes inspired by the colors used in \emph{Frontiers}.
#'
#' @param palette Palette type.
#' Currently there is one available option: \code{"default"}
#' (10-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#'
#' @export pal_frontiers
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Clara Jégousse <\email{cat3@@hi.is}>
#'
#' @examples
#' library("scales")
#' show_col(pal_frontiers("default")(7))
#' show_col(pal_frontiers("default", alpha = 0.6)(7))
pal_frontiers <- function(palette = c("default"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"frontiers"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' Frontiers Color Scales
#'
#' See \code{\link{pal_frontiers}} for details.
#'
#' @inheritParams pal_frontiers
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_frontiers
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Clara Jégousse <\email{cat3@@hi.is}>
#'
#' @rdname scale_frontiers
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
#'   theme_dark() + theme(
#'     panel.background = element_rect(fill = "#2D2D2D"),
#'     legend.key = element_rect(fill = "#2D2D2D")
#'   ) +
#'   scale_color_frontiers()
#'
#' ggplot(
#'   subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
#'   aes(x = depth, fill = cut)
#' ) +
#'   geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
#'   theme_dark() + theme(
#'     panel.background = element_rect(fill = "#2D2D2D")
#'   ) +
#'   scale_fill_frontiers()
scale_color_frontiers <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("colour", "frontiers", pal_frontiers(palette, alpha), ...)
}

#' @export scale_colour_frontiers
#' @rdname scale_frontiers
scale_colour_frontiers <- scale_color_frontiers

#' @export scale_fill_frontiers
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_frontiers
scale_fill_frontiers <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("fill", "frontiers", pal_frontiers(palette, alpha), ...)
}
