#' LocusZoom Color Palette
#'
#' Color palettes based on the colors used by LocusZoom.
#'
#' @param palette Palette type.
#' Currently there is one available option: \code{"default"}
#' (7-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#'
#' @export pal_locuszoom
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @references
#' Pruim, Randall J., et al. (2010). LocusZoom: regional visualization of
#' genome-wide association scan results. \emph{Bioinformatics},
#' 26(18), 2336--2337.
#'
#' @examples
#' library("scales")
#' show_col(pal_locuszoom("default")(7))
#' show_col(pal_locuszoom("default", alpha = 0.6)(7))
pal_locuszoom <- function(palette = c("default"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"locuszoom"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' LocusZoom Color Scales
#'
#' See \code{\link{pal_locuszoom}} for details.
#'
#' @inheritParams pal_locuszoom
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_locuszoom
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @rdname scale_locuszoom
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
#'   theme_bw() + scale_color_locuszoom()
#' 
#' ggplot(
#'   subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
#'   aes(x = depth, fill = cut)
#' ) +
#'   geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
#'   theme_bw() + scale_fill_locuszoom()
scale_color_locuszoom <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("colour", "locuszoom", pal_locuszoom(palette, alpha), ...)
}

#' @export scale_colour_locuszoom
#' @rdname scale_locuszoom
scale_colour_locuszoom <- scale_color_locuszoom

#' @export scale_fill_locuszoom
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_locuszoom
scale_fill_locuszoom <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("fill", "locuszoom", pal_locuszoom(palette, alpha), ...)
}
