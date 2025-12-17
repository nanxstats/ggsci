# The University of Chicago color palettes

Color palettes based on the colors used by the University of Chicago.

## Usage

``` r
pal_uchicago(palette = c("default", "light", "dark"), alpha = 1)
```

## Arguments

- palette:

  Palette type. There are three available options:

  - `"default"` (9-color palette);

  - `"light"` (9-color light palette);

  - `"dark"` (9-color dark palette).

- alpha:

  Transparency level, a real number in (0, 1\]. See `alpha` in
  [`grDevices::rgb()`](https://rdrr.io/r/grDevices/rgb.html) for
  details.

## References

<https://news.uchicago.edu/sites/default/files/UCM_UniversityIdentityGuidelines_2-2020.pdf>

## Author

Nan Xiao \| <me@nanx.me> \| <https://nanx.me>

## Examples

``` r
library("scales")
show_col(pal_uchicago("default")(9))

show_col(pal_uchicago("light")(9))

show_col(pal_uchicago("dark")(9))
```
