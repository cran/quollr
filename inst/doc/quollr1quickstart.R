## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(quollr)
library(tibble)

## ----message=FALSE------------------------------------------------------------
model <- fit_highd_model(highd_data = scurve, 
                         nldr_data = scurve_umap, 
                         b1 = 4, q = 0.1, 
                         benchmark_highdens = 5)

## ----message=FALSE------------------------------------------------------------
## 2-D model
glimpse(model$model_2d)

## high-D model
glimpse(model$model_highd)

## wireframe data
glimpse(model$trimesh_data)

## NLDR object
glimpse(model$nldr_obj)

## Hexagonal object
glimpse(model$hb_obj)

