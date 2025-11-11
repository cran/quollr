## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE
)

## ----setup--------------------------------------------------------------------
library(quollr)
library(dplyr)
library(ggplot2)

set.seed(20240110)

## -----------------------------------------------------------------------------

error_df_all <- gen_diffbin1_errors(highd_data = scurve, 
                                    nldr_data = scurve_umap)

error_df_all <- error_df_all |>
  mutate(a1 = round(a1, 2)) |>
  filter(b1 >= 5) |>
  group_by(a1) |>
  filter(HBE == min(HBE)) |>
  ungroup()

## -----------------------------------------------------------------------------
error_df_all |>
  arrange(-a1) |>
  head(5)

## ----fig.alt="HBE Vs binwidths."----------------------------------------------
ggplot(error_df_all,
         aes(x = a1,
             y = HBE)) +
    geom_point(size = 0.8) +
    geom_line(linewidth = 0.3) +
    ylab("HBE") +
    xlab(expression(paste("binwidth (", a[1], ")"))) +
    theme_minimal() +
    theme(panel.border = element_rect(fill = 'transparent'),
          plot.title = element_text(size = 12, hjust = 0.5, vjust = -0.5),
          axis.ticks.x = element_line(),
          axis.ticks.y = element_line(),
          legend.position = "none",
          axis.text.x = element_text(size = 7),
          axis.text.y = element_text(size = 7),
          axis.title.x = element_text(size = 7),
          axis.title.y = element_text(size = 7))


