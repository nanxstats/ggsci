# COSMIC color scales

See [`pal_cosmic()`](https://nanx.me/ggsci/reference/pal_cosmic.md) for
details.

## Usage

``` r
scale_color_cosmic(
  palette = c("hallmarks_light", "hallmarks_dark", "signature_substitutions"),
  alpha = 1,
  ...
)

scale_colour_cosmic(
  palette = c("hallmarks_light", "hallmarks_dark", "signature_substitutions"),
  alpha = 1,
  ...
)

scale_fill_cosmic(
  palette = c("hallmarks_light", "hallmarks_dark", "signature_substitutions"),
  alpha = 1,
  ...
)
```

## Arguments

- palette:

  Palette type. Currently there are three available options:

  - `"signature_substitutions"` (6-color palette).

  - `"hallmarks_light"` (10-color palette).

  - `"hallmarks_dark"` (10-color palette).

  The `"hallmarks_light"` option is from [Hanahan and Weinberg
  (2011)](https://pubmed.ncbi.nlm.nih.gov/21376230/).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

- ...:

  Additional parameters for
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

## Author

Joshua H. Cook \| <joshuacook0023@gmail.com> \|
[@jhrcook](https://github.com/jhrcook)

## Examples

``` r
example_scatterplot() + scale_color_cosmic()
#> `geom_smooth()` using formula = 'y ~ x'

example_barplot() + scale_fill_cosmic()
```
