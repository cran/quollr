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
library(dplyr)

## ----echo = FALSE-------------------------------------------------------------
num_bins_list <- calc_bins(data = s_curve_noise_umap_scaled, x = "UMAP1",
                             y = "UMAP2", hex_size = NA, buffer_x = NA, buffer_y = NA)
num_bins_x <- num_bins_list$num_x
num_bins_y <- num_bins_list$num_y

## ----echo = FALSE-------------------------------------------------------------
hb_obj <- hex_binning(data = s_curve_noise_umap_scaled, x = "UMAP1", 
                      y = "UMAP2", num_bins_x = num_bins_x, 
                      num_bins_y = num_bins_y, x_start = NA, y_start = NA, 
                      buffer_x = NA, buffer_y = NA, hex_size = NA, col_start = "UMAP")

## -----------------------------------------------------------------------------
## Data set with all possible centroids in the hexagonal grid
all_centroids_df <- as.data.frame(do.call(cbind, hb_obj$centroids))
glimpse(all_centroids_df)

## Generate all coordinates of hexagons
hex_grid <- as.data.frame(do.call(cbind, hb_obj$hex_poly))
glimpse(hex_grid)

## To obtain the standardise counts within hexbins
counts_df <- as.data.frame(do.call(cbind, hb_obj$std_cts))
df_bin_centroids <- extract_hexbin_centroids(centroids_df = all_centroids_df, 
                                             counts_df = counts_df)

## -----------------------------------------------------------------------------
ggplot(data = hex_grid, aes(x = x, y = y)) + 
  geom_polygon(fill = "white", color = "black", aes(group = hex_poly_id)) +
  geom_point(data = all_centroids_df, aes(x = c_x, y = c_y), color = "red") +
  coord_fixed()

## -----------------------------------------------------------------------------
ggplot(data = hex_grid, aes(x = x, y = y)) + 
  geom_polygon(fill = "white", color = "black", aes(group = hex_poly_id)) +
  geom_point(data = all_centroids_df, aes(x = c_x, y = c_y), color = "red") +
  geom_point(data = df_bin_centroids, aes(x = c_x, y = c_y), color = "purple") +
  coord_fixed()

## -----------------------------------------------------------------------------
ggplot(data = hex_grid, aes(x = x, y = y)) + 
  geom_polygon(fill = "white", color = "black", aes(group = hex_poly_id)) +
  geom_point(data = s_curve_noise_umap_scaled, aes(x = UMAP1, y = UMAP2), color = "blue") +
  coord_fixed()

## -----------------------------------------------------------------------------
hex_grid_with_counts <- dplyr::left_join(hex_grid, counts_df, by = c("hex_poly_id" = "hb_id"))

ggplot(data = hex_grid_with_counts, aes(x = x, y = y)) +
  geom_polygon(color = "black", aes(group = hex_poly_id, fill = std_counts)) +
  geom_text(data = all_centroids_df, aes(x = c_x, y = c_y, label = hexID)) +
  scale_fill_viridis_c(direction = -1, na.value = "#ffffff") +
  coord_fixed()

