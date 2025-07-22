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
library(dplyr)
library(stats)

## -----------------------------------------------------------------------------
## To pre-process the data
nldr_obj <- gen_scaled_data(nldr_data = scurve_umap)

## Obtain the hexbin object
hb_obj <- hex_binning(nldr_obj = nldr_obj, b1 = 15, q = 0.1)

all_centroids_df <- hb_obj$centroids
counts_df <- hb_obj$std_cts

## -----------------------------------------------------------------------------
## To extract all bin centroids with bin counts
df_bin_centroids <- extract_hexbin_centroids(centroids_data = all_centroids_df,
                                             counts_data = counts_df)

benchmark_highdens <- 0

## To extract high-densed bins
model_2d <- df_bin_centroids |>
  dplyr::filter(n_h > benchmark_highdens)

glimpse(model_2d) 

## -----------------------------------------------------------------------------
## Wireframe
tr_object <- tri_bin_centroids(centroids_data = df_bin_centroids)
str(tr_object)

## -----------------------------------------------------------------------------
trimesh_data <- gen_edges(tri_object = tr_object, a1 = hb_obj$a1) |>
  dplyr::filter(from_count > benchmark_highdens,
                to_count > benchmark_highdens)

## Update the edge indexes to start from 1
trimesh_data <- update_trimesh_index(trimesh_data)
glimpse(trimesh_data)

## ----fig.alt="Triangular mesh."-----------------------------------------------
trimesh <- ggplot(model_2d, aes(x = c_x, y = c_y)) +
  geom_trimesh() +
  coord_equal() +
  xlab(expression(C[x]^{(2)})) + ylab(expression(C[y]^{(2)})) +
  theme(axis.text = element_text(size = 5),
        axis.title = element_text(size = 7))

trimesh

## -----------------------------------------------------------------------------
nldr_df_with_hex_id <- hb_obj$data_hb_id
glimpse(nldr_df_with_hex_id)

## -----------------------------------------------------------------------------
model_highd <- avg_highd_data(highd_data = scurve, scaled_nldr_hexid = nldr_df_with_hex_id)

model_highd <- model_highd |>
  dplyr::filter(h %in% model_2d$h)

glimpse(model_highd)

## -----------------------------------------------------------------------------
df_exe <- comb_data_model(highd_data = scurve, 
                          model_highd = model_highd, 
                          model_2d = model_2d)


## -----------------------------------------------------------------------------
tour1 <- show_langevitour(point_data = df_exe, edge_data = trimesh_data)

tour1

