# BMJ color scales

See [`pal_bmj()`](https://nanx.me/ggsci/reference/pal_bmj.md) for
details.

## Usage

``` r
scale_color_bmj(palette = c("default"), alpha = 1, ...)

scale_colour_bmj(palette = c("default"), alpha = 1, ...)

scale_fill_bmj(palette = c("default"), alpha = 1, ...)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"default"`
  (9-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

- ...:

  Additional parameters for
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

## References

<https://technology.bmj.com/living-style-guide/colour.html>

## Author

Hui Chen \| <huichen@zju.edu.cn>

## Examples

``` r
example_scatterplot() + scale_color_bmj()
#> `geom_smooth()` using formula = 'y ~ x'

example_barplot() + scale_fill_bmj()
```
