# BMJ color palettes

Color palette from the BMJ living style guide.

## Usage

``` r
pal_bmj(palette = c("default"), alpha = 1)
```

## Arguments

- palette:

  Palette type. Currently there is one available option: `"default"`
  (9-color palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## References

<https://technology.bmj.com/living-style-guide/colour.html>

## Author

Hui Chen \| <huichen@zju.edu.cn>

## Examples

``` r
library("scales")
show_col(pal_bmj("default")(9))

show_col(pal_bmj("default", alpha = 0.6)(9))
```
