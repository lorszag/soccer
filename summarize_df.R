summarize_df = function(df, n, colname){
  df %>%
    mutate(
      interval = cut(hi_score, breaks = seq(0, 1, length.out = n), include.lowest = TRUE) # Create intervals
    ) %>%
    group_by(interval) %>% # Group by interval
    summarize(colname = mean(rank == 1))%>%
    pull(colname)
}