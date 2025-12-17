# COSMIC color palettes

Color palettes inspired by the colors used in projects from the
[Catalogue Of Somatic Mutations in Cancers
(COSMIC)](https://cancer.sanger.ac.uk/cosmic).

## Usage

``` r
pal_cosmic(
  palette = c("hallmarks_light", "hallmarks_dark", "signature_substitutions"),
  alpha = 1
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

## Author

Joshua H. Cook \| <joshuacook0023@gmail.com> \|
[@jhrcook](https://github.com/jhrcook)

## Examples

``` r
library("scales")
show_col(pal_cosmic("hallmarks_light")(10))

show_col(pal_cosmic("hallmarks_light", alpha = 0.6)(10))

show_col(pal_cosmic("hallmarks_dark")(10))

show_col(pal_cosmic("hallmarks_dark", alpha = 0.6)(10))

show_col(pal_cosmic("signature_substitutions")(6))

show_col(pal_cosmic("signature_substitutions", alpha = 0.6)(6))
```
