#' The University of Chicago Color Palettes
#'
#' Color palettes based on the colors used by the University of Chicago.
#'
#' @param palette Palette type.
#' There are 3 available options:
#' \code{"default"} (9-color palette);
#' \code{"light"} (9-color light palette);
#' \code{"dark"} (9-color dark palette).
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#'
#' @export pal_uchicago
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @references \url{https://news.uchicago.edu/sites/default/files/attachments/_uchicago.identity.guidelines.pdf}
#'
#' @examples
#' library("scales")
#' show_col(pal_uchicago("default")(9))
#' show_col(pal_uchicago("light")(9))
#' show_col(pal_uchicago("dark")(9))
pal_uchicago <- function(palette = c("default", "light", "dark"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"uchicago"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' The University of Chicago Color Scales
#'
#' See \code{\link{pal_uchicago}} for details.
#'
#' @inheritParams pal_uchicago
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_uchicago
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @references \url{https://news.uchicago.edu/sites/default/files/attachments/_uchicago.identity.guidelines.pdf}
#'
#' @rdname scale_uchicago
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
#' p1 + scale_color_uchicago()
#' p2 + scale_fill_uchicago()
#'
#' p1 + scale_color_uchicago(palette = "light")
#' p2 + scale_fill_uchicago(palette = "light")
#'
#' p1 + scale_color_uchicago(palette = "dark")
#' p2 + scale_fill_uchicago(palette = "dark")
scale_color_uchicago <- function(palette = c("default", "light", "dark"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("colour", "uchicago", pal_uchicago(palette, alpha), ...)
}

#' @export scale_colour_uchicago
#' @rdname scale_uchicago
scale_colour_uchicago <- scale_color_uchicago

#' @export scale_fill_uchicago
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_uchicago
scale_fill_uchicago <- function(palette = c("default", "light", "dark"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("fill", "uchicago", pal_uchicago(palette, alpha), ...)
}
