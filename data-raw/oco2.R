## code to prepare `oco2` dataset goes here
oco2_br <- readr::read_rds("C://GitHub//fco2r//data-raw//oco2_br.rds")
dplyr::glimpse(oco2)

oco2 |>
  dplyr::sample_n(20000) |>
  ggplot2::ggplot(ggplot2::aes(x=longitude, y=latitude)) +
  ggplot2::geom_point()

mapa <- geobr::read_country(showProgress = FALSE)

get_contorno <- function(indice, lista){
  obj <- lista |> purrr::pluck(indice) |> as.matrix() |>
    as.data.frame()
  return(obj)
}
contorno <- purrr::map_dfr(1:27, get_contorno, lista=mapa$geom)




typeof(contorno)
plot(contorno)

# usethis::use_data(oco2, overwrite = TRUE)

contorno_br <- mapa$geom |> purrr::pluck(1) |> as.matrix()
contorno_br <- contorno_br[contorno_br[,1]< -33,]
contorno_br <- contorno_br[

 !(contorno_br[,1] < -38.5 & contorno_br[,1] > -39 & contorno_br[,2]>-20 & contorno_br[,2] < -16) ,

                           ]

plot(contorno_br)
regiao <- geobr::read_region(showProgress = FALSE)
pol_nordeste <- regiao$geom |> purrr::pluck(2) |> as.matrix()
pol_nordeste <- pol_nordeste[pol_nordeste[,1]<=-34,]
pol_nordeste <- pol_nordeste[!((pol_nordeste[,1]>=-38.7 & pol_nordeste[,1]<=-38.6) & pol_nordeste[,2]<= -15),]

oco2 <- oco2 |>
  mutate(flag = def_pol(longitude, latitude, contorno_br),
         flag2 = def_pol(longitude, latitude, pol_nordeste)) |>
  filter(flag|flag2) |>
  select(-flag, -flag2)


readr::write_rds(oco2,"data-raw/oco2_br.rds")
