# Bootstrap 5 color palettes

Bootstrap 5 color palettes.

## Usage

``` r
pal_bs5(
  palette = c("blue", "indigo", "purple", "pink", "red", "orange", "yellow", "green",
    "teal", "cyan", "gray"),
  n = 10,
  alpha = 1,
  reverse = FALSE
)
```

## Arguments

- palette:

  Palette type. There are 11 available options:

  - `"blue"`

  - `"indigo"`

  - `"purple"`

  - `"pink"`

  - `"red"`

  - `"orange"`

  - `"yellow"`

  - `"green"`

  - `"teal"`

  - `"cyan"`

  - `"gray"`

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
show_col(pal_bs5("indigo")(10))

show_col(pal_bs5("indigo", n = 30, alpha = 0.6, reverse = TRUE)(30))
```
