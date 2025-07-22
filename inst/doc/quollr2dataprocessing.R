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
scaled_umap <- gen_scaled_data(nldr_data = scurve_umap)

glimpse(scaled_umap)

