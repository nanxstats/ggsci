#' The GSEA GenePattern Color Palettes
#'
#' Color palette inspired by the colors used in the
#' heatmaps plotted by GSEA GenePattern.
#'
#' @param palette Palette type.
#' Currently there is one available option: \code{"default"}
#' (continuous palette with 12 base colors).
#' @param n Number of individual colors to be generated.
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#' @param reverse Logical. Should the order of the colors be reversed?
#'
#' @export rgb_gsea
#'
#' @importFrom grDevices colorRamp rgb
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @note The 12 base colors used in this palette are derived from the
#' \href{https://modulerepository.genepattern.org/gpModuleRepository/download/prod/module/?file=/HeatMapImage/broad.mit.edu:cancer.software.genepattern.module.analysis/00032/6/HeatMapImage.pdf}{HeatMapImage documentation}.
#'
#' @examples
#' library("scales")
#' show_col(pal_gsea("default")(12))
#' show_col(pal_gsea("default", n = 30, alpha = 0.6, reverse = TRUE)(30))
rgb_gsea <- function(palette = c("default"), n = 12, alpha = 1, reverse = FALSE) {
  palette <- match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"gsea"[[palette]]
  func_cols <- colorRamp(raw_cols, space = "Lab", interpolate = "spline")
  mat_cols <- func_cols(seq(0L, 1L, length.out = n))
  alpha_cols <- rgb(
    mat_cols[, 1L], mat_cols[, 2L], mat_cols[, 3L],
    alpha = alpha * 255L, maxColorValue = 255L
  )

  if (reverse) alpha_cols <- rev(alpha_cols)

  alpha_cols
}

#' The GSEA GenePattern Color Palettes
#'
#' Color palette inspired by the colors used in the
#' heatmaps plotted by GSEA GenePattern.
#'
#' @inheritParams rgb_gsea
#'
#' @export pal_gsea
#'
#' @importFrom scales manual_pal
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @examples
#' library("scales")
#' show_col(pal_gsea("default")(12))
#' show_col(pal_gsea("default", n = 30, alpha = 0.6, reverse = TRUE)(30))
pal_gsea <- function(palette = c("default"), n = 12, alpha = 1, reverse = FALSE) {
  palette <- match.arg(palette)
  alpha_cols <- rgb_gsea(palette, n, alpha, reverse)
  manual_pal(unname(alpha_cols))
}

#' The GSEA GenePattern Color Scales
#'
#' See \code{\link{pal_gsea}} for details.
#'
#' @inheritParams pal_gsea
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_gsea
#'
#' @importFrom ggplot2 scale_color_gradientn
#'
#' @author Nan Xiao <\email{me@@nanx.me}> |
#' <\href{https://nanx.me}{https://nanx.me}>
#'
#' @rdname scale_gsea
#'
#' @examples
#' library("ggplot2")
#' library("reshape2")
#' data("mtcars")
#'
#' cor <- cor(mtcars)
#' cor_melt <- melt(cor)
#'
#' ggplot(
#'   cor_melt,
#'   aes(x = Var1, y = Var2, fill = value)
#' ) +
#'   geom_tile(colour = "black", size = 0.3) +
#'   theme_bw() + scale_fill_gsea()
scale_color_gsea <- function(palette = c("default"), alpha = 1, reverse = FALSE, ...) {
  palette <- match.arg(palette)
  scale_color_gradientn(colours = rgb_gsea(palette, n = 512, alpha = alpha, reverse = reverse), ...)
}

#' @export scale_colour_gsea
#' @rdname scale_gsea
scale_colour_gsea <- scale_color_gsea

#' @export scale_fill_gsea
#' @importFrom ggplot2 scale_fill_gradientn
#' @rdname scale_gsea
scale_fill_gsea <- function(palette = c("default"), alpha = 1, reverse = FALSE, ...) {
  palette <- match.arg(palette)
  scale_fill_gradientn(colours = rgb_gsea(palette, n = 512, alpha = alpha, reverse = reverse), ...)
}
