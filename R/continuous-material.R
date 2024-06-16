#' Material Design color palettes
#'
#' Material Design 2 color palettes.
#'
#' @param palette Palette type. There are 19 available options:
#'   - `"red"`
#'   - `"pink"`
#'   - `"purple"`
#'   - `"deep-purple"`
#'   - `"indigo"`
#'   - `"blue"`
#'   - `"light-blue"`
#'   - `"cyan"`
#'   - `"teal"`
#'   - `"green"`
#'   - `"light-green"`
#'   - `"lime"`
#'   - `"yellow"`
#'   - `"amber"`
#'   - `"orange"`
#'   - `"deep-orange"`
#'   - `"brown"`
#'   - `"grey"`
#'   - `"blue-grey"`
#' @param n Number of individual colors to be generated.
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#' @param reverse Logical. Should the order of the colors be reversed?
#'
#' @export rgb_material
#'
#' @importFrom grDevices colorRamp rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @references
#' <https://m2.material.io/design/color/the-color-system.html>
#'
#' @examples
#' library("scales")
#' show_col(pal_material("indigo")(10))
#' show_col(pal_material("indigo", n = 30, alpha = 0.6, reverse = TRUE)(30))
rgb_material <- function(
    palette = c(
      "red", "pink", "purple", "deep-purple", "indigo", "blue",
      "light-blue", "cyan", "teal", "green", "light-green", "lime",
      "yellow", "amber", "orange", "deep-orange", "brown", "grey", "blue-grey"
    ), n = 10, alpha = 1, reverse = FALSE) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"material"[[palette]]
  func_cols <- colorRamp(raw_cols, space = "Lab", interpolate = "spline")
  mat_cols <- func_cols(seq(0L, 1L, length.out = n))
  alpha_cols <- rgb(
    mat_cols[, 1L], mat_cols[, 2L], mat_cols[, 3L],
    alpha = alpha * 255L, maxColorValue = 255L
  )

  if (reverse) alpha_cols <- rev(alpha_cols)

  alpha_cols
}

#' Material Design color palettes
#'
#' Material Design 2 color palettes.
#'
#' @inheritParams rgb_material
#'
#' @export pal_material
#'
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @examples
#' library("scales")
#' show_col(pal_material("indigo")(10))
#' show_col(pal_material("indigo", n = 30, alpha = 0.6, reverse = TRUE)(30))
pal_material <- function(
    palette = c(
      "red", "pink", "purple", "deep-purple", "indigo", "blue",
      "light-blue", "cyan", "teal", "green", "light-green", "lime",
      "yellow", "amber", "orange", "deep-orange", "brown", "grey", "blue-grey"
    ), n = 10, alpha = 1, reverse = FALSE) {
  palette <- match.arg(palette)

  alpha_cols <- rgb_material(palette, n, alpha, reverse)
  manual_pal(unname(alpha_cols))
}

#' Material Design color scales
#'
#' See [pal_material()] for details.
#'
#' @inheritParams pal_material
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_material
#'
#' @importFrom ggplot2 scale_color_gradientn
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @rdname scale_material
#'
#' @examples
#' library("ggplot2")
#'
#' data("mtcars")
#' cor <- abs(cor(mtcars))
#' cor_melt <- data.frame(
#'   Var1 = rep(seq_len(nrow(cor)), times = ncol(cor)),
#'   Var2 = rep(seq_len(ncol(cor)), each = nrow(cor)),
#'   value = as.vector(cor)
#' )
#'
#' ggplot(
#'   cor_melt,
#'   aes(x = Var1, y = Var2, fill = value)
#' ) +
#'   geom_tile(colour = "black", size = 0.3) +
#'   theme_bw() +
#'   scale_fill_material("blue-grey")
scale_color_material <- function(
    palette = c(
      "red", "pink", "purple", "deep-purple", "indigo", "blue",
      "light-blue", "cyan", "teal", "green", "light-green", "lime",
      "yellow", "amber", "orange", "deep-orange", "brown", "grey", "blue-grey"
    ), alpha = 1, reverse = FALSE, ...) {
  palette <- match.arg(palette)
  scale_color_gradientn(
    colours = rgb_material(
      palette,
      n = 512, alpha = alpha, reverse = reverse
    ),
    ...
  )
}

#' @export scale_colour_material
#' @rdname scale_material
scale_colour_material <- scale_color_material

#' @export scale_fill_material
#' @importFrom ggplot2 scale_fill_gradientn
#' @rdname scale_material
scale_fill_material <- function(
    palette = c(
      "red", "pink", "purple", "deep-purple", "indigo", "blue",
      "light-blue", "cyan", "teal", "green", "light-green", "lime",
      "yellow", "amber", "orange", "deep-orange", "brown", "grey", "blue-grey"
    ), alpha = 1, reverse = FALSE, ...) {
  palette <- match.arg(palette)
  scale_fill_gradientn(
    colours = rgb_material(
      palette,
      n = 512, alpha = alpha, reverse = reverse
    ),
    ...
  )
}
