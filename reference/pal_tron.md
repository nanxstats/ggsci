# Tron Legacy color palettes

Color palettes inspired by the colors used in *Tron Legacy*.

## Usage

``` r
pal_tron(palette = c("legacy"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"legacy"`
  (7-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_tron("legacy")(7))

show_col(pal_tron("legacy", alpha = 0.6)(7))
```
