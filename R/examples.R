#' Example plots for discrete color palettes
#'
#' Utility functions that return simple ggplot2 examples to
#' demonstrate discrete color/fill scales.
#'
#' @details
#' - `example_scatterplot()` creates a scatter plot of large diamonds
#'   (`carat >= 2.2`), mapping `table` to the x‑axis, `price` to the y‑axis,
#'   and `cut` to color.
#' - `example_barplot()` creates a side‑by‑side bar chart of diamond counts
#'   by `color`, grouped by `cut` via fill.
#'
#' @return A `ggplot` object.
#'
#' @rdname example_plots
#'
#' @importFrom rlang .data
#'
#' @export example_scatterplot
#'
#' @examples
#' example_scatterplot()
#' example_barplot()
example_scatterplot <- function() {
  ggplot2::ggplot(
    ggplot2::diamonds[ggplot2::diamonds$carat >= 2.2, ],
    ggplot2::aes(x = .data$table, y = .data$price, colour = .data$cut)
  ) +
    ggplot2::geom_point(alpha = 0.7) +
    ggplot2::geom_smooth(method = "loess", alpha = 0.05, linewidth = 1, span = 1) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank()
    )
}

#' @rdname example_plots
#' @export example_barplot
example_barplot <- function() {
  ggplot2::ggplot(
    ggplot2::diamonds,
    ggplot2::aes(x = .data$color, fill = .data$cut)
  ) +
    ggplot2::geom_bar(position = ggplot2::position_dodge()) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_blank(),
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.minor.y = ggplot2::element_blank()
    )
}
