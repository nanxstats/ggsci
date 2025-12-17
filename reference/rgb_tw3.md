# Tailwind CSS color palettes

Tailwind CSS color palettes.

## Usage

``` r
rgb_tw3(
  palette = c("slate", "gray", "zinc", "neutral", "stone", "red", "orange", "amber",
    "yellow", "lime", "green", "emerald", "teal", "cyan", "sky", "blue", "indigo",
    "violet", "purple", "fuchsia", "pink", "rose"),
  n = 10,
  alpha = 1,
  reverse = FALSE
)
```

## Arguments

- palette:

  Palette type. There are 22 available options:

  - `"slate"`

  - `"gray"`

  - `"zinc"`

  - `"neutral"`

  - `"stone"`

  - `"red"`

  - `"orange"`

  - `"amber"`

  - `"yellow"`

  - `"lime"`

  - `"green"`

  - `"emerald"`

  - `"teal"`

  - `"cyan"`

  - `"sky"`

  - `"blue"`

  - `"indigo"`

  - `"violet"`

  - `"purple"`

  - `"fuchsia"`

  - `"pink"`

  - `"rose"`

- n:

  Number of individual colors to be generated.

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

- reverse:

  Logical. Should the order of the colors be reversed?

## References

<https://tailwindcss.com/docs/customizing-colors>

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_tw3("rose")(10))

show_col(pal_tw3("rose", n = 30, alpha = 0.6, reverse = TRUE)(30))
```
