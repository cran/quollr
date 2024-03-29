% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/2d.R
\name{hex_binning}
\alias{hex_binning}
\title{Hexagonal binning}
\usage{
hex_binning(
  data,
  x,
  y,
  num_bins_x,
  num_bins_y,
  x_start = NA,
  y_start = NA,
  buffer_x = NA,
  buffer_y = NA,
  hex_size = NA,
  col_start
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

\item{col_start}{The text that begins the column name of x and y axes of data.}
}
\value{
A list contains all hexagonal bin centroids (centroids),
hexagonal coordinates of the full grid(hex_poly),
2D embeddings with corresponding hexagon IDs (data_hb_id),
hex bins with their corresponding standardise counts (std_cts),
total number of hex bins(tot_bins), number of non-empty hex bins (non_bins)
and points within each hexagon (pts_bins).
}
\description{
This function generates a list which contains hexagonal binning information.
}
\examples{
num_bins_list <- calc_bins(data = s_curve_noise_umap_scaled, x = "UMAP1",
y = "UMAP2", hex_size = NA, buffer_x = NA, buffer_y = NA)
num_bins_x <- num_bins_list$num_x
num_bins_y <- num_bins_list$num_y
hex_binning(data = s_curve_noise_umap_scaled,
x = "UMAP1", y = "UMAP2", num_bins_x = num_bins_x,
num_bins_y = num_bins_y, x_start = NA, y_start = NA, buffer_x = NA,
buffer_y = NA, hex_size = NA, col_start = "UMAP")

}
