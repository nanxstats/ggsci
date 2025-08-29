# @staticimports pkg:staticimports
#  is_installed

#' Check if the installed ggplot2 is newer than 3.5.0
#' @noRd
is_ggplot2_350 <- function() is_installed("ggplot2", version = "3.5.0")
