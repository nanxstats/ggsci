# Journal of Clinical Oncology color palettes

Color palette inspired by plots in *Journal of Clinical Oncology*.

## Usage

``` r
pal_jco(palette = c("default"), alpha = 1)
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

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_jco("default")(10))

show_col(pal_jco("default", alpha = 0.6)(10))
```
