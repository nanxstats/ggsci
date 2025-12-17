# Changelog

## ggsci 4.2.0

### Improvements

- Synchronize the iTerm color palettes with upstream
  ([\#75](https://github.com/nanxstats/ggsci/issues/75)).

  This update adds 8 new palettes to
  [`iterm_palettes()`](https://nanx.me/ggsci/reference/iterm_palettes.md):
  branch, No Clown Fiesta variations, novmbr, One Dark Two, owl,
  traffic, and urban. These palettes are now usable by
  [`pal_iterm()`](https://nanx.me/ggsci/reference/pal_iterm.md),
  [`scale_color_iterm()`](https://nanx.me/ggsci/reference/scale_iterm.md),
  and
  [`scale_fill_iterm()`](https://nanx.me/ggsci/reference/scale_iterm.md).

## ggsci 4.1.0

CRAN release: 2025-10-25

### Improvements

- Synchronize the iTerm color palettes with upstream
  ([\#72](https://github.com/nanxstats/ggsci/issues/72)).

  This update adds 8 new palettes to
  [`iterm_palettes()`](https://nanx.me/ggsci/reference/iterm_palettes.md):
  Hot Dog Stand variations, Matte Black, Poimandres variations, and
  Selenized Black. These palettes are now usable by
  [`pal_iterm()`](https://nanx.me/ggsci/reference/pal_iterm.md),
  [`scale_color_iterm()`](https://nanx.me/ggsci/reference/scale_iterm.md),
  and
  [`scale_fill_iterm()`](https://nanx.me/ggsci/reference/scale_iterm.md).

  Additionally, the color values for 40+ existing iTerm palettes have
  been updated to match the latest upstream color specifications.

### Documentation

- Add the [ggsci iterm palettes microsite](https://nanx.me/ggsci-iterm/)
  link to [`vignette("ggsci")`](https://nanx.me/ggsci/articles/ggsci.md)
  ([\#70](https://github.com/nanxstats/ggsci/issues/70)). This microsite
  helps users preview all iTerm color palettes available in ggsci.

## ggsci 4.0.0

CRAN release: 2025-09-23

### New features

- Add the Primer design system (from GitHub) palette in
  [`scale_color_primer()`](https://nanx.me/ggsci/reference/scale_primer.md)
  and
  [`scale_fill_primer()`](https://nanx.me/ggsci/reference/scale_primer.md)
  ([\#62](https://github.com/nanxstats/ggsci/issues/62),
  [\#63](https://github.com/nanxstats/ggsci/issues/63)).
- Add the Atlassian Design System palette in
  [`scale_color_atlassian()`](https://nanx.me/ggsci/reference/scale_atlassian.md)
  and
  [`scale_fill_atlassian()`](https://nanx.me/ggsci/reference/scale_atlassian.md)
  ([\#64](https://github.com/nanxstats/ggsci/issues/64)).
- Add 400+ iTerm palettes in
  [`scale_color_iterm()`](https://nanx.me/ggsci/reference/scale_iterm.md)
  and
  [`scale_fill_iterm()`](https://nanx.me/ggsci/reference/scale_iterm.md)
  ([\#67](https://github.com/nanxstats/ggsci/issues/67)).

### Improvements

- Add
  [`example_scatterplot()`](https://nanx.me/ggsci/reference/example_plots.md)
  and
  [`example_barplot()`](https://nanx.me/ggsci/reference/example_plots.md)
  to simplify discrete scale examples in documentation. This reduces
  boilerplate code and makes it easier to maintain the examples. Also
  improves graphical appearance of the examples by using a minimalist
  theme with alternative data subsets
  ([\#61](https://github.com/nanxstats/ggsci/issues/61)).

### Maintenance

- Refactor the logo generation script from an R script to a shell script
  and move it into `tools/`
  ([\#66](https://github.com/nanxstats/ggsci/issues/66)).
- Use standard static imports workflow
  ([\#58](https://github.com/nanxstats/ggsci/issues/58)).

## ggsci 3.2.0

CRAN release: 2024-06-17

### New features

- Add the Observable 10 palette in
  [`scale_color_observable()`](https://nanx.me/ggsci/reference/scale_observable.md)
  and
  [`scale_fill_observable()`](https://nanx.me/ggsci/reference/scale_observable.md)
  ([\#41](https://github.com/nanxstats/ggsci/issues/41)).
- Add Bootstrap 5 color palettes (continuous) in
  [`scale_color_bs5()`](https://nanx.me/ggsci/reference/scale_bs5.md)
  and [`scale_fill_bs5()`](https://nanx.me/ggsci/reference/scale_bs5.md)
  ([\#18](https://github.com/nanxstats/ggsci/issues/18)).
- Add Tailwind CSS color palettes (continuous) in
  [`scale_color_tw3()`](https://nanx.me/ggsci/reference/scale_tw3.md)
  and [`scale_fill_tw3()`](https://nanx.me/ggsci/reference/scale_tw3.md)
  ([\#19](https://github.com/nanxstats/ggsci/issues/19)).

### Improvements

- Move internal color palette data from `R/sysdata.rda` to
  `R/palettes.R`. This change enhances package development transparency,
  reduces unnecessary indirection, and simplifies contributions by
  avoiding the construction of the palette data using the R script in
  `data-raw/` ([\#42](https://github.com/nanxstats/ggsci/issues/42)).
- For continuous palette examples, remove the reshape2 dependency and
  use more compact grid layout to reduce output image size
  ([\#45](https://github.com/nanxstats/ggsci/issues/45)).

## ggsci 3.1.0

CRAN release: 2024-05-21

### New features

- The BMJ color palettes are implemented in
  [`scale_color_bmj()`](https://nanx.me/ggsci/reference/scale_bmj.md)
  and [`scale_fill_bmj()`](https://nanx.me/ggsci/reference/scale_bmj.md)
  (thanks, [@huichen99](https://github.com/huichen99),
  [\#32](https://github.com/nanxstats/ggsci/issues/32)).

### Documentation

- Convert Rd syntax to Markdown in roxygen2 documentation. This
  simplifies documentation formatting and makes it much easier to add
  new color scales for contributors
  ([\#35](https://github.com/nanxstats/ggsci/issues/35)).

## ggsci 3.0.3

CRAN release: 2024-03-25

### Improvements

- Detect ggplot2 version at runtime to determine if the argument
  `scale_name` is needed for all
  [`discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
  calls. This ensures ggsci always works regardless of the ggplot2
  version installed (thanks,
  [@flyingicedragon](https://github.com/flyingicedragon),
  [\#29](https://github.com/nanxstats/ggsci/issues/29)).

## ggsci 3.0.2

CRAN release: 2024-03-18

### Improvements

- Remove `scale_name` from all
  [`discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
  calls because the argument has been deprecated in ggplot2 3.5.0
  (thanks, [@DanChaltiel](https://github.com/DanChaltiel),
  [\#25](https://github.com/nanxstats/ggsci/issues/25)).

## ggsci 3.0.1

CRAN release: 2024-03-02

### Improvements

- Expand the FAQ vignette to include a solution for [customizing color
  selection and ordering in a
  palette](https://nanx.me/ggsci/articles/ggsci-faq.html#customize-color-ordering-in-a-palette)
  with self-defined color scale functions
  ([\#23](https://github.com/nanxstats/ggsci/issues/23)).
- Fix “lost braces” check notes on r-devel by using Unicode characters
  (<nanxstats/ggsci@a91faf1>).

## ggsci 3.0.0

CRAN release: 2023-03-08

### New features

- Added three Flat UI color palettes in
  - [`scale_color_flatui()`](https://nanx.me/ggsci/reference/scale_flatui.md)
  - [`scale_fill_flatui()`](https://nanx.me/ggsci/reference/scale_flatui.md)

  and one color palette inspired by the logo of frontiers.org in
  - [`scale_color_frontiers()`](https://nanx.me/ggsci/reference/scale_frontiers.md)
  - [`scale_fill_frontiers()`](https://nanx.me/ggsci/reference/scale_frontiers.md)
    (thanks, [@clarajegousse](https://github.com/clarajegousse),
    [\#14](https://github.com/nanxstats/ggsci/issues/14)).
- Added three COSMIC color palettes in
  - [`scale_color_cosmic()`](https://nanx.me/ggsci/reference/scale_cosmic.md)
  - [`scale_fill_cosmic()`](https://nanx.me/ggsci/reference/scale_cosmic.md)

  (thanks, [@jhrcook](https://github.com/jhrcook),
  [\#5](https://github.com/nanxstats/ggsci/issues/5),
  [\#7](https://github.com/nanxstats/ggsci/issues/7)).

### Improvements

- Use a proper, three-component version number following Semantic
  Versioning.
- Reduce output figure size in vignettes and `README.Rmd` by switching
  to the ragg PNG device and using pngquant for compression.
- Added a new vignette on frequently asked questions.
  - A simple solution to interpolate the color palettes when the data
    has more categories than the number of colors in a discrete color
    scale.
  - A note on using a color scale consistently for multiple ggplot2
    plots by setting global options (thanks,
    [@DanChaltiel](https://github.com/DanChaltiel),
    [\#13](https://github.com/nanxstats/ggsci/issues/13)).
- Replace `size` with `linewidth` in code examples for ggplot2 \>=
  3.4.0.
- Replaced the previous logo with a new hex sticker logo.
- Replaced previous CI/CD solutions with GitHub Actions workflows.
- Fixed broken or moved links in function documentation and vignettes.
- Removed the `LazyData` field from `DESCRIPTION`.

## ggsci 2.9

CRAN release: 2018-05-14

### Improvements

- New URL for the documentation website: <https://nanx.me/ggsci/>.

## ggsci 2.8

CRAN release: 2017-09-30

### Improvements

- Use system font stack instead of Google Fonts in vignettes to avoid
  pandoc SSL issue.

## ggsci 2.7

CRAN release: 2017-06-12

### New features

Two new discrete color palettes:

- JAMA
- Tron Legacy

One new collection of continuous palettes with 19 color options:

- Material Design

## ggsci 2.4

CRAN release: 2017-03-08

### New features

Four new discrete color palettes:

- NEJM
- LocusZoom
- IGV
- Star Trek

## ggsci 2.0

CRAN release: 2016-11-21

### New features

Two new discrete color palettes:

- D3.js (v3)
- Futurama (Planet Express)

The first continuous color palette:

- GSEA GenePattern

## ggsci 1.0

### New features

Eight discrete color palettes (2016-04-01):

- NPG
- AAAS
- Lancet
- JCO
- UCSCGB
- UChicago
- The Simpsons (Springfield)
- Rick and Morty (Schwifty)
