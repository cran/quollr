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
library(ggplot2)
library(tibble)

## -----------------------------------------------------------------------------
num_bins_list <- calc_bins(data = s_curve_noise_umap_scaled, x = "UMAP1", 
                           y = "UMAP2", hex_size = NA, buffer_x = NA, 
                           buffer_y = NA)
num_bins_x <- num_bins_list$num_x
num_bins_y <- num_bins_list$num_y

## -----------------------------------------------------------------------------
hb_obj <- hex_binning(data = s_curve_noise_umap_scaled, x = "UMAP1", y = "UMAP2", 
                      num_bins_x = num_bins_x, num_bins_y = num_bins_y, 
                      x_start = NA, y_start = NA, buffer_x = NA, 
                      buffer_y = NA, hex_size = NA, col_start = "UMAP")

all_centroids_df <- as.data.frame(do.call(cbind, hb_obj$centroids))
counts_df <- as.data.frame(do.call(cbind, hb_obj$std_cts))

## -----------------------------------------------------------------------------
df_bin_centroids <- extract_hexbin_centroids(centroids_df = all_centroids_df,
                                             counts_df = counts_df)
glimpse(df_bin_centroids) 

## -----------------------------------------------------------------------------
benchmark_value_rm_lwd <- stats::quantile(df_bin_centroids$std_counts, 
                probs = c(0,0.25,0.5,0.75,1), names = FALSE)[2]

benchmark_value_rm_lwd

## -----------------------------------------------------------------------------
df_bin_centroids_low <- df_bin_centroids |>
  dplyr::filter(std_counts <= benchmark_value_rm_lwd)

glimpse(df_bin_centroids_low)

## -----------------------------------------------------------------------------
identify_rm_bins <- find_low_dens_hex(df_bin_centroids_all = df_bin_centroids, 
                                      num_bins_x = num_bins_x, 
                                      df_bin_centroids_low = df_bin_centroids_low)
identify_rm_bins

## -----------------------------------------------------------------------------
tr1_object <- tri_bin_centroids(hex_df = df_bin_centroids, x = "c_x", y = "c_y")
str(tr1_object)

## -----------------------------------------------------------------------------
trimesh <- ggplot(df_bin_centroids, aes(x = c_x, y = c_y)) +
  geom_trimesh() +
  coord_equal() +
  xlab(expression(C[x]^{(2)})) + ylab(expression(C[y]^{(2)})) +
  theme(axis.text = element_text(size = 5),
        axis.title = element_text(size = 7))

trimesh

## -----------------------------------------------------------------------------
tr_from_to_df <- gen_edges(tri_object = tr1_object)
glimpse(tr_from_to_df)

## -----------------------------------------------------------------------------
distance_df <- cal_2d_dist(tr_coord_df = tr_from_to_df, start_x = "x_from", 
                           start_y = "y_from", end_x = "x_to", end_y = "y_to", 
                           select_vars = c("from", "to", "distance"))
glimpse(distance_df)

## -----------------------------------------------------------------------------
benchmark <- find_lg_benchmark(distance_edges = distance_df, 
                                  distance_col = "distance")
benchmark

## -----------------------------------------------------------------------------
trimesh_coloured <- vis_lg_mesh(distance_edges = distance_df, 
                                     benchmark_value = 0.75, 
                                     tr_coord_df = tr_from_to_df, 
                                     distance_col = "distance") +
  xlab(expression(C[x]^{(2)})) + ylab(expression(C[y]^{(2)})) +
  theme(axis.text = element_text(size = 5),
        axis.title = element_text(size = 7),
        legend.position = "bottom",
        legend.title = element_blank())

trimesh_coloured

trimesh_removed <- vis_rmlg_mesh(distance_edges = distance_df, 
                                     benchmark_value = 0.75, 
                                     tr_coord_df = tr_from_to_df, 
                                     distance_col = "distance") +
  xlab(expression(C[x]^{(2)})) + ylab(expression(C[y]^{(2)})) +
  theme(axis.text = element_text(size = 5),
        axis.title = element_text(size = 7))

trimesh_removed

## -----------------------------------------------------------------------------
umap_data_with_hb_id <- as.data.frame(do.call(cbind, hb_obj$data_hb_id))
glimpse(umap_data_with_hb_id)

## -----------------------------------------------------------------------------
df_all <- dplyr::bind_cols(s_curve_noise_training |> dplyr::select(-ID), umap_data_with_hb_id)
glimpse(df_all)

## -----------------------------------------------------------------------------
df_bin <- avg_highd_data(data = df_all, col_start = "x")
glimpse(df_bin)

## -----------------------------------------------------------------------------
tour1 <- show_langevitour(df = df_all, df_b = df_bin, 
                          df_b_with_center_data = df_bin_centroids, 
                          benchmark_value = 0.75, 
                          distance_df = distance_df, distance_col = "distance", 
                          use_default_benchmark_val = FALSE, col_start = "x")
tour1



