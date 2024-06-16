#' Bootstrap 5 color palettes
#'
#' Bootstrap 5 color palettes.
#'
#' @param palette Palette type. There are 11 available options:
#'   - `"blue"`
#'   - `"indigo"`
#'   - `"purple"`
#'   - `"pink"`
#'   - `"red"`
#'   - `"orange"`
#'   - `"yellow"`
#'   - `"green"`
#'   - `"teal"`
#'   - `"cyan"`
#'   - `"gray"`
#' @param n Number of individual colors to be generated.
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#' @param reverse Logical. Should the order of the colors be reversed?
#'
#' @export rgb_bs5
#'
#' @importFrom grDevices colorRamp rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @references
#' <https://getbootstrap.com/docs/5.3/customize/color/#all-colors>
#'
#' @examples
#' library("scales")
#' show_col(pal_bs5("indigo")(10))
#' show_col(pal_bs5("indigo", n = 30, alpha = 0.6, reverse = TRUE)(30))
rgb_bs5 <- function(
    palette = c(
      "blue", "indigo", "purple", "pink", "red", "orange", "yellow",
      "green", "teal", "cyan", "gray"
    ), n = 10, alpha = 1, reverse = FALSE) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"bs5"[[palette]]
  func_cols <- colorRamp(raw_cols, space = "Lab", interpolate = "spline")
  mat_cols <- func_cols(seq(0L, 1L, length.out = n))
  alpha_cols <- rgb(
    mat_cols[, 1L], mat_cols[, 2L], mat_cols[, 3L],
    alpha = alpha * 255L, maxColorValue = 255L
  )

  if (reverse) alpha_cols <- rev(alpha_cols)

  alpha_cols
}

#' Bootstrap 5 color palettes
#'
#' Bootstrap 5 color palettes.
#'
#' @inheritParams rgb_bs5
#'
#' @export pal_bs5
#'
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @examples
#' library("scales")
#' show_col(pal_bs5("indigo")(10))
#' show_col(pal_bs5("indigo", n = 30, alpha = 0.6, reverse = TRUE)(30))
pal_bs5 <- function(
    palette = c(
      "blue", "indigo", "purple", "pink", "red", "orange", "yellow",
      "green", "teal", "cyan", "gray"
    ), n = 10, alpha = 1, reverse = FALSE) {
  palette <- match.arg(palette)

  alpha_cols <- rgb_bs5(palette, n, alpha, reverse)
  manual_pal(unname(alpha_cols))
}

#' Bootstrap 5 color scales
#'
#' See [pal_bs5()] for details.
#'
#' @inheritParams pal_bs5
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_bs5
#'
#' @importFrom ggplot2 scale_color_gradientn
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @rdname scale_bs5
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
#'   scale_fill_bs5("teal")
scale_color_bs5 <- function(
    palette = c(
      "blue", "indigo", "purple", "pink", "red", "orange", "yellow",
      "green", "teal", "cyan", "gray"
    ), alpha = 1, reverse = FALSE, ...) {
  palette <- match.arg(palette)
  scale_color_gradientn(
    colours = rgb_bs5(
      palette,
      n = 512, alpha = alpha, reverse = reverse
    ),
    ...
  )
}

#' @export scale_colour_bs5
#' @rdname scale_bs5
scale_colour_bs5 <- scale_color_bs5

#' @export scale_fill_bs5
#' @importFrom ggplot2 scale_fill_gradientn
#' @rdname scale_bs5
scale_fill_bs5 <- function(
    palette = c(
      "blue", "indigo", "purple", "pink", "red", "orange", "yellow",
      "green", "teal", "cyan", "gray"
    ), alpha = 1, reverse = FALSE, ...) {
  palette <- match.arg(palette)
  scale_fill_gradientn(
    colours = rgb_bs5(
      palette,
      n = 512, alpha = alpha, reverse = reverse
    ),
    ...
  )
}
