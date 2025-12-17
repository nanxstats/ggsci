# D3.js color palettes

Color palettes based on the colors used by D3.js.

## Usage

``` r
pal_d3(
  palette = c("category10", "category20", "category20b", "category20c"),
  alpha = 1
)
```

## Arguments

- palette:

  Palette type. There are four available options:

  - `"category10"` (10-color palette).

  - `"category20"` (20-color palette).

  - `"category20b"` (20-color palette).

  - `"category20c"` (20-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## References

<https://github.com/d3/d3-3.x-api-reference/blob/master/Ordinal-Scales.md>

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_d3("category10")(10))

show_col(pal_d3("category20")(20))

show_col(pal_d3("category20b")(20))

show_col(pal_d3("category20c")(20))
```
