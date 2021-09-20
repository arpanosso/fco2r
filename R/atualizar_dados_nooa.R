#' Função para atualizar os dados de CO2 NOOA (superfície do oceano)
#'
#' Busca os dados em https://gml.noaa.gov/ccgg/trends/data.html para Média semanal de CO2 de Mauna Loa e comparações históricas (CSV).
#'
#' @return Um data.frame
#' @export
#'
#' @examples
#' library(dplyr)
#' library(ggplot2)
#' library(magrittr)
#' atualizar_dados_nooa() %>%
#' dplyr::filter(CO2_ppm >= 0) %>%
#'   ggplot2::ggplot(ggplot2::aes(x= decimal, y=CO2_ppm)) +
#'   ggplot2::geom_line(color="red") +
#'   ggplot2::theme_minimal()
atualizar_dados_nooa <- function(){
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

 names(df) <- c("year", "month", "day",
                "decimal", "CO2_ppm", "n_days",
                "year_ago_1", "years_ago_10", "since_1800")
 df
}
