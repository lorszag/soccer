summarize_df_weighted <- function(df, n, colname, countname) {
  df %>%
    mutate(
      interval = cut(hi_score, breaks = seq(0, 1, length.out = n), include.lowest = TRUE)
    ) %>%
    group_by(interval) %>%  # Group by interval
    summarize(
      colname := mean(rank == 1),  # Compute mean for rank == 1
      countname := n() / nrow(df), # Compute proportion
      .groups = "drop"  # Prevents grouped output warning
    )
}