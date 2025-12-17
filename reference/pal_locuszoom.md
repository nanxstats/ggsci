# LocusZoom color palette

Color palettes based on the colors used by LocusZoom.

## Usage

``` r
pal_locuszoom(palette = c("default"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"default"`
  (7-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## References

Pruim, Randall J., et al. (2010). LocusZoom: regional visualization of
genome-wide association scan results. *Bioinformatics*, 26(18),
2336–2337.

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_locuszoom("default")(7))

show_col(pal_locuszoom("default", alpha = 0.6)(7))
```
