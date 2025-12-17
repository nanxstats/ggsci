# Journal of the American Medical Association color palettes

Color palette inspired by plots in *The Journal of the American Medical
Association*.

## Usage

``` r
pal_jama(palette = c("default"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"default"`
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
show_col(pal_jama("default")(7))

show_col(pal_jama("default", alpha = 0.6)(7))
```
