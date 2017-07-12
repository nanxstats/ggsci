#' The Vaccine Color Palette
#'
#' Color palette inspired by the colors used by the heatmaps
#' created by Tynan DeBold and Dov Friedman in the article
#' "Battling Infectious Diseases in the 20th Century: The Impact of Vaccines".
#'
#' @param palette Palette type.
#' Currently there is one available option: \code{"default"}
#' (continuous palette with 11 base colors).
#' @param n Number of individual colors to be generated.
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#' @param reverse Logical. Should the order of the colors be reversed?
#'
#' @export rgb_vaccine
#'
#' @importFrom grDevices colorRamp rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @note Since this color palette is biased to one tail of the
#' spectrum, it is more suitable for displaying heavy tail data.
#' For example, if a lot of values are concentrated around zero
#' in a set of numbers ranging from 0 to 1.
#' In this case, the biased palette can help us better distinguish
#' the difference between the values in the far end of 0.
#'
#' @references
#' \href{http://graphics.wsj.com/infectious-diseases-and-vaccines/}{Battling Infectious Diseases in the 20th Century: The Impact of Vaccines}.
#'
#' @examples
#' library("scales")
#' show_col(pal_vaccine("default")(11))
#' show_col(pal_vaccine("default", n = 30, alpha = 0.6, reverse = TRUE)(30))
rgb_vaccine = function (
  palette = c('default'), n = 11, alpha = 1, reverse = FALSE) {

  palette = match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop('alpha must be in (0, 1]')

  raw_cols = ggsci_db$'vaccine'[[palette]]
  func_cols = colorRamp(raw_cols, space = 'Lab', interpolate = 'spline', bias = 2)
  mat_cols = func_cols(seq(0L, 1L, length.out = n))
  alpha_cols = rgb(
    mat_cols[, 1L], mat_cols[, 2L], mat_cols[, 3L],
    alpha = alpha * 255L, maxColorValue = 255L)

  if (reverse) alpha_cols = rev(alpha_cols)

  alpha_cols

}

#' The Vaccine Color Palette
#'
#' Color palette inspired by the colors used in the
#' heatmaps created by Tynan DeBold and Dov Friedman.
#'
#' @inheritParams rgb_vaccine
#'
#' @export pal_vaccine
#'
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @examples
#' library("scales")
#' show_col(pal_vaccine("default")(11))
#' show_col(pal_vaccine("default", n = 30, alpha = 0.6, reverse = TRUE)(30))
pal_vaccine = function (
  palette = c('default'), n = 11, alpha = 1, reverse = FALSE) {

  palette = match.arg(palette)

  alpha_cols = rgb_vaccine(palette, n, alpha, reverse)
  manual_pal(unname(alpha_cols))

}

#' The Vaccine Color Scales
#'
#' See \code{\link{pal_vaccine}} for details.
#'
#' @inheritParams pal_vaccine
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_vaccine
#'
#' @importFrom ggplot2 scale_color_gradientn
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @rdname scale_vaccine
#'
#' @examples
#' library("ggplot2")
#' library("reshape2")
#' data("mtcars")
#'
#' cor = cor(mtcars)
#' cor_melt = melt(cor)
#'
#' ggplot(cor_melt,
#'        aes(x = Var1, y = Var2, fill = value)) +
#'   geom_tile(colour = "black", size = 0.3) +
#'   theme_bw() + scale_fill_vaccine()
scale_color_vaccine = function (
  palette = c('default'), alpha = 1, reverse = FALSE, ...) {

  palette = match.arg(palette)
  scale_color_gradientn(colours = rgb_vaccine(
    palette, n = 512, alpha = alpha, reverse = reverse),
    ...)

}

#' @export scale_colour_vaccine
#' @rdname scale_vaccine
scale_colour_vaccine = scale_color_vaccine

#' @export scale_fill_vaccine
#' @importFrom ggplot2 scale_fill_gradientn
#' @rdname scale_vaccine
scale_fill_vaccine = function (
  palette = c('default'), alpha = 1, reverse = FALSE, ...) {

  palette = match.arg(palette)
  scale_fill_gradientn(colours = rgb_vaccine(
    palette, n = 512, alpha = alpha, reverse = reverse),
    ...)

}
