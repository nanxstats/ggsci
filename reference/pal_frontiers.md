# Frontiers journal color palettes

Color palettes inspired by the colors used in *Frontiers* journals.

## Usage

``` r
pal_frontiers(palette = c("default"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"default"`
  (10-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## Author

Clara Jégousse \| <cat3@hi.is>

## Examples

``` r
library("scales")
show_col(pal_frontiers("default")(7))

show_col(pal_frontiers("default", alpha = 0.6)(7))
```
