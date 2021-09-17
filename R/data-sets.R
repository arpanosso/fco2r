#' Dados de dioxido de carbono atmosferico para o Brasil
#'
#' Base de dados contendo informações sobre frações molares médias de coluna
#' de ar seco de dióxido de carbono (XCO2)
#'
#' @format Uma lista que descreve as colunas: esta base tem X linahs e X colunas
#' \describe{
#'    \item{longitude}{coordenada geográfica que especifica a posição leste-oeste
#'    de um ponto na superfície da Terra}
#'    \item{longitude_bnds}{são, respectivamente, os limites superior e inferior
#'    da coordenada, onde a longitude para um ponto foi dada pela média desses
#'    limites}
#'    \item{latitude}{é uma coordenada geográfica que especifica a posição
#'    norte-sul de um ponto na superfície da Terra}
#'    \item{latitude_bnds}{são, respectivamente, os limites superior e inferior
#'    da coordenada, onde a latitude para um ponto foi dada pela média desses
#'    limites}
#'    \item{time_yyyymmddhhmmss}{data de leitura, em ano, mês, dia, horas
#'    minutos e segundos}
#'    \item{time_bnds_yyyymmddhhmmss}{limites de tempo utilizados para o cálculo
#'    da data de leitura (`char`) }
#'    \item{altitude_km}{altitude média em `km`}
#'    \item{alt_bnds_km}{limites da altitude, 0 (nível do mar) e altitude do
#'    satélite no momento de leitura `km`}
#'    \item{fluorescence_offset_relative_771nm_idp}{Fração de radiância de nível
#'    contínuo explicada por um termo de deslocamento aditivo na janela espectral
#'    de 757 nm (sem unidade)}
#'    \item{fluorescence_offset_relative_757nm_idp}{Fração da radiância de nível
#'    contínuo explicada por um termo de deslocamento aditivo na janela espectral
#'    de 771 nm (sem unidade)}
#'    \item{xco2_moles_mole_1}{Fração molar de ar seco de dioxido carbono em
#'    média da coluna (`moles/mol`)}
#' }
#' @source \url{https://co2.jpl.nasa.gov/}
#'
"oco2"
