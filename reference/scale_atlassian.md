# Atlassian Design System color scales

See
[`pal_atlassian()`](https://nanx.me/ggsci/reference/pal_atlassian.md)
for details.

## Usage

``` r
scale_color_atlassian(palette = c("categorical8"), alpha = 1, ...)

scale_colour_atlassian(palette = c("categorical8"), alpha = 1, ...)

scale_fill_atlassian(palette = c("categorical8"), alpha = 1, ...)
```

## Arguments

- palette:

  Palette type. Currently there is one available option:
  `"categorical8"` (8-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

- ...:

  Additional parameters for
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

## References

Atlassian (2025). "Atlassian Design System categorical chart colors."
<https://atlassian.design/foundations/color-new/data-visualization-color>

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
example_scatterplot() + scale_color_atlassian()
#> `geom_smooth()` using formula = 'y ~ x'

example_barplot() + scale_fill_atlassian()
```
