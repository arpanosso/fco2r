## code to prepare `oco2` dataset goes here
oco2 <- readr::read_rds("C://GitHub//fco2r//data-raw//oco2.rds")
dplyr::glimpse(oco2)

oco2 |>
  dplyr::sample_n(1000) |>
  ggplot2::ggplot(ggplot2::aes(x=longitude, y=latitude)) +
  ggplot2::geom_point()

mapa <- geobr::read_state(showProgress = FALSE)

get_contorno <- function(indice, lista){
  obj <- lista |> purrr::pluck(indice) |> as.matrix() |>
    as.data.frame()
  return(obj)
}
contorno <- purrr::map_dfr(1:27, get_contorno, lista=mapa$geom) |>
  dplyr::filter(V1 < -33) |>
  dplyr::filter(!(V1 < -38.5 & V1 > -39 & V2>-20 & V2 < -16))

names(contorno) <- c("X","Y")
plot(contorno)

# usethis::use_data(oco2, overwrite = TRUE)

require(tidyverse)

oco2 |>
  dplyr::sample_n(1000) |>
  mutate(flag = def_pol(longitude, latitude, contorno)) |>
  filter(flag) |>
  ggplot2::ggplot(ggplot2::aes(x=longitude, y=latitude)) +
  ggplot2::geom_point()
