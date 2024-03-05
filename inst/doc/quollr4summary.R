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
model <- fit_highd_model(training_data = s_curve_noise_training, x = "UMAP1", 
                         y = "UMAP2", nldr_df_with_id = s_curve_noise_umap_scaled, 
                         col_start_2d = "UMAP", col_start_highd = "x")
df_bin_centroids <- model$df_bin_centroids
df_bin <- model$df_bin

## -----------------------------------------------------------------------------
pred_emb_list_training <- predict_emb(test_data = s_curve_noise_training, 
                             df_bin_centroids = df_bin_centroids, 
                             df_bin = df_bin, type_NLDR = "UMAP")
pred_df_training <- as.data.frame(do.call(cbind, pred_emb_list_training))
glimpse(pred_df_training)

## -----------------------------------------------------------------------------
s_curve_noise_umap_scaled |>
    ggplot(aes(x = UMAP1,
               y = UMAP2,
               label = ID))+
    geom_point(alpha=0.5) +
    geom_point(data = pred_df_training, aes(x = pred_UMAP_1, y = pred_UMAP_2), 
               color = "red", alpha=0.5) +
    coord_equal() +
    theme(plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
          axis.text = element_text(size = 5),
          axis.title = element_text(size = 7))

## -----------------------------------------------------------------------------
gen_summary(test_data = s_curve_noise_training, prediction_df = pred_df_training,
df_bin = df_bin, col_start = "x")

## -----------------------------------------------------------------------------
pred_emb_list_test <- predict_emb(test_data = s_curve_noise_test, 
                             df_bin_centroids = df_bin_centroids, 
                             df_bin = df_bin, type_NLDR = "UMAP")
pred_df_test <- as.data.frame(do.call(cbind, pred_emb_list_test))

## -----------------------------------------------------------------------------
s_curve_noise_umap_scaled |>
    ggplot(aes(x = UMAP1,
               y = UMAP2,
               label = ID))+
    geom_point(alpha=0.5) +
    geom_point(data = pred_df_test, aes(x = pred_UMAP_1, y = pred_UMAP_2), 
               color = "red", alpha=0.5) +
    coord_equal() +
    theme(plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
          axis.text = element_text(size = 5),
          axis.title = element_text(size = 7))

## -----------------------------------------------------------------------------
gen_summary(test_data = s_curve_noise_test, prediction_df = pred_df_test,
df_bin = df_bin, col_start = "x")

