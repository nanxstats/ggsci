#' Tailwind CSS color palettes
#'
#' Tailwind CSS color palettes.
#'
#' @param palette Palette type. There are 22 available options:
#'   - `"slate"`
#'   - `"gray"`
#'   - `"zinc"`
#'   - `"neutral"`
#'   - `"stone"`
#'   - `"red"`
#'   - `"orange"`
#'   - `"amber"`
#'   - `"yellow"`
#'   - `"lime"`
#'   - `"green"`
#'   - `"emerald"`
#'   - `"teal"`
#'   - `"cyan"`
#'   - `"sky"`
#'   - `"blue"`
#'   - `"indigo"`
#'   - `"violet"`
#'   - `"purple"`
#'   - `"fuchsia"`
#'   - `"pink"`
#'   - `"rose"`
#' @param n Number of individual colors to be generated.
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#' @param reverse Logical. Should the order of the colors be reversed?
#'
#' @export rgb_tw3
#'
#' @importFrom grDevices colorRamp rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @references
#' <https://tailwindcss.com/docs/customizing-colors>
#'
#' @examples
#' library("scales")
#' show_col(pal_tw3("rose")(10))
#' show_col(pal_tw3("rose", n = 30, alpha = 0.6, reverse = TRUE)(30))
rgb_tw3 <- function(
    palette = c(
      "slate", "gray", "zinc", "neutral", "stone", "red", "orange", "amber",
      "yellow", "lime", "green", "emerald", "teal", "cyan", "sky", "blue",
      "indigo", "violet", "purple", "fuchsia", "pink", "rose"
    ), n = 10, alpha = 1, reverse = FALSE) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"tw3"[[palette]]
  func_cols <- colorRamp(raw_cols, space = "Lab", interpolate = "spline")
  mat_cols <- func_cols(seq(0L, 1L, length.out = n))
  alpha_cols <- rgb(
    mat_cols[, 1L], mat_cols[, 2L], mat_cols[, 3L],
    alpha = alpha * 255L, maxColorValue = 255L
  )

  if (reverse) alpha_cols <- rev(alpha_cols)

  alpha_cols
}

#' Tailwind CSS color palettes
#'
#' Tailwind CSS color palettes.
#'
#' @inheritParams rgb_tw3
#'
#' @export pal_tw3
#'
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @examples
#' library("scales")
#' show_col(pal_tw3("rose")(10))
#' show_col(pal_tw3("rose", n = 30, alpha = 0.6, reverse = TRUE)(30))
pal_tw3 <- function(
    palette = c(
      "slate", "gray", "zinc", "neutral", "stone", "red", "orange", "amber",
      "yellow", "lime", "green", "emerald", "teal", "cyan", "sky", "blue",
      "indigo", "violet", "purple", "fuchsia", "pink", "rose"
    ), n = 10, alpha = 1, reverse = FALSE) {
  palette <- match.arg(palette)

  alpha_cols <- rgb_tw3(palette, n, alpha, reverse)
  manual_pal(unname(alpha_cols))
}

#' Tailwind CSS color scales
#'
#' See [pal_tw3()] for details.
#'
#' @inheritParams pal_tw3
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_tw3
#'
#' @importFrom ggplot2 scale_color_gradientn
#'
#' @author Nan Xiao | \email{me@nanx.me} | <https://nanx.me>
#'
#' @rdname scale_tw3
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
#'   scale_fill_tw3("slate")
scale_color_tw3 <- function(
    palette = c(
      "slate", "gray", "zinc", "neutral", "stone", "red", "orange", "amber",
      "yellow", "lime", "green", "emerald", "teal", "cyan", "sky", "blue",
      "indigo", "violet", "purple", "fuchsia", "pink", "rose"
    ), alpha = 1, reverse = FALSE, ...) {
  palette <- match.arg(palette)
  scale_color_gradientn(
    colours = rgb_tw3(
      palette,
      n = 512, alpha = alpha, reverse = reverse
    ),
    ...
  )
}

#' @export scale_colour_tw3
#' @rdname scale_tw3
scale_colour_tw3 <- scale_color_tw3

#' @export scale_fill_tw3
#' @importFrom ggplot2 scale_fill_gradientn
#' @rdname scale_tw3
scale_fill_tw3 <- function(
    palette = c(
      "slate", "gray", "zinc", "neutral", "stone", "red", "orange", "amber",
      "yellow", "lime", "green", "emerald", "teal", "cyan", "sky", "blue",
      "indigo", "violet", "purple", "fuchsia", "pink", "rose"
    ), alpha = 1, reverse = FALSE, ...) {
  palette <- match.arg(palette)
  scale_fill_gradientn(
    colours = rgb_tw3(
      palette,
      n = 512, alpha = alpha, reverse = reverse
    ),
    ...
  )
}
