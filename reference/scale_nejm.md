# NEJM color scales

See [`pal_nejm()`](https://nanx.me/ggsci/reference/pal_nejm.md) for
details.

## Usage

``` r
scale_color_nejm(palette = c("default"), alpha = 1, ...)

scale_colour_nejm(palette = c("default"), alpha = 1, ...)

scale_fill_nejm(palette = c("default"), alpha = 1, ...)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"default"`
  (8-color palette).

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
example_scatterplot() + scale_color_nejm()
#> `geom_smooth()` using formula = 'y ~ x'

example_barplot() + scale_fill_nejm()
```
