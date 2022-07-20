## tratar o oco2.rds para transformar no oco2_br.rds
oco2 <- readr::read_rds("data-raw/oco2.rds")
oco2<-oco2 |>
  janitor::clean_names() |>
  dplyr::mutate(
    xco2 = xco2_moles_mole_1*1e06,
    data = lubridate::ymd_hms(time_yyyymmddhhmmss),
    ano = lubridate::year(data),
    mes = lubridate::month(data),
    dia = lubridate::day(data),
    dia_semana = lubridate::wday(data))


oco2 |>
  dplyr::sample_n(1000) |>
  ggplot2::ggplot(ggplot2::aes(x=data,y=xco2)) +
  ggplot2::geom_point(color="blue") +
  ggplot2::geom_line(color="red")

oco2 |>
  dplyr::arrange(data) |>
  dplyr::mutate(x= 1:nrow(oco2)) |>
  ggplot2::ggplot(ggplot2::aes(x=x,y=xco2)) +
  ggplot2::geom_point(shape=21,color="black",fill="gray") +
  ggplot2::geom_smooth(method = "lm") +
  ggpubr::stat_regline_equation(ggplot2::aes(
    label =  paste(..eq.label.., ..rr.label.., sep = "*plain(\",\")~~")))

d_aux<-oco2 |>
  dplyr::arrange(data) |>
  dplyr::mutate(x= 1:nrow(oco2)) |>
  dplyr::select(x,xco2)
mod <- lm(d_aux$xco2~d_aux$x)
summary.lm(mod)
a<-mod$coefficients[1]
b<-mod$coefficients[2]

oco2 <- oco2 |>
  dplyr::arrange(data) |>
  dplyr::mutate(
    x= 1:nrow(oco2),
    xco2_est = a + b * x,
    delta = xco2_est - xco2,
    XCO2 = (a-delta) - (mean(xco2) - a)
  )
dplyr::glimpse(oco2)

oco2 |>
  dplyr::filter(ano == 2014) |>
  ggplot2::ggplot(ggplot2::aes(x=longitude, y=latitude, color=dia_semana)) +
  ggplot2::geom_point()

regiao <- geobr::read_region(showProgress = FALSE)
br <- geobr::read_country(showProgress = FALSE)

### Polígono Brasil
pol_br <- br$geom |> purrr::pluck(1) |> as.matrix()

### Polígonos das Regiões
pol_norte <- regiao$geom |> purrr::pluck(1) |> as.matrix()
pol_nordeste <- regiao$geom |> purrr::pluck(2) |> as.matrix()
pol_sudeste <- regiao$geom |> purrr::pluck(3) |> as.matrix()
pol_sul <- regiao$geom |> purrr::pluck(4) |> as.matrix()
pol_centroeste<- regiao$geom |> purrr::pluck(5) |> as.matrix()

source("r/graficos.R")

br |>
  ggplot2::ggplot() +
  ggplot2::geom_sf(fill="#2D3E50", color="#FEBF57",
                   size=.15, show.legend = FALSE)+
  ggplot2::geom_point(data=oco2 |>
                        dplyr::filter(ano == 2014) |>
                        dplyr::sample_n(1000) ,
                      ggplot2::aes(x=longitude,y=latitude),
                      shape=3,
                      col="red",
                      alpha=0.2)


def_pol <- function(x, y, pol){
  as.logical(sp::point.in.polygon(point.x = x,
                                  point.y = y,
                                  pol.x = pol[,1],
                                  pol.y = pol[,2]))
}

oco2 <- oco2 |>
  dplyr::mutate(
    flag_br = def_pol(longitude, latitude, pol_br),
    flag_norte = def_pol(longitude, latitude, pol_norte),
    flag_nordeste = def_pol(longitude, latitude, pol_nordeste),
    flag_sul = def_pol(longitude, latitude, pol_sul),
    flag_sudeste = def_pol(longitude, latitude, pol_sudeste),
    flag_centroeste = def_pol(longitude, latitude, pol_centroeste)
  )
dplyr::glimpse(oco2)


br |>
  ggplot2::ggplot() +
  ggplot2::geom_sf(fill="#2D3E50", color="#FEBF57",
                   size=.15, show.legend = FALSE)+
  tema_mapa() +
  ggplot2::geom_point(data=oco2 |> dplyr::filter(flag_br, ano == 2014) ,
                      ggplot2::aes(x=longitude,y=latitude),
                      shape=3,
                      col="red",
                      alpha=0.2)




# Retirando alguns pontos
pol_br <- pol_br[pol_br[,1]<=-34,]
pol_br <- pol_br[!((pol_br[,1]>=-38.8 & pol_br[,1]<=-38.6) &
                     (pol_br[,2]>= -19 & pol_br[,2]<= -16)),]

pol_nordeste <- pol_nordeste[pol_nordeste[,1]<=-34,]
pol_nordeste <- pol_nordeste[!((pol_nordeste[,1]>=-38.7 & pol_nordeste[,1]<=-38.6) & pol_nordeste[,2]<= -15),]



# Recriando o flag_nordeste
oco2 <- oco2 |>
  dplyr::mutate(
    flag_br = def_pol(longitude, latitude, pol_br),
    flag_nordeste = def_pol(longitude, latitude, pol_nordeste)
  )

# Plot do mapa e os pontos
br |>
  ggplot2::ggplot() +
  ggplot2::geom_sf(fill="#2D3E50", color="#FEBF57",
                   size=.15, show.legend = FALSE)+
  tema_mapa() +
  ggplot2::geom_point(data=oco2 |>
                        dplyr::filter(flag_br|flag_nordeste, ano == 2014),
                      ggplot2::aes(x=longitude,y=latitude),
                      shape=3,
                      col="red",
                      alpha=0.2)


oco2_br <- oco2 |>
  dplyr::filter( flag_br | flag_nordeste ) |>
  dplyr::select(-flag_br)
readr::write_rds(oco2_br,"data-raw/oco2_br.rds")
save(oco2_br, file = "data/oco2_br.rda")

## code to prepare `oco2` dataset goes here
oco2_br <- readr::read_rds("data-raw//oco2_br_novo.rds")
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

data_set <- data_set %>%
  dplyr::mutate(data =  lubridate::as_date(data, format = "%d/%m/%Y"),
         data_preparo  =  lubridate::as_date(data_preparo , format = "%d/%m/%Y"),
         conversao  =  lubridate::as_date(conversao , format = "%d/%m/%Y"),
         tratamento = ifelse(tratamento == "EUCA","EU",tratamento),
         revolvimento_solo = revolvimento_solo == "sim",
         cobertura = cobertura != "descoberto",
         manejo = ifelse(manejo=="Minimo" | manejo == "M?nimo", "minimo",manejo),
         manejo = ifelse(manejo=="SP", "sem_preparo",manejo),
         manejo = ifelse(manejo=="Convencional", "convencional",manejo),
         manejo = ifelse(manejo=="pasto", "pasto_degradado",manejo),
         cultura = ifelse(cultura == "feij?o","feijao",
                          ifelse(cultura =="cana-de-a??car","cana-de-acucar",cultura)))
dplyr::glimpse(data_set)
data_fco2 <- data_set
data_fco2$manejo %>% unique()
# usethis::use_data(data_fco2, overwrite = TRUE)
