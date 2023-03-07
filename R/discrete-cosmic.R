#' COSMIC Color Palettes
#'
#' Color palettes inspired by the colors used in projects from the
#' \href{https://cancer.sanger.ac.uk/cosmic}{Catalogue Of
#' Somatic Mutations in Cancers (COSMIC)}
#'
#' @param palette Palette type. Currently there are three available options:
#' \code{"signature_substitutions"} (6-color palette),
#' \code{"hallmarks_light"} (10-color palette), and \code{"hallmarks_dark"}
#' (10-color palette). The \code{"hallmarks_light"} option is from
#' \href{https://pubmed.ncbi.nlm.nih.gov/21376230/}{Hanahan and Weinberg (2011)}.
#'
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#'
#' @export pal_cosmic
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Joshua H. Cook <\email{joshuacook0023@@gmail.com}> |
#' <\href{https://github.com/jhrcook}{GitHub/jhrcook}>
#'
#' @examples
#' library("scales")
#' show_col(pal_cosmic("hallmarks_light")(10))
#' show_col(pal_cosmic("hallmarks_light", alpha = 0.6)(10))
#' show_col(pal_cosmic("hallmarks_dark")(10))
#' show_col(pal_cosmic("hallmarks_dark", alpha = 0.6)(10))
#' show_col(pal_cosmic("signature_substitutions")(6))
#' show_col(pal_cosmic("signature_substitutions", alpha = 0.6)(6))
pal_cosmic <- function(
  palette = c("hallmarks_light", "hallmarks_dark", "signature_substitutions"),
  alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"cosmic"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' COSMIC Color Scales
#'
#' See \code{\link{pal_cosmic}} for details.
#'
#' @inheritParams pal_cosmic
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_cosmic
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Joshua H. Cook <\email{joshuacook0023@@gmail.com}> |
#' <\href{https://github.com/jhrcook}{GitHub/jhrcook}>
#'
#' @rdname scale_cosmic
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
#'   theme_bw() + scale_color_cosmic()
#'
#' ggplot(
#'   subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
#'   aes(x = depth, fill = cut)
#' ) +
#'   geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
#'   theme_bw() + scale_fill_cosmic()
scale_color_cosmic <- function(
  palette = c("hallmarks_light", "hallmarks_dark", "signature_substitutions"),
  alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("colour", "cosmic", pal_cosmic(palette, alpha), ...)
}

#' @export scale_colour_cosmic
#' @rdname scale_cosmic
scale_colour_cosmic <- scale_color_cosmic

#' @export scale_fill_cosmic
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_cosmic
scale_fill_cosmic <- function(
  palette = c("hallmarks_light", "hallmarks_dark", "signature_substitutions"),
  alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("fill", "cosmic", pal_cosmic(palette, alpha), ...)
}
