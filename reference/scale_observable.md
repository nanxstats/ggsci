# Observable 10 color scales

See
[`pal_observable()`](https://nanx.me/ggsci/reference/pal_observable.md)
for details.

## Usage

``` r
scale_color_observable(palette = c("observable10"), alpha = 1, ...)

scale_colour_observable(palette = c("observable10"), alpha = 1, ...)

scale_fill_observable(palette = c("observable10"), alpha = 1, ...)
```

## Arguments

- palette:

  Palette type. Currently there is one available option:
  `"observable10"` (10-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

- ...:

  Additional parameters for
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

## References

Pettiross J (2023). "Crafting data colors and staying on brand."
*Observable blog*. <https://observablehq.com/blog/crafting-data-colors>

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
example_scatterplot() + scale_color_observable()
#> `geom_smooth()` using formula = 'y ~ x'

example_barplot() + scale_fill_observable()
```
