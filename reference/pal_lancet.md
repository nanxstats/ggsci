# Lancet journal color palettes

Color palettes inspired by plots in Lancet journals, such as *Lancet
Oncology*.

## Usage

``` r
pal_lancet(palette = c("lanonc"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"lanonc"`
  (9-color palette inspired by *Lancet Oncology*).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_lancet("lanonc")(9))

show_col(pal_lancet("lanonc", alpha = 0.6)(9))
```
