# Atlassian Design System palette

The Atlassian Design System categorical data visualization palette.

## Usage

``` r
pal_atlassian(palette = c("categorical8"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there is one available option:
  `"categorical8"` (8-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## References

Atlassian (2025). "Atlassian Design System categorical chart colors."
<https://atlassian.design/foundations/color-new/data-visualization-color>

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_atlassian("categorical8")(8))

show_col(pal_atlassian("categorical8", alpha = 0.6)(8))
```
