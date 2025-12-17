# The Simpsons color palettes

Color palettes inspired by the colors used in *The Simpsons*.

## Usage

``` r
pal_simpsons(palette = c("springfield"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"springfield"`
  (16-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_simpsons("springfield")(16))

show_col(pal_simpsons("springfield", alpha = 0.6)(16))
```
