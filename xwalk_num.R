xwalk_num = function(data_input, xwalk, colname){
  tibble = as_tibble(data_input)
  tibble = tibble %>% crosswalk_columns(xwalk, num_crosswalk, colname, unnest_results = TRUE)
  df = as.data.frame(tibble)
  df = df %>%
    rowwise() %>%
    mutate(num_crosswalk_count = sum(!is.na(c_across(starts_with("num_crosswalk"))))) %>%
    ungroup()%>%
    mutate(numcros = case_when(num_crosswalk_count == 0 ~ "0",
                               num_crosswalk_count == 1 ~ "1",
                               num_crosswalk_count == 2 ~ "2",
                               num_crosswalk_count == 3 ~ "3",
                               num_crosswalk_count == 4 ~ "4",
                               num_crosswalk_count == 5 ~ "5",
                               num_crosswalk_count >5 ~ ">5"))
  df$numcros = factor(df$numcros, levels = c("0", "1", "2", "3", "4", "5", ">5"))
  return(df)
}
