# Star Trek color palettes

Color palettes inspired by the colors used in *Star Trek*.

## Usage

``` r
pal_startrek(palette = c("uniform"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"uniform"`
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
show_col(pal_startrek("uniform")(7))

show_col(pal_startrek("uniform", alpha = 0.6)(7))
```
