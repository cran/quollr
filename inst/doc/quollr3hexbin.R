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

## -----------------------------------------------------------------------------
hb_obj <- hex_binning(
  nldr_scaled_obj = scurve_model_obj$nldr_scaled_obj, 
  b1 = 21, 
  q = 0.1)

## -----------------------------------------------------------------------------
## Data set with all possible centroids in the hexagonal grid
all_centroids_df <- hb_obj$centroids
glimpse(all_centroids_df)

## Generate all coordinates of hexagons
hex_grid <- hb_obj$hex_poly
glimpse(hex_grid)

## To obtain the standardise counts within hexbins
counts_df <- hb_obj$std_cts
df_bin_centroids <- merge_hexbin_centroids(centroids_data = all_centroids_df, 
                                           counts_data = counts_df)

## ----fig.alt="Grid with hexagon centroids."-----------------------------------
ggplot(data = hex_grid, aes(x = x, y = y)) + 
  geom_polygon(fill = "white", color = "black", aes(group = h)) +
  geom_point(data = all_centroids_df, aes(x = c_x, y = c_y), color = "red") +
  coord_fixed()

## ----fig.alt="Grid with hexagons colored empty bin centroid in red."----------

ggplot(data = hex_grid, aes(x = x, y = y)) + 
  geom_polygon(fill = "white", color = "black", aes(group = h)) +
  geom_point(data = all_centroids_df, aes(x = c_x, y = c_y), color = "red") +
  geom_point(data = df_bin_centroids, aes(x = c_x, y = c_y), color = "purple") + 
  coord_fixed()

## ----fig.alt="Grid with hexagons overlayed data."-----------------------------
umap_scaled <- scurve_model_obj$nldr_scaled_obj$scaled_nldr

ggplot(data = hex_grid, aes(x = x, y = y)) + 
  geom_polygon(fill = "white", color = "black", aes(group = h)) +
  geom_point(data = umap_scaled, aes(x = emb1, y = emb2), color = "blue", alpha = 0.3) +
  coord_fixed()

## ----fig.alt="Grid with hexagons colored with density of points."-------------
hex_grid_with_counts <- left_join(hex_grid, counts_df, by = "h")

ggplot(data = hex_grid_with_counts, aes(x = x, y = y)) +
  geom_polygon(color = "black", aes(group = h, fill = w_h)) +
  scale_fill_viridis_c(direction = -1, na.value = "#ffffff") +
  coord_fixed()

## ----fig.alt="Grid with hexagons."--------------------------------------------
ggplot(data = all_centroids_df, aes(x = c_x, y = c_y)) +
  geom_hexgrid() +
  coord_equal() +
  xlab("x") + ylab("y") +
  theme(axis.text = element_text(size = 5),
        axis.title = element_text(size = 7))


