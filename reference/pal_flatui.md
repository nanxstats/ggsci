# Flat UI color palettes

Color palettes inspired by the Flat UI colors.

## Usage

``` r
pal_flatui(palette = c("default", "flattastic", "aussie"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there are three available options:

  - `"default"` (10-color palette).

  - `"flattastic"` (12-color palette).

  - `"aussie"` (10-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## Author

Clara Jégousse \| <cat3@hi.is>

## Examples

``` r
library("scales")
show_col(pal_flatui("default")(10))

show_col(pal_flatui("flattastic")(12))

show_col(pal_flatui("aussie")(10))

show_col(pal_flatui("aussie", alpha = 0.6)(10))
```
