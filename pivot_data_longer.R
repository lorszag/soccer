pivot_data_long = function(data){
  data %>%
    pivot_longer(
      cols = -c(interval, start_value),               # Columns to pivot (all except 'interval')
      names_to = "group",             # New column for variable names
      values_to = "value"             # New column for values
    ) %>%
    mutate(
      facet_group = case_when(        # Create a grouping variable for faceting
        grepl("usr", group) ~ "USR",
        grepl("atp", group) ~ "ATP",
        grepl("lymph", group) ~ "Asia Lymph"
      ),
      shape = case_when(              # Assign shapes based on suffix
        grepl("_no_x$", group) ~ 17,  # Triangle shape for groups ending in '_no_x'
        grepl("_x$", group) ~ 19      # Circle shape for groups ending in '_x'
      ))
}