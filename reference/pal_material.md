# Material Design color palettes

Material Design 2 color palettes.

## Usage

``` r
pal_material(
  palette = c("red", "pink", "purple", "deep-purple", "indigo", "blue", "light-blue",
    "cyan", "teal", "green", "light-green", "lime", "yellow", "amber", "orange",
    "deep-orange", "brown", "grey", "blue-grey"),
  n = 10,
  alpha = 1,
  reverse = FALSE
)
```

## Arguments

- palette:

  Palette type. There are 19 available options:

  - `"red"`

  - `"pink"`

  - `"purple"`

  - `"deep-purple"`

  - `"indigo"`

  - `"blue"`

  - `"light-blue"`

  - `"cyan"`

  - `"teal"`

  - `"green"`

  - `"light-green"`

  - `"lime"`

  - `"yellow"`

  - `"amber"`

  - `"orange"`

  - `"deep-orange"`

  - `"brown"`

  - `"grey"`

  - `"blue-grey"`

- n:

  Number of individual colors to be generated.

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

- reverse:

  Logical. Should the order of the colors be reversed?

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_material("indigo")(10))

show_col(pal_material("indigo", n = 30, alpha = 0.6, reverse = TRUE)(30))
```
