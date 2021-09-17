## code to prepare `oco2` dataset goes here
oco2 <- readr::read_rds("C://GitHub//fco2r//data-raw//oco2.rds")
dplyr::glimpse(oco2)

# usethis::use_data(oco2, overwrite = TRUE)
