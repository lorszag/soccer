faceted_comp_plot = function(df){
  ggplot(df, aes(x = start_value, y = value)) +
    geom_point(aes(color = factor(shape)), size = 2) +
    geom_smooth(method = "lm", 
                aes(color = factor(shape)), 
                se= FALSE,
                formula = y~x)+
    facet_wrap(~facet_group, 
               scales = "free_y") + 
    scale_color_manual(values = c("cornflowerblue", "maroon"), 
                          labels = c("Without Crosswalk", "With Crosswalk"))+
    scale_x_continuous(name = "Soccer Score (In Intervals)", 
                       breaks = seq(0,1, by = .10)) +
    scale_y_continuous(limit = c(0, 1), breaks = seq(0,1, by = .10), 
                       name = "Percent Agreement")+
    geom_abline(slope = 1, intercept =0, linetype = "dashed")+
    labs(
      shape = "Group Type",
      linetype = "Group Type") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5), legend.title = element_blank())
}