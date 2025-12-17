# Integrative Genomics Viewer (IGV) color palettes

Color palettes based on the colors used by Integrative Genomics Viewer
(IGV).

## Usage

``` r
pal_igv(palette = c("default", "alternating"), alpha = 1)
```

## Arguments

- palette:

  Palette type. There are two available options:

  - `"default"` (51-color palette).

  - `"alternating"` (2-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## References

James T. Robinson, Helga Thorvaldsdóttir, Wendy Winckler, Mitchell
Guttman, Eric S. Lander, Gad Getz, Jill P. Mesirov. Integrative Genomics
Viewer. *Nature Biotechnology* 29, 24–26 (2011).

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_igv("default")(51))

show_col(pal_igv("alternating")(2))
```
