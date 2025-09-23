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
library(ggplot2)

## -----------------------------------------------------------------------------
model <- fit_highd_model(
  highd_data = scurve, 
  nldr_data = scurve_umap, 
  b1 = 21, 
  q = 0.1, 
  hd_thresh = 0
)

df_bin_centroids <- model$model_2d
df_bin <- model$model_highd

## -----------------------------------------------------------------------------
pred_df_training <- predict_emb(
  highd_data = scurve, 
  model_highd = scurve_model_obj$model_highd,
  model_2d = scurve_model_obj$model_2d
)

glimpse(pred_df_training)

## ----fig.alt="UMAP embedding of the S-curve training data with predictions in red."----
umap_scaled <- scurve_model_obj$nldr_scaled_obj$scaled_nldr

umap_scaled |>
  ggplot(aes(x = emb1, y = emb2, label = ID)) +
  geom_point(alpha = 0.5) +
  geom_point(data = pred_df_training, aes(x = pred_emb_1, y = pred_emb_2), 
             color = "red", alpha = 0.5) +
  coord_equal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
    axis.text = element_text(size = 5),
    axis.title = element_text(size = 7)
  )

## -----------------------------------------------------------------------------
glance(
  x = scurve_model_obj,
  highd_data = scurve
)

## -----------------------------------------------------------------------------
augment(
  x = scurve_model_obj,
  highd_data = scurve
) |>
  head(5)

