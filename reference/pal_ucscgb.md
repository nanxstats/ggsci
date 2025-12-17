# UCSC Genome Browser color palette

Color palette from UCSC Genome Browser chromosome colors.

## Usage

``` r
pal_ucscgb(palette = c("default"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"default"`
  (26-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_ucscgb("default")(26))

show_col(pal_ucscgb("default", alpha = 0.6)(26))
```
