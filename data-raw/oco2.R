## code to prepare `oco2` dataset goes here
oco2_br <- readr::read_rds("data-raw//oco2_br.rds")
dplyr::glimpse(oco2)

oco2_br |>
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







# protótipo do Wbescrape

url <- "https://gml.noaa.gov/webdata/ccgg/trends/co2/co2_weekly_mlo.txt"
co2_nooa <- read.table(url, skip = 49, h=FALSE)
co2_nooa |> names() <- c("year","month","day","decimal",
                         "CO2_ppm","n_days","year_ago_1","years_ago_10","since_1800")


names(co2_nooa)

co2_nooa <- co2_nooa |>
  dplyr::mutate(
    date = lubridate::make_date(year = year, month = month, day = day)
  )
dplyr::glimpse(co2_nooa)
co2_nooa |>
  dplyr::filter(year >= 2015, year <=2020) |>
  dplyr::mutate(dia = difftime(date,"2014-01-09", units = "days")) |>
  ggplot2::ggplot(ggplot2::aes(x=dia, y=CO2_ppm)) +
  ggplot2::geom_point(shape=21,color="black",fill="gray") +
  ggplot2::geom_line(color="red") +
  ggplot2::geom_smooth(method = "lm") +
  ggpubr::stat_regline_equation(ggplot2::aes(
    label =  paste(..eq.label.., ..rr.label.., sep = "*plain(\",\")~~"))) +
  ggplot2::theme_bw()

library(tidyverse)
atualizar_dados_nooa() %>%
  dplyr::filter(CO2_ppm >= 0) %>%
  ggplot2::ggplot(ggplot2::aes(x= decimal, y=CO2_ppm)) +
  ggplot2::geom_line(color="red") +
  ggplot2::theme_minimal()


url <- "https://gml.noaa.gov/webdata/ccgg/trends/co2/co2_weekly_mlo.txt"
df <- readr::read_table(url, col_names = TRUE) |>
  janitor::clean_names() |>
  dplyr::filter(!stringr::str_detect(number, "#")) |>
  dplyr::select(x) |>
  dplyr::mutate(
    x = stringr::str_squish(x)
  ) |> dplyr::pull(x) |>
  stringr::str_split(" ",simplify = TRUE) |>
  tibble::as_tibble() |>
  dplyr::mutate_if(is.character,as.numeric)

dplyr::glimpse(df)

#### Vamos mexer nos dados de FCO2 do solo
data_set <- read.table("data-raw/Banco_dados_TESE.txt",
                       h=TRUE,
                       sep="\t",
                       na.strings = "NA")
dplyr::glimpse(data_set)
data_fco2 <- data_set

