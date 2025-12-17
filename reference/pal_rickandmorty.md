# Rick and Morty color palettes

Color palettes inspired by the colors used in *Rick and Morty*.

## Usage

``` r
pal_rickandmorty(palette = c("schwifty"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"schwifty"`
  (12-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_rickandmorty("schwifty")(12))

show_col(pal_rickandmorty("schwifty", alpha = 0.6)(12))
```
