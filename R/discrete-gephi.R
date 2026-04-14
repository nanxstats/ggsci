#' Gephi generative palette names
#'
#' @return Character vector of Gephi generative palette identifiers.
#'
#' @export gephi_palettes
#'
#' @examples
#' gephi_palettes()
gephi_palettes <- function() {
  names(ggsci_db$"gephi"$"presets")
}

#' Gephi color palettes
#'
#' Generative discrete color palettes adapted from the palette engine in Gephi.
#' These palettes are designed to generate visually distinct colors for an
#' arbitrary number of categories.
#'
#' @details
#' The Gephi palette generator uses the current R random number state directly.
#' Call [base::set.seed()] before creating a palette or scale if you need
#' reproducible results. To isolate RNG side effects, consider
#' `withr::with_seed()`.
#'
#' @param palette Palette type. See [gephi_palettes()] for available options.
#' @param alpha Transparency level, a real number in (0, 1].
#'   See `alpha` in [grDevices::rgb()] for details.
#'
#' @export pal_gephi
#'
#' @importFrom grDevices col2rgb rgb
#'
#' @examples
#' library("scales")
#' show_col(pal_gephi("default")(10))
#' set.seed(42)
#' show_col(pal_gephi("fancy_light")(20))
pal_gephi <- function(palette = gephi_palettes(), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L || alpha <= 0L) stop("alpha must be in (0, 1]")

  filter <- ggsci_db$"gephi"$"presets"[[palette]]$"filter"

  function(n) {
    n <- as.integer(n)[1L]

    if (is.na(n) || n < 0L) stop("n must be a non-negative integer")
    if (n == 0L) {
      return(character())
    }

    raw_cols <- gephi_generate_palette(
      colors_count = n,
      quality = gephi_generate_palette_quality(n),
      filter = filter
    )
    gephi_add_alpha(raw_cols, alpha)
  }
}

#' Gephi color scales
#'
#' See [pal_gephi()] for details.
#'
#' @inheritParams pal_gephi
#' @param ... Additional parameters for [ggplot2::discrete_scale()].
#'
#' @export scale_color_gephi
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @rdname scale_gephi
#'
#' @examples
#' set.seed(42)
#' example_scatterplot() + scale_color_gephi()
#' set.seed(42)
#' example_barplot() + scale_fill_gephi("fancy_light")
scale_color_gephi <- function(palette = gephi_palettes(), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("colour", palette = pal_gephi(palette, alpha), ...)
  } else {
    discrete_scale("colour", scale_name = "gephi", palette = pal_gephi(palette, alpha), ...)
  }
}

#' @export scale_colour_gephi
#' @rdname scale_gephi
scale_colour_gephi <- scale_color_gephi

#' @export scale_fill_gephi
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_gephi
scale_fill_gephi <- function(palette = gephi_palettes(), alpha = 1, ...) {
  palette <- match.arg(palette)
  if (is_ggplot2_350()) {
    discrete_scale("fill", palette = pal_gephi(palette, alpha), ...)
  } else {
    discrete_scale("fill", scale_name = "gephi", palette = pal_gephi(palette, alpha), ...)
  }
}

gephi_add_alpha <- function(cols, alpha) {
  if (!length(cols)) {
    return(character())
  }

  cols_rgb <- col2rgb(cols)
  rgb(
    cols_rgb[1L, ], cols_rgb[2L, ], cols_rgb[3L, ],
    alpha = alpha * 255L, maxColorValue = 255L
  )
}

gephi_generate_palette_quality <- function(colors_count) {
  quality <- 50L

  if (colors_count > 300L) {
    quality <- 2L
  } else if (colors_count > 200L) {
    quality <- 5L
  } else if (colors_count > 100L) {
    quality <- 10L
  } else if (colors_count > 50L) {
    quality <- 25L
  }

  quality
}

gephi_generate_palette <- function(colors_count, quality, filter) {
  k_means <- gephi_generate_random_kmeans(colors_count, filter)
  color_samples <- gephi_color_samples(filter)
  samples_closest <- integer(nrow(color_samples))

  for (step in seq_len(quality)) {
    min_distance <- rep(Inf, nrow(color_samples))

    for (j in seq_len(nrow(k_means))) {
      distance <- gephi_distance_sq(color_samples, k_means[j, ])
      update <- distance < min_distance
      min_distance[update] <- distance[update]
      samples_closest[update] <- j
    }

    free_color_samples <- color_samples

    for (j in seq_len(nrow(k_means))) {
      assigned <- samples_closest == j
      if (any(assigned)) {
        candidate_k_mean <- colMeans(color_samples[assigned, , drop = FALSE])
      } else {
        candidate_k_mean <- c(0, 0, 0)
      }

      if (any(assigned) && gephi_check_color(candidate_k_mean, filter)) {
        k_means[j, ] <- candidate_k_mean
      } else if (nrow(free_color_samples) > 0L) {
        k_means[j, ] <- color_samples[gephi_closest_sample(free_color_samples, candidate_k_mean), ]
      } else {
        k_means[j, ] <- color_samples[gephi_closest_sample(color_samples, candidate_k_mean), ]
      }

      if (nrow(free_color_samples) > 0L) {
        keep <- !(
          free_color_samples[, 1L] == k_means[j, 1L] &
            free_color_samples[, 2L] == k_means[j, 2L] &
            free_color_samples[, 3L] == k_means[j, 3L]
        )
        free_color_samples <- free_color_samples[keep, , drop = FALSE]
      }
    }
  }

  k_means <- gephi_sort_colors(k_means)
  vapply(seq_len(nrow(k_means)), function(i) gephi_lab_to_hex(k_means[i, ]), character(1L))
}

gephi_generate_random_kmeans <- function(colors_count, filter) {
  k_means <- matrix(NA_real_, nrow = colors_count, ncol = 3L)

  for (i in seq_len(colors_count)) {
    lab <- c(stats::runif(1L), 2 * stats::runif(1L) - 1, 2 * stats::runif(1L) - 1)
    while (!gephi_check_color(lab, filter)) {
      lab <- c(stats::runif(1L), 2 * stats::runif(1L) - 1, 2 * stats::runif(1L) - 1)
    }
    k_means[i, ] <- lab
  }

  k_means
}

gephi_color_samples <- function(filter) {
  samples <- as.matrix(expand.grid(
    l = seq(0, 1, by = 0.05),
    a = seq(-1, 1, by = 0.1),
    b = seq(-1, 1, by = 0.1)
  ))

  valid <- apply(samples, 1L, gephi_check_color, filter = filter)
  samples[valid, , drop = FALSE]
}

gephi_closest_sample <- function(samples, target) {
  which.min(gephi_distance_sq(samples, target))
}

gephi_distance_sq <- function(samples, target) {
  rowSums((samples - matrix(target, nrow = nrow(samples), ncol = 3L, byrow = TRUE))^2)
}

gephi_sort_colors <- function(colors) {
  if (nrow(colors) <= 1L) {
    return(colors)
  }

  remaining <- seq_len(nrow(colors))
  sorted <- remaining[1L]
  remaining <- remaining[-1L]

  while (length(remaining) > 0L) {
    distances <- vapply(
      remaining,
      function(candidate) {
        min(vapply(
          sorted,
          function(current) {
            sum((colors[candidate, ] - colors[current, ])^2)
          },
          numeric(1L)
        ))
      },
      numeric(1L)
    )

    next_color <- remaining[which.max(distances)[1L]]
    sorted <- c(sorted, next_color)
    remaining <- remaining[remaining != next_color]
  }

  colors[sorted, , drop = FALSE]
}

gephi_check_color <- function(lab, filter) {
  rgb <- gephi_lab_to_rgb(lab)
  hcl <- gephi_lab_to_hcl(lab)

  hue_ok <- if (filter[1L] < filter[2L]) {
    hcl[1L] >= filter[1L] && hcl[1L] <= filter[2L]
  } else {
    hcl[1L] >= filter[1L] || hcl[1L] <= filter[2L]
  }

  !anyNA(rgb) &&
    all(rgb >= 0) &&
    all(rgb < 256) &&
    hue_ok &&
    hcl[2L] >= filter[3L] &&
    hcl[2L] <= filter[4L] &&
    hcl[3L] >= filter[5L] &&
    hcl[3L] <= filter[6L]
}

gephi_lab_to_hex <- function(lab) {
  rgb <- gephi_lab_to_rgb(lab)
  grDevices::rgb(rgb[1L], rgb[2L], rgb[3L], maxColorValue = 255L)
}

gephi_lab_to_rgb <- function(lab) {
  xyz <- gephi_lab_to_xyz(lab)
  gephi_xyz_to_rgb(xyz)
}

gephi_lab_to_xyz <- function(lab) {
  sl <- (lab[1L] + 0.16) / 1.16
  illuminant <- c(0.96421, 1, 0.82519)
  y <- illuminant[2L] * gephi_finv(sl)
  x <- illuminant[1L] * gephi_finv(sl + (lab[2L] / 5))
  z <- illuminant[3L] * gephi_finv(sl - (lab[3L] / 2))
  c(x, y, z)
}

gephi_xyz_to_rgb <- function(xyz) {
  rl <- 3.2406 * xyz[1L] - 1.5372 * xyz[2L] - 0.4986 * xyz[3L]
  gl <- -0.9689 * xyz[1L] + 1.8758 * xyz[2L] + 0.0415 * xyz[3L]
  bl <- 0.0557 * xyz[1L] - 0.204 * xyz[2L] + 1.057 * xyz[3L]

  clip <- min(rl, gl, bl) < -0.001 || max(rl, gl, bl) > 1.001
  if (clip) {
    rl <- min(max(rl, 0), 1)
    gl <- min(max(gl, 0), 1)
    bl <- min(max(bl, 0), 1)
  }

  c(
    round(255 * gephi_correct1(rl)),
    round(255 * gephi_correct1(gl)),
    round(255 * gephi_correct1(bl))
  )
}

gephi_lab_to_hcl <- function(lab) {
  luminance <- (lab[1L] - 0.09) / 0.61
  radius <- sqrt(lab[2L]^2 + lab[3L]^2)
  chroma <- radius / (luminance * 0.311 + 0.125)
  tau <- 6.283185307179586
  angle <- atan2(lab[2L], lab[3L])
  hue <- ((tau / 6 - angle) / tau) * 360

  if (hue < 0) {
    hue <- hue + 360
  }

  c(hue, chroma, luminance)
}

gephi_finv <- function(t) {
  if (t > (6 / 29)) {
    t^3
  } else {
    3 * (6 / 29)^2 * (t - 4 / 29)
  }
}

gephi_correct1 <- function(cl) {
  a <- 0.055
  if (cl <= 0.0031308) {
    12.92 * cl
  } else {
    (1 + a) * cl^(1 / 2.4) - a
  }
}
