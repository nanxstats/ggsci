# NPG journal color palettes

Color palettes inspired by plots in journals published by Nature
Publishing Group, such as *Nature Reviews Cancer*.

## Usage

``` r
pal_npg(palette = c("nrc"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"nrc"`
  (10-color palette inspired by *Nature Reviews Cancer*).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_npg("nrc")(10))

show_col(pal_npg("nrc", alpha = 0.6)(10))
```
