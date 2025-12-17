# Primer color scales

See [`pal_primer()`](https://nanx.me/ggsci/reference/pal_primer.md) for
details.

## Usage

``` r
scale_color_primer(palette = c("mark17"), alpha = 1, ...)

scale_colour_primer(palette = c("mark17"), alpha = 1, ...)

scale_fill_primer(palette = c("mark17"), alpha = 1, ...)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"mark17"`
  (17-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

- ...:

  Additional parameters for
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

## References

GitHub (2025). "Primer data visualization colors."
<https://primer.style/product/ui-patterns/data-visualization/>

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
example_scatterplot() + scale_color_primer()
#> `geom_smooth()` using formula = 'y ~ x'

example_barplot() + scale_fill_primer()
```
