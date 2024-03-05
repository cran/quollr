## ----include = FALSE----------------------------------------------------------
options(rmarkdown.html_vignette.check_title = FALSE)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE, 
  message = FALSE
)

## ----setup--------------------------------------------------------------------
library(quollr)
library(dplyr)

## -----------------------------------------------------------------------------
scaled_umap <- gen_scaled_data(data = s_curve_noise_umap, x = "UMAP1", y = "UMAP2", 
                hex_ratio = NA)

glimpse(scaled_umap)

