# The Simpsons color scales

See [`pal_simpsons()`](https://nanx.me/ggsci/reference/pal_simpsons.md)
for details.

## Usage

``` r
scale_color_simpsons(palette = c("springfield"), alpha = 1, ...)

scale_colour_simpsons(palette = c("springfield"), alpha = 1, ...)

scale_fill_simpsons(palette = c("springfield"), alpha = 1, ...)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"springfield"`
  (16-color palette).

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
example_scatterplot() + scale_color_simpsons()
#> `geom_smooth()` using formula = 'y ~ x'

example_barplot() + scale_fill_simpsons()
```
