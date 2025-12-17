# D3.js color scales

See [`pal_d3()`](https://nanx.me/ggsci/reference/pal_d3.md) for details.

## Usage

``` r
scale_color_d3(
  palette = c("category10", "category20", "category20b", "category20c"),
  alpha = 1,
  ...
)

scale_colour_d3(
  palette = c("category10", "category20", "category20b", "category20c"),
  alpha = 1,
  ...
)

scale_fill_d3(
  palette = c("category10", "category20", "category20b", "category20c"),
  alpha = 1,
  ...
)
```

## Arguments

- palette:

  Palette type. There are four available options:

  - `"category10"` (10-color palette).

  - `"category20"` (20-color palette).

  - `"category20b"` (20-color palette).

  - `"category20c"` (20-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

- ...:

  Additional parameters for
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

## References

<https://github.com/d3/d3-3.x-api-reference/blob/master/Ordinal-Scales.md>

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
p1 <- example_scatterplot()
p2 <- example_barplot()

p1 + scale_color_d3()
#> `geom_smooth()` using formula = 'y ~ x'

p2 + scale_fill_d3()


p1 + scale_color_d3(palette = "category20")
#> `geom_smooth()` using formula = 'y ~ x'

p2 + scale_fill_d3(palette = "category20")


p1 + scale_color_d3(palette = "category20b")
#> `geom_smooth()` using formula = 'y ~ x'

p2 + scale_fill_d3(palette = "category20b")


p1 + scale_color_d3(palette = "category20c")
#> `geom_smooth()` using formula = 'y ~ x'

p2 + scale_fill_d3(palette = "category20c")
```
