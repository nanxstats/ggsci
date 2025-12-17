# Flat UI color scales

See [`pal_flatui()`](https://nanx.me/ggsci/reference/pal_flatui.md) for
details.

## Usage

``` r
scale_color_flatui(
  palette = c("default", "flattastic", "aussie"),
  alpha = 1,
  ...
)

scale_colour_flatui(
  palette = c("default", "flattastic", "aussie"),
  alpha = 1,
  ...
)

scale_fill_flatui(
  palette = c("default", "flattastic", "aussie"),
  alpha = 1,
  ...
)
```

## Arguments

- palette:

  Palette type. Currently there are three available options:

  - `"default"` (10-color palette).

  - `"flattastic"` (12-color palette).

  - `"aussie"` (10-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

- ...:

  Additional parameters for
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

## Author

Clara Jégousse \| <cat3@hi.is>

## Examples

``` r
p1 <- example_scatterplot()
p2 <- example_barplot()

p1 + scale_color_flatui()
#> `geom_smooth()` using formula = 'y ~ x'

p2 + scale_fill_flatui()


p1 + scale_color_flatui(palette = "default")
#> `geom_smooth()` using formula = 'y ~ x'

p2 + scale_fill_flatui(palette = "default")


p1 + scale_color_flatui(palette = "flattastic")
#> `geom_smooth()` using formula = 'y ~ x'

p2 + scale_fill_flatui(palette = "flattastic")


p1 + scale_color_flatui(palette = "aussie")
#> `geom_smooth()` using formula = 'y ~ x'

p2 + scale_fill_flatui(palette = "aussie")
```
