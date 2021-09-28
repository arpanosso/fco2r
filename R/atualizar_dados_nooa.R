#' Função para atualizar os dados de CO2 NOOA (superfície do oceano)
#'
#' Busca os dados em https://gml.noaa.gov/ccgg/trends/data.html para Média semanal de CO2 de Mauna Loa e comparações históricas (CSV).
#'
#' @return Um data.frame
#' @export
#'
#' @examples
#' atualizar_dados_nooa()
atualizar_dados_nooa <- function(){
  url <- "https://gml.noaa.gov/webdata/ccgg/trends/co2/co2_weekly_mlo.txt"
  df <- utils::read.table(url)
  names(df) <- c("year", "month", "day",
                "decimal", "CO2_ppm", "n_days",
                "year_ago_1", "years_ago_10", "since_1800")
 df
}

