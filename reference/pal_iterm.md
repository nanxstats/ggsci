# iTerm color palettes

ANSI terminal color palettes sourced from the iterm2-color-schemes
project. Each theme provides normal and bright variants.

## Usage

``` r
pal_iterm(
  palette = iterm_palettes(),
  variant = c("normal", "bright"),
  alpha = 1
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

## Details

Preview all available iTerm color palettes in ggsci:
<https://nanx.me/ggsci-iterm/>.

## References

<https://github.com/mbadolato/iTerm2-Color-Schemes>

## Examples

``` r
library("scales")
show_col(pal_iterm("Rose Pine")(6))

show_col(pal_iterm("Rose Pine", variant = "bright", alpha = 0.7)(6))
```
