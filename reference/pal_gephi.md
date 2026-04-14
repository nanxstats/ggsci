# Gephi color palettes

Generative discrete color palettes adapted from the palette engine in
Gephi. These palettes are designed to generate visually distinct colors
for an arbitrary number of categories.

## Usage

``` r
pal_gephi(palette = gephi_palettes(), alpha = 1)
```

## Arguments

- palette:

  Palette type. See
  [`gephi_palettes()`](https://nanx.me/ggsci/reference/gephi_palettes.md)
  for available options.

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## Details

The Gephi palette generator uses the current R random number state
directly. If you need reproducible results, call
[`base::set.seed()`](https://rdrr.io/r/base/Random.html) before creating
a palette or evaluating the scale. To isolate RNG side effects, consider
using
[`withr::with_seed()`](https://withr.r-lib.org/reference/with_seed.html).

## Examples

``` r
library("scales")
set.seed(42)
show_col(pal_gephi("default")(10))

show_col(pal_gephi("fancy_light")(20))
```
