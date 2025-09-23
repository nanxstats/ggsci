#' iTerm color palettes
#'
#' ANSI terminal color palettes sourced from the iterm2-color-schemes project.
#' Each theme provides normal and bright variants.
#'
#' @param palette Palette name. See [iterm_palettes()] for available options.
#' @param variant Variant of the palette. One of `"normal"`, `"bright"`.
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_iterm
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @references
#' <https://github.com/mbadolato/iTerm2-Color-Schemes>
#'
#' @examples
#' library("scales")
#' show_col(pal_iterm("Rose Pine")(6))
#' show_col(pal_iterm("Rose Pine", variant = "bright", alpha = 0.7)(6))
pal_iterm <- function(palette = iterm_palettes(), variant = c("normal", "bright"), alpha = 1) {
  palette <- match.arg(palette)
  variant <- match.arg(variant)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- ggsci_db_iterm[[palette]][[variant]]
  raw_cols_rgb <- col2rgb(raw_cols)
  alpha_cols <- rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  manual_pal(unname(alpha_cols))
}

#' iTerm color scales
#'
#' See [pal_iterm()] for details.
#'
#' @inheritParams pal_iterm
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_iterm
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @rdname scale_iterm
#'
#' @examples
#' example_scatterplot() + scale_color_iterm("Rose Pine")
#' example_barplot() + scale_fill_iterm("Rose Pine")
scale_color_iterm <- function(palette = iterm_palettes(), variant = c("normal", "bright"), alpha = 1, ...) {
  palette <- match.arg(palette)
  variant <- match.arg(variant)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_iterm(palette, variant, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "iterm", palette = pal_iterm(palette, variant, alpha), ...)
  }
}

#' @export scale_colour_iterm
#' @rdname scale_iterm
scale_colour_iterm <- scale_color_iterm

#' @export scale_fill_iterm
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_iterm
scale_fill_iterm <- function(palette = iterm_palettes(), variant = c("normal", "bright"), alpha = 1, ...) {
  palette <- match.arg(palette)
  variant <- match.arg(variant)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_iterm(palette, variant, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "iterm", palette = pal_iterm(palette, variant, alpha), ...)
  }
}
