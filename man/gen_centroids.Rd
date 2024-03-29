% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/2d.R
\name{gen_centroids}
\alias{gen_centroids}
\title{Generate centroid coordinate}
\usage{
gen_centroids(
  data,
  x,
  y,
  num_bins_x,
  num_bins_y,
  x_start = NA,
  y_start = NA,
  buffer_x = NA,
  buffer_y = NA,
  hex_size = NA
)
}
\arguments{
\item{data}{A tibble or data frame.}

\item{x}{The name of the column that contains values along the x-axis.}

\item{y}{The name of the column that contains values along the y-axis.}

\item{num_bins_x}{Number of bins along the x-axis.}

\item{num_bins_y}{Number of bins along the y-axis.}

\item{x_start}{Starting point along the x-axis for hexagonal binning.}

\item{y_start}{Starting point along the y-axis for hexagonal binning.}

\item{buffer_x}{The buffer size along the x-axis.}

\item{buffer_y}{The buffer size along the y-axis.}

\item{hex_size}{A numeric value that initializes the radius of the outer
circle surrounding the hexagon.}
}
\value{
A list contains hexIDs, x and y coordinates (hexID, c_x, c_y respectively)
of all hexagon bin centroids.
}
\description{
This function generates all possible centroids in the hexagonal grid.
}
\examples{
num_bins_list <- calc_bins(data = s_curve_noise_umap_scaled, x = "UMAP1",
y = "UMAP2", hex_size = NA, buffer_x = NA, buffer_y = NA)
num_bins_x <- num_bins_list$num_x
num_bins_y <- num_bins_list$num_y
gen_centroids(data = s_curve_noise_umap_scaled,
x = "UMAP1", y = "UMAP2", num_bins_x = num_bins_x,
num_bins_y = num_bins_y, x_start = NA, y_start = NA, buffer_x = NA,
buffer_y = NA, hex_size = NA)

}
