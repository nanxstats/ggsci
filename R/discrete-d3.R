#' D3.js Color Palettes
#'
#' Color palettes based on the colors used by D3.js.
#'
#' @param palette Palette type.
#' There are 4 available options:
#' \code{"category10"} (10-color palette);
#' \code{"category20"} (20-color palette);
#' \code{"category20b"} (20-color palette);
#' \code{"category20c"} (20-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#'
#' @export pal_d3
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @references \url{https://github.com/d3/d3-3.x-api-reference/blob/master/Ordinal-Scales.md}
#'
#' @examples
#' library("scales")
#' show_col(pal_d3("category10")(10))
#' show_col(pal_d3("category20")(20))
#' show_col(pal_d3("category20b")(20))
#' show_col(pal_d3("category20c")(20))
pal_d3 <- function(palette = c("category10", "category20", "category20b", "category20c"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"d3"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' D3.js Color Scales
#'
#' See \code{\link{pal_d3}} for details.
#'
#' @inheritParams pal_d3
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_d3
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @references \url{https://github.com/d3/d3-3.x-api-reference/blob/master/Ordinal-Scales.md}
#'
#' @rdname scale_d3
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
#' p1 + scale_color_d3()
#' p2 + scale_fill_d3()
#'
#' p1 + scale_color_d3(palette = "category20")
#' p2 + scale_fill_d3(palette = "category20")
#'
#' p1 + scale_color_d3(palette = "category20b")
#' p2 + scale_fill_d3(palette = "category20b")
#'
#' p1 + scale_color_d3(palette = "category20c")
#' p2 + scale_fill_d3(palette = "category20c")
scale_color_d3 <- function(palette = c("category10", "category20", "category20b", "category20c"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("colour", "d3", pal_d3(palette, alpha), ...)
}

#' @export scale_colour_d3
#' @rdname scale_d3
scale_colour_d3 <- scale_color_d3

#' @export scale_fill_d3
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_d3
scale_fill_d3 <- function(palette = c("category10", "category20", "category20b", "category20c"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("fill", "d3", pal_d3(palette, alpha), ...)
}
