# The University of Chicago color scales

See [`pal_uchicago()`](https://nanx.me/ggsci/reference/pal_uchicago.md)
for details.

## Usage

``` r
scale_color_uchicago(palette = c("default", "light", "dark"), alpha = 1, ...)

scale_colour_uchicago(palette = c("default", "light", "dark"), alpha = 1, ...)

scale_fill_uchicago(palette = c("default", "light", "dark"), alpha = 1, ...)
```

## Arguments

- palette:

  Palette type. There are three available options:

  - `"default"` (9-color palette);

  - `"light"` (9-color light palette);

  - `"dark"` (9-color dark palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

- ...:

  Additional parameters for
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

## References

<https://news.uchicago.edu/sites/default/files/attachments/_uchicago.identity.guidelines.pdf>

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
p1 <- example_scatterplot()
p2 <- example_barplot()

p1 + scale_color_uchicago()
#> `geom_smooth()` using formula = 'y ~ x'

p2 + scale_fill_uchicago()


p1 + scale_color_uchicago(palette = "light")
#> `geom_smooth()` using formula = 'y ~ x'

p2 + scale_fill_uchicago(palette = "light")


p1 + scale_color_uchicago(palette = "dark")
#> `geom_smooth()` using formula = 'y ~ x'

p2 + scale_fill_uchicago(palette = "dark")
```
