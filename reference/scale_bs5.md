# Bootstrap 5 color scales

See [`pal_bs5()`](https://nanx.me/ggsci/reference/pal_bs5.md) for
details.

## Usage

``` r
scale_color_bs5(
  palette = c("blue", "indigo", "purple", "pink", "red", "orange", "yellow", "green",
    "teal", "cyan", "gray"),
  alpha = 1,
  reverse = FALSE,
  ...
)

scale_colour_bs5(
  palette = c("blue", "indigo", "purple", "pink", "red", "orange", "yellow", "green",
    "teal", "cyan", "gray"),
  alpha = 1,
  reverse = FALSE,
  ...
)

scale_fill_bs5(
  palette = c("blue", "indigo", "purple", "pink", "red", "orange", "yellow", "green",
    "teal", "cyan", "gray"),
  alpha = 1,
  reverse = FALSE,
  ...
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
  scale_fill_bs5("teal")
#> Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
#> ℹ Please use `linewidth` instead.
```
