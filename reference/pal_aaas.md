# AAAS journal color palettes

Color palettes inspired by plots in journals published by American
Association for the Advancement of Science (AAAS), such as *Science* and
*Science Translational Medicine*.

## Usage

``` r
pal_aaas(palette = c("default"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"default"`
  (10-color palette inspired by *Science*).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_aaas("default")(10))

show_col(pal_aaas("default", alpha = 0.6)(10))
```
