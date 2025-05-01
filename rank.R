rank <- function(soccer, coder, nomatch = 11) {
  soccer %>% 
    right_join(select(coder, c(Id, soc2010_coder, row_id)), by = "Id") %>%
    nest(
      soc2010_soccer = matches("soc2010_\\d+"),
      score = matches("score_\\d+"),
      title = matches("title_\\d+")) %>%
    mutate(
      soc2010_soccer = map(soc2010_soccer, \(x) as.vector(unlist(x))),
      title = map(title, \(x) as.vector(unlist(x))),
      score = map(score, \(x) as.vector(unlist(x))),
      # Use map2 instead of map2_int to handle vectors properly
      rank = map2_int(soc2010_coder, soc2010_soccer, \(x, y) {
        ranks <- match(x, y, nomatch = nomatch)
        if (length(ranks) == 0) nomatch else min(ranks, na.rm = TRUE) # Pick the minimum rank
      }),
      hi_score = map_dbl(score, \(x) x[1]))%>% 
    arrange(Id)
}