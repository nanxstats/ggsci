# The GSEA GenePattern color palettes

Color palette inspired by the colors used in the heatmaps plotted by
GSEA GenePattern.

## Usage

``` r
rgb_gsea(palette = c("default"), n = 12, alpha = 1, reverse = FALSE)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"default"`
  (continuous palette with 12 base colors).

- n:

  Number of individual colors to be generated.

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

- reverse:

  Logical. Should the order of the colors be reversed?

## Note

The 12 base colors used in this palette are derived from the
[HeatMapImage
documentation](https://modulerepository.genepattern.org/gpModuleRepository/download/prod/module/?file=/HeatMapImage/broad.mit.edu:cancer.software.genepattern.module.analysis/00032/6/HeatMapImage.pdf).

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_gsea("default")(12))

show_col(pal_gsea("default", n = 30, alpha = 0.6, reverse = TRUE)(30))
```
