#' BMJ color palettes
#'
#' Color palette from the BMJ living style guide.
#'
#' @param palette Palette type.
#'   Currently there is one available option: `"default"`
#'   (9-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_bmj
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Hui Chen | \email{huichen@zju.edu.cn}
#'
#' @references
#' <https://technology.bmj.com/living-style-guide/colour.html>
#'
#' @examples
#' library("scales")
#' show_col(pal_bmj("default")(9))
#' show_col(pal_bmj("default", alpha = 0.6)(9))
pal_bmj <- function(palette = c("default"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"bmj"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' BMJ color scales
#'
#' See [pal_bmj()] for details.
#'
#' @inheritParams pal_bmj
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_bmj
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Hui Chen | \email{huichen@zju.edu.cn}
#'
#' @rdname scale_bmj
#'
#' @references
#' <https://technology.bmj.com/living-style-guide/colour.html>
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
#'   theme_bw() +
#'   scale_color_bmj()
#'
#' ggplot(
#'   subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
#'   aes(x = depth, fill = cut)
#' ) +
#'   geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
#'   theme_bw() +
#'   scale_fill_bmj()
scale_color_bmj <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_bmj(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "bmj", palette = pal_bmj(palette, alpha), ...)
  }
}

#' @export scale_colour_bmj
#' @rdname scale_bmj
scale_colour_bmj <- scale_color_bmj

#' @export scale_fill_bmj
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_bmj
scale_fill_bmj <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_bmj(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "bmj", palette = pal_bmj(palette, alpha), ...)
  }
}
