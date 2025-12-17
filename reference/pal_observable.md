# Observable 10 color palette

The Observable 10 palette.

## Usage

``` r
pal_observable(palette = c("observable10"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there is one available option:
  `"observable10"` (10-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## References

Pettiross J (2023). "Crafting data colors and staying on brand."
*Observable blog*. <https://observablehq.com/blog/crafting-data-colors>

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_observable("observable10")(10))

show_col(pal_observable("observable10", alpha = 0.6)(10))
```
