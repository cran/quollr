## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE
)

## ----setup--------------------------------------------------------------------
library(quollr)
library(dplyr)
library(ggplot2)
library(patchwork)

set.seed(20240110)

## -----------------------------------------------------------------------------
design <- gen_design(n_right = 4, ncol_right = 2)

## ----fig.alt="RMSE Vs binw idths.", fig.height=10, fig.width=15, out.width="100%"----

plot_rmse_layouts(plots = scurve_plts, design = design)

