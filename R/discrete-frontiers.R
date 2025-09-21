#' Frontiers journal color palettes
#'
#' Color palettes inspired by the colors used in _Frontiers_ journals.
#'
#' @param palette Palette type.
#'   Currently there is one available option: `"default"`
#'   (10-color palette).
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_frontiers
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @author Clara Jégousse | \email{cat3@hi.is}
#'
#' @examples
#' library("scales")
#' show_col(pal_frontiers("default")(7))
#' show_col(pal_frontiers("default", alpha = 0.6)(7))
pal_frontiers <- function(palette = c("default"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db$"frontiers"[[palette]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' Frontiers journal color scales
#'
#' See [pal_frontiers()] for details.
#'
#' @inheritParams pal_frontiers
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_frontiers
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @author Clara Jégousse | \email{cat3@hi.is}
#'
#' @rdname scale_frontiers
#'
#' @examples
#' example_scatterplot() +
#'   ggplot2::theme_dark() +
#'   ggplot2::theme(
#'     panel.background = ggplot2::element_rect(fill = "#2D2D2D"),
#'     legend.key = ggplot2::element_rect(fill = "#2D2D2D")
#'   ) +
#'   scale_color_frontiers()
#'
#' example_barplot() +
#'   ggplot2::theme_dark() +
#'   ggplot2::theme(
#'     panel.background = ggplot2::element_rect(fill = "#2D2D2D")
#'   ) +
#'   scale_fill_frontiers()
scale_color_frontiers <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_frontiers(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "frontiers", palette = pal_frontiers(palette, alpha), ...)
  }
}

#' @export scale_colour_frontiers
#' @rdname scale_frontiers
scale_colour_frontiers <- scale_color_frontiers

#' @export scale_fill_frontiers
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_frontiers
scale_fill_frontiers <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_frontiers(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "frontiers", palette = pal_frontiers(palette, alpha), ...)
  }
}
