#' COSMIC color palettes
#'
#' Color palettes inspired by the colors used in projects from the
#' [Catalogue Of
#' Somatic Mutations in Cancers (COSMIC)](https://cancer.sanger.ac.uk/cosmic).
#'
#' @param palette Palette type. Currently there are three available options:
#'   - `"signature_substitutions"` (6-color palette).
#'   - `"hallmarks_light"` (10-color palette).
#'   - `"hallmarks_dark"` (10-color palette).
#'
#'   The `"hallmarks_light"` option is from
#'   [Hanahan and Weinberg (2011)](https://pubmed.ncbi.nlm.nih.gov/21376230/).
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_cosmic
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Joshua H. Cook | \email{joshuacook0023@gmail.com} |
#' [@jhrcook](https://github.com/jhrcook)
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

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"cosmic"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' COSMIC color scales
#'
#' See [pal_cosmic()] for details.
#'
#' @inheritParams pal_cosmic
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_cosmic
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Joshua H. Cook | \email{joshuacook0023@gmail.com} |
#' [@jhrcook](https://github.com/jhrcook)
#'
#' @rdname scale_cosmic
#'
#' @examples
#' example_scatterplot() + scale_color_cosmic()
#' example_barplot() + scale_fill_cosmic()
scale_color_cosmic <- function(
    palette = c("hallmarks_light", "hallmarks_dark", "signature_substitutions"),
    alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_cosmic(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "cosmic", palette = pal_cosmic(palette, alpha), ...)
  }
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
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_cosmic(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "cosmic", palette = pal_cosmic(palette, alpha), ...)
  }
}
