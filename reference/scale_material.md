# Material Design color scales

See [`pal_material()`](https://nanx.me/ggsci/reference/pal_material.md)
for details.

## Usage

``` r
scale_color_material(
  palette = c("red", "pink", "purple", "deep-purple", "indigo", "blue", "light-blue",
    "cyan", "teal", "green", "light-green", "lime", "yellow", "amber", "orange",
    "deep-orange", "brown", "grey", "blue-grey"),
  alpha = 1,
  reverse = FALSE,
  ...
)

scale_colour_material(
  palette = c("red", "pink", "purple", "deep-purple", "indigo", "blue", "light-blue",
    "cyan", "teal", "green", "light-green", "lime", "yellow", "amber", "orange",
    "deep-orange", "brown", "grey", "blue-grey"),
  alpha = 1,
  reverse = FALSE,
  ...
)

scale_fill_material(
  palette = c("red", "pink", "purple", "deep-purple", "indigo", "blue", "light-blue",
    "cyan", "teal", "green", "light-green", "lime", "yellow", "amber", "orange",
    "deep-orange", "brown", "grey", "blue-grey"),
  alpha = 1,
  reverse = FALSE,
  ...
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

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

- reverse:

  Logical. Should the order of the colors be reversed?

- ...:

  Additional parameters for
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("ggplot2")

data("mtcars")
cor <- abs(cor(mtcars))
cor_melt <- data.frame(
  Var1 = rep(seq_len(nrow(cor)), times = ncol(cor)),
  Var2 = rep(seq_len(ncol(cor)), each = nrow(cor)),
  value = as.vector(cor)
)

ggplot(
  cor_melt,
  aes(x = Var1, y = Var2, fill = value)
) +
  geom_tile(colour = "black", size = 0.3) +
  theme_bw() +
  scale_fill_material("blue-grey")
```
