# Tron Legacy color scales

See [`pal_tron()`](https://nanx.me/ggsci/reference/pal_tron.md) for
details.

## Usage

``` r
scale_color_tron(palette = c("legacy"), alpha = 1, ...)

scale_colour_tron(palette = c("legacy"), alpha = 1, ...)

scale_fill_tron(palette = c("legacy"), alpha = 1, ...)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"legacy"`
  (7-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

- ...:

  Additional parameters for
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
example_scatterplot() +
  ggplot2::theme_dark() +
  ggplot2::theme(
    panel.background = ggplot2::element_rect(fill = "#2D2D2D"),
    legend.key = ggplot2::element_rect(fill = "#2D2D2D")
  ) +
  scale_color_tron()
#> `geom_smooth()` using formula = 'y ~ x'


example_barplot() +
  ggplot2::theme_dark() +
  ggplot2::theme(
    panel.background = ggplot2::element_rect(fill = "#2D2D2D")
  ) +
  scale_fill_tron()
```
