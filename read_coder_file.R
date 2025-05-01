read_coder_file = function(file){
  read_csv(file, show_col_types = FALSE) %>%
    filter(is_valid_6digit_soc2010(soc2010_1)) %>%
    mutate(
      Id=paste0(str_pad(Id,5,"left","0")),
      soc2010_coder = pmap(list(soc2010_1, soc2010_2, soc2010_3), ~ c(..1, ..2, ..3)),
      row_id = row_number())
}