# Integrative Genomics Viewer (IGV) color scales

See [`pal_igv()`](https://nanx.me/ggsci/reference/pal_igv.md) for
details.

## Usage

``` r
scale_color_igv(palette = c("default", "alternating"), alpha = 1, ...)

scale_colour_igv(palette = c("default", "alternating"), alpha = 1, ...)

scale_fill_igv(palette = c("default", "alternating"), alpha = 1, ...)
```

## Arguments

- palette:

  Palette type. There are two available options:

  - `"default"` (51-color palette).

  - `"alternating"` (2-color palette).

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
p1 <- example_scatterplot()
p2 <- example_barplot()

p1 + scale_color_igv()
#> `geom_smooth()` using formula = 'y ~ x'

p2 + scale_fill_igv()


p1 + ggplot2::scale_colour_manual(
  values = rep(pal_igv("alternating")(2), times = 3)
)
#> `geom_smooth()` using formula = 'y ~ x'

p2 + ggplot2::scale_fill_manual(
  values = rep(pal_igv("alternating")(2), times = 3)
)
```
