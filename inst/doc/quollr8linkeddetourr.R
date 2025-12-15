## ----include = FALSE----------------------------------------------------------
options(rmarkdown.html_vignette.check_title = FALSE)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE, 
  message = FALSE
)

## -----------------------------------------------------------------------------
library(quollr)
library(plotly)
library(detourr)

## -----------------------------------------------------------------------------
model_obj <- fit_highd_model(
  highd_data = scurve, 
  nldr_data = scurve_umap, 
  b1 = 21, 
  q = 0.1, 
  hd_thresh = 0
)

## -----------------------------------------------------------------------------
df_bin_centroids <- model_obj$model_2d
df_bin <- model_obj$model_highd
trimesh <- model_obj$trimesh_data

model_error <- augment(
  x = model_obj,
  highd_data = scurve
)

## -----------------------------------------------------------------------------
df_exe <- comb_all_data_model(
  highd_data = scurve, 
  nldr_data = scurve_umap, 
  model_highd = df_bin, 
  model_2d = df_bin_centroids
)

## -----------------------------------------------------------------------------
point_colours <- c("#66B2CC", "#FF7755")
point_sizes <- c(0, 1)

shared_df <- crosstalk::SharedData$new(df_exe)

nldr_plt <- plot_ly(
    shared_df,
    x = ~emb1, y = ~emb2,
    type = "scatter",
    mode = "markers",
    marker = list( color = point_colours[1], size = 3, opacity = 0.5),
    hoverinfo = "none"
) |>
    layout(
        width = 300, height = 300,
        xaxis = list(title = "", showgrid = FALSE, zeroline = FALSE, 
                     showticklabels = FALSE, ticks = "", 
                     linecolor = "black", mirror = TRUE
        ),
        yaxis = list(
            title = "", showgrid = FALSE, zeroline = FALSE, 
            showticklabels = FALSE, ticks = "", linecolor = "black", mirror = TRUE
        ),
        margin = list(l = 20, r = 20, t = 20, b = 20),
        dragmode = "select"
    ) |> 
    style(selected = list(marker = list(opacity = 1)), 
          unselected=list(marker=list(opacity=1))) |>
    highlight(on="plotly_selected", off="plotly_deselect") |>
    config(displayModeBar = FALSE)

## -----------------------------------------------------------------------------
detourr_output <- detour(
  shared_df, tour_aes(projection = starts_with("x"), colour = type)
) |>
  tour_path(grand_tour(2), 
                    max_bases=50, fps = 60) |>
  show_scatter(axes = TRUE, size = 0.5, alpha = 0.8, 
               edges = as.matrix(trimesh[, c("from_reindexed", "to_reindexed")]),
               palette = c("#66B2CC", "#FF7755"),
              width = "300px", height = "300px")

## ----eval=FALSE---------------------------------------------------------------
# lndet_link <- crosstalk::bscols(
#   htmltools::div(
#     style = "display: grid; grid-template-columns: 1fr 1fr;",
#     nldr_plt,
#     htmltools::div(style = "margin-top: 20px;", detourr_output)
#   ),
#   device = "xs"
# )
# 
# class(lndet_link) <- c(class(lndet_link), "htmlwidget")
# lndet_link

## -----------------------------------------------------------------------------
df_exe <- comb_all_data_model_error(
  highd_data = scurve, 
  nldr_data = scurve_umap, 
  model_highd = df_bin, 
  model_2d = df_bin_centroids, 
  error_data = model_error
)

shared_df <- crosstalk::SharedData$new(df_exe)

## -----------------------------------------------------------------------------
nldr_plt_n <- plot_ly(
    shared_df,
    x = ~emb1, y = ~emb2,
    type = "scatter",
    mode = "markers",
    marker = list(color = point_colours[1], size = 3, opacity = 0.5),
    hoverinfo = "none"
) |>
    layout(
        width = 250, height = 250,
        xaxis = list(
            title = "", showgrid = FALSE, zeroline = FALSE, 
            showticklabels = FALSE, ticks = "", linecolor = "black", 
            mirror = TRUE
        ),
        yaxis = list(
            title = "", showgrid = FALSE, zeroline = FALSE, 
            showticklabels = FALSE, ticks = "", linecolor = "black",
            mirror = TRUE
        ),
        margin = list(l = 20, r = 20, t = 20, b = 20),
        dragmode = "select"
    ) |> 
    style(selected   = list(marker = list(opacity = 1)), 
          unselected=list(marker=list(opacity=1))) |>
    highlight(on="plotly_selected", off="plotly_deselect") |>
    config(displayModeBar = FALSE)

detourr_output_n <- detour(
  shared_df,
  tour_aes(projection = starts_with("x"), colour = type)
) |>
  tour_path(grand_tour(2), 
                    max_bases=50, fps = 60) |>
  show_scatter(axes = TRUE, size = 0.5, alpha = 0.8, 
               edges = as.matrix(trimesh[, c("from_reindexed", "to_reindexed")]),
               palette = c("#66B2CC", "#FF7755"),
                width = "250px", height = "250px")

## -----------------------------------------------------------------------------
error_plt <- plot_ly(
    shared_df,
    x = ~sqrt_row_wise_total_error, y = ~density,
    type = "scatter",
    mode = "markers",
    marker = list(color = point_colours[1], size = 3, opacity = 0.5),
    hoverinfo = "none"
) |>
    layout(
        width = 250, height = 250,
        xaxis = list(
            title = "", showgrid = FALSE, zeroline = FALSE,
            showticklabels = FALSE, ticks = "", linecolor = "black",
            mirror = TRUE
        ),
        yaxis = list(
            title = "", showgrid = FALSE, zeroline = FALSE,
            showticklabels = FALSE, ticks = "", linecolor = "black",
            mirror = TRUE
        ),
        margin = list(l = 20, r = 20, t = 20, b = 20),
        dragmode = "select"
    ) |> 
    style(selected   = list(marker = list(opacity = 1)), 
          unselected=list(marker=list(opacity=1))) |>
    highlight(on="plotly_selected", off="plotly_deselect") |>
    config(displayModeBar = FALSE)

## ----eval=FALSE---------------------------------------------------------------
# erlndet_link <- crosstalk::bscols(
#   htmltools::div(
#     style = "display: grid; grid-template-columns: 1fr 1fr 1fr;",
#     error_plt, nldr_plt_n,
#     htmltools::div(style = "margin-top: 20px;", detourr_output_n)
#   ),
#   device = "xs"
# )
# 
# class(erlndet_link) <- c(class(erlndet_link), "htmlwidget")
# erlndet_link

