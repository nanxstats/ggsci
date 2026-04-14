# Gephi color scales

See [`pal_gephi()`](https://nanx.me/ggsci/reference/pal_gephi.md) for
details.

## Usage

``` r
scale_color_gephi(palette = gephi_palettes(), alpha = 1, ...)

scale_colour_gephi(palette = gephi_palettes(), alpha = 1, ...)

scale_fill_gephi(palette = gephi_palettes(), alpha = 1, ...)
```

## Arguments

- palette:

  Palette type. See
  [`gephi_palettes()`](https://nanx.me/ggsci/reference/gephi_palettes.md)
  for available options.

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

- ...:

  Additional parameters for
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

## Examples

``` r
set.seed(42)
example_scatterplot() + scale_color_gephi()
#> `geom_smooth()` using formula = 'y ~ x'

example_barplot() + scale_fill_gephi("fancy_light")
```
