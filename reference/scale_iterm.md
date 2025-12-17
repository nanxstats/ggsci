# iTerm color scales

See [`pal_iterm()`](https://nanx.me/ggsci/reference/pal_iterm.md) for
details.

## Usage

``` r
scale_color_iterm(
  palette = iterm_palettes(),
  variant = c("normal", "bright"),
  alpha = 1,
  ...
)

scale_colour_iterm(
  palette = iterm_palettes(),
  variant = c("normal", "bright"),
  alpha = 1,
  ...
)

scale_fill_iterm(
  palette = iterm_palettes(),
  variant = c("normal", "bright"),
  alpha = 1,
  ...
)
```

## Arguments

- palette:

  Palette name. See
  [`iterm_palettes()`](https://nanx.me/ggsci/reference/iterm_palettes.md)
  for available options.

- variant:

  Variant of the palette. One of `"normal"`, `"bright"`.

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

- ...:

  Additional parameters for
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

## Details

Preview all available iTerm color palettes in ggsci:
<https://nanx.me/ggsci-iterm/>.

## Examples

``` r
example_scatterplot() + scale_color_iterm("Rose Pine")
#> `geom_smooth()` using formula = 'y ~ x'

example_barplot() + scale_fill_iterm("Rose Pine")
```
