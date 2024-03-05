# fit_highd_model() works

    Code
      suppressMessages(fit_highd_model(training_data = s_curve_noise_training,
        nldr_df_with_id = s_curve_noise_umap_scaled, x = "UMAP1", y = "UMAP2",
        num_bins_x = NA, num_bins_y = NA, x_start = NA, y_start = NA, buffer_x = NA,
        buffer_y = NA, hex_size = NA, is_rm_lwd_hex = FALSE, benchmark_to_rm_lwd_hex = NA,
        col_start_2d = "UMAP", col_start_highd = "x"))
    Output
      $df_bin
      # A tibble: 10 x 8
         hb_id       x1     x2     x3        x4        x5       x6        x7
         <dbl>    <dbl>  <dbl>  <dbl>     <dbl>     <dbl>    <dbl>     <dbl>
       1     2 -0.637   1.74   -1.76   0.00953  -0.00143  -0.0117  -0.00152 
       2     6 -0.498   0.524  -1.73  -0.000237  0.00234  -0.0297  -0.000242
       3     7  0.294   1.40   -1.88   0.00890  -0.00803  -0.0123  -0.00120 
       4    12  0.309   0.0421 -1.83   0.00656   0.00823   0.00489 -0.00389 
       5    13  0.868   0.747  -0.781 -0.00408   0.000857  0.0248   0.00170 
       6    18  0.357   1.27   -0.169  0.00607   0.00124   0.0152   0.00204 
       7    24 -0.792   1.25    0.514 -0.000777  0.000464  0.00602  0.000371
       8    28 -0.597   1.19    1.77   0.000240 -0.00417  -0.0185  -0.000786
       9    29 -0.00544 0.211   1.92   0.00116   0.00266   0.00949 -0.00209 
      10    34  0.622   1.21    1.64  -0.000560  0.00540  -0.00741 -0.000886
      
      $df_bin_centroids
         hexID       c_x   c_y std_counts
      1      2 0.1732051 -0.15  0.2352941
      2      6 0.0000000  0.15  0.5294118
      3      7 0.3464102  0.15  0.4117647
      4     12 0.1732051  0.45  0.1764706
      5     13 0.5196152  0.45  0.3529412
      6     18 0.6928203  0.75  0.7058824
      7     24 0.8660254  1.05  0.4705882
      8     28 0.6928203  1.35  0.2941176
      9     29 1.0392305  1.35  0.2352941
      10    34 0.8660254  1.65  1.0000000
      

---

    Code
      suppressMessages(fit_highd_model(training_data = s_curve_noise_training,
        nldr_df_with_id = s_curve_noise_umap_scaled, x = "UMAP1", y = "UMAP2",
        num_bins_x = 5, num_bins_y = 8, x_start = NA, y_start = NA, buffer_x = NA,
        buffer_y = NA, hex_size = NA, is_rm_lwd_hex = FALSE, benchmark_to_rm_lwd_hex = NA,
        col_start_2d = "UMAP", col_start_highd = "x"))
    Output
      $df_bin
      # A tibble: 10 x 8
         hb_id       x1     x2     x3        x4        x5       x6        x7
         <dbl>    <dbl>  <dbl>  <dbl>     <dbl>     <dbl>    <dbl>     <dbl>
       1     2 -0.637   1.74   -1.76   0.00953  -0.00143  -0.0117  -0.00152 
       2     6 -0.498   0.524  -1.73  -0.000237  0.00234  -0.0297  -0.000242
       3     7  0.294   1.40   -1.88   0.00890  -0.00803  -0.0123  -0.00120 
       4    12  0.309   0.0421 -1.83   0.00656   0.00823   0.00489 -0.00389 
       5    13  0.868   0.747  -0.781 -0.00408   0.000857  0.0248   0.00170 
       6    18  0.357   1.27   -0.169  0.00607   0.00124   0.0152   0.00204 
       7    24 -0.792   1.25    0.514 -0.000777  0.000464  0.00602  0.000371
       8    28 -0.597   1.19    1.77   0.000240 -0.00417  -0.0185  -0.000786
       9    29 -0.00544 0.211   1.92   0.00116   0.00266   0.00949 -0.00209 
      10    34  0.622   1.21    1.64  -0.000560  0.00540  -0.00741 -0.000886
      
      $df_bin_centroids
         hexID       c_x   c_y std_counts
      1      2 0.1732051 -0.15  0.2352941
      2      6 0.0000000  0.15  0.5294118
      3      7 0.3464102  0.15  0.4117647
      4     12 0.1732051  0.45  0.1764706
      5     13 0.5196152  0.45  0.3529412
      6     18 0.6928203  0.75  0.7058824
      7     24 0.8660254  1.05  0.4705882
      8     28 0.6928203  1.35  0.2941176
      9     29 1.0392305  1.35  0.2352941
      10    34 0.8660254  1.65  1.0000000
      

---

    Code
      suppressMessages(fit_highd_model(training_data = s_curve_noise_training,
        nldr_df_with_id = s_curve_noise_umap_scaled, x = "UMAP1", y = "UMAP2",
        num_bins_x = NA, num_bins_y = NA, x_start = NA, y_start = NA, buffer_x = NA,
        buffer_y = NA, hex_size = NA, is_rm_lwd_hex = TRUE, benchmark_to_rm_lwd_hex = NA,
        col_start_2d = "UMAP", col_start_highd = "x"))
    Output
      $df_bin
      # A tibble: 10 x 8
         hb_id       x1     x2     x3        x4        x5       x6        x7
         <dbl>    <dbl>  <dbl>  <dbl>     <dbl>     <dbl>    <dbl>     <dbl>
       1     2 -0.637   1.74   -1.76   0.00953  -0.00143  -0.0117  -0.00152 
       2     6 -0.498   0.524  -1.73  -0.000237  0.00234  -0.0297  -0.000242
       3     7  0.294   1.40   -1.88   0.00890  -0.00803  -0.0123  -0.00120 
       4    12  0.309   0.0421 -1.83   0.00656   0.00823   0.00489 -0.00389 
       5    13  0.868   0.747  -0.781 -0.00408   0.000857  0.0248   0.00170 
       6    18  0.357   1.27   -0.169  0.00607   0.00124   0.0152   0.00204 
       7    24 -0.792   1.25    0.514 -0.000777  0.000464  0.00602  0.000371
       8    28 -0.597   1.19    1.77   0.000240 -0.00417  -0.0185  -0.000786
       9    29 -0.00544 0.211   1.92   0.00116   0.00266   0.00949 -0.00209 
      10    34  0.622   1.21    1.64  -0.000560  0.00540  -0.00741 -0.000886
      
      $df_bin_centroids
         hexID       c_x   c_y std_counts
      1      2 0.1732051 -0.15  0.2352941
      2      6 0.0000000  0.15  0.5294118
      3      7 0.3464102  0.15  0.4117647
      4     12 0.1732051  0.45  0.1764706
      5     13 0.5196152  0.45  0.3529412
      6     18 0.6928203  0.75  0.7058824
      7     24 0.8660254  1.05  0.4705882
      8     28 0.6928203  1.35  0.2941176
      9     29 1.0392305  1.35  0.2352941
      10    34 0.8660254  1.65  1.0000000
      

---

    Code
      suppressMessages(fit_highd_model(training_data = s_curve_noise_training,
        nldr_df_with_id = s_curve_noise_umap_scaled, x = "UMAP1", y = "UMAP2",
        num_bins_x = NA, num_bins_y = NA, x_start = NA, y_start = NA, buffer_x = NA,
        buffer_y = NA, hex_size = NA, is_rm_lwd_hex = TRUE, benchmark_to_rm_lwd_hex = 0.4,
        col_start_2d = "UMAP", col_start_highd = "x"))
    Output
      $df_bin
      # A tibble: 10 x 8
         hb_id       x1     x2     x3        x4        x5       x6        x7
         <dbl>    <dbl>  <dbl>  <dbl>     <dbl>     <dbl>    <dbl>     <dbl>
       1     2 -0.637   1.74   -1.76   0.00953  -0.00143  -0.0117  -0.00152 
       2     6 -0.498   0.524  -1.73  -0.000237  0.00234  -0.0297  -0.000242
       3     7  0.294   1.40   -1.88   0.00890  -0.00803  -0.0123  -0.00120 
       4    12  0.309   0.0421 -1.83   0.00656   0.00823   0.00489 -0.00389 
       5    13  0.868   0.747  -0.781 -0.00408   0.000857  0.0248   0.00170 
       6    18  0.357   1.27   -0.169  0.00607   0.00124   0.0152   0.00204 
       7    24 -0.792   1.25    0.514 -0.000777  0.000464  0.00602  0.000371
       8    28 -0.597   1.19    1.77   0.000240 -0.00417  -0.0185  -0.000786
       9    29 -0.00544 0.211   1.92   0.00116   0.00266   0.00949 -0.00209 
      10    34  0.622   1.21    1.64  -0.000560  0.00540  -0.00741 -0.000886
      
      $df_bin_centroids
         hexID       c_x   c_y std_counts
      1      2 0.1732051 -0.15  0.2352941
      2      6 0.0000000  0.15  0.5294118
      3      7 0.3464102  0.15  0.4117647
      4     12 0.1732051  0.45  0.1764706
      5     13 0.5196152  0.45  0.3529412
      6     18 0.6928203  0.75  0.7058824
      7     24 0.8660254  1.05  0.4705882
      8     28 0.6928203  1.35  0.2941176
      9     29 1.0392305  1.35  0.2352941
      10    34 0.8660254  1.65  1.0000000
      
