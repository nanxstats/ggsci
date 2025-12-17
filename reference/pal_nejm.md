# NEJM color palettes

Color palette inspired by plots in *The New England Journal of
Medicine*.

## Usage

``` r
pal_nejm(palette = c("default"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"default"`
  (8-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_nejm("default")(8))

show_col(pal_nejm("default", alpha = 0.6)(8))
```
