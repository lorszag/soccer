score_diff_df = function(df) {
  df %>%
    mutate(
      score_diff = hi_score - score_1,
      score_bin_diff = factor(case_when(
        score_diff > 0.2  ~ "++",
        score_diff > 0.05 & score_diff <= 0.2  ~ "+",
        score_diff > -0.05 & score_diff <= 0.05  ~ "No change",
        score_diff > -0.2 & score_diff <= -0.05 ~ "-",
        TRUE ~ "--"
      ), levels = c("--", "-", "No change", "+", "++"))
    )
}