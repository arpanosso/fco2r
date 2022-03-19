#' Dados de dioxido de carbono atmosferico para o Brasil
#'
#' Base de dados contendo informações sobre frações molares médias de coluna
#' de ar seco de dióxido de carbono (XCO2) no período de 2015 a 2020.
#'
#' @format Uma tibble, contendo 146646 linhas e 11 colunas
#' \describe{
#'    \item{longitude}{coordenada geográfica que especifica a posição leste-oeste de um ponto na superfície da Terra}
#'    \item{longitude_bnds}{são, respectivamente, os limites superior e inferior da coordenada, onde a longitude para um ponto foi dada pela média desses limites}
#'    \item{latitude}{é uma coordenada geográfica que especifica a posição norte-sul de um ponto na superfície da Terra}
#'    \item{latitude_bnds}{são, respectivamente, os limites superior e inferior da coordenada, onde a latitude para um ponto foi dada pela média desses limites}
#'    \item{time_yyyymmddhhmmss}{data de leitura, em ano, mês, dia, horas minutos e segundos}
#'    \item{time_bnds_yyyymmddhhmmss}{limites de tempo utilizados para o cálculo da data de leitura (`char`) }
#'    \item{altitude_km}{altitude média em `km`}
#'    \item{alt_bnds_km}{limites da altitude, 0 (nível do mar) e altitude do satélite no momento de leitura `km`}
#'    \item{fluorescence_offset_relative_771nm_idp}{Fração de radiância de nível contínuo explicada por um termo de deslocamento aditivo na janela espectral de 757 nm (sem unidade)}
#'    \item{fluorescence_offset_relative_757nm_idp}{Fração da radiância de nível contínuo explicada por um termo de deslocamento aditivo na janela espectral de 771 nm (sem unidade)}
#'    \item{xco2_moles_mole_1}{Fração molar de ar seco de dioxido carbono em média da coluna (`moles/mol`)}
#' }
#' @source \url{https://co2.jpl.nasa.gov/}
#'
"oco2_br"


#' Dados de emissão de CO2 do solo e atributos relacionados
#'
#' Base de dados contendo valores de emissão de CO2 e atributos físicos e químicos do solo para diferentes experimentos conduzidos no Brasil
#'
#'@format Uma tibble, contendo 15397 linhas e 39 colunas
#'\describe{
#'    \item{experimento}{Nos experimentos classificados como *Espacial* uma malha
#'    amostral foi instalada em campo como o objetivo de avaliar a variabilidade espacial
#'    dos atributos do solo por meio de técnicas geoestatísticas; nos experimentos classificados
#'    como **Temporais**, a respiração do solo foi avaliada em diferentes tratamentos (usos do solo,
#'    manejos ou preparos)}
#'    \item{data}{descrição}
#'    \item{preparo_solo}{descrição}
#'    \item{tratamento}{descrição}
#'    \item{revolvimento_solo}{descrição}
#'    \item{data_preparo}{descrição}
#'    \item{conversao}{descrição}
#'    \item{cobertura}{descrição}
#'    \item{cultura}{descrição}
#'    \item{x}{descrição}
#'    \item{y}{descrição}
#'    \item{longitude_muni}{descrição}
#'    \item{latitude_muni}{descrição}
#'    \item{estado}{descrição}
#'    \item{municipio}{descrição}
#'    \item{ID}{descrição}
#'    \item{prof}{descrição}
#'    \item{FCO2}{\eqn{\mu mol \; CO_2 m^{-2}}
#'    }
#'    \item{Ts}{descrição}
#'    \item{Us}{descrição}
#'    \item{pH}{descrição}
#'    \item{MO}{descrição}
#'    \item{P}{descrição}
#'    \item{K}{descrição}
#'    \item{Ca}{descrição}
#'    \item{Mg}{descrição}
#'    \item{H_Al}{descrição}
#'    \item{SB}{descrição}
#'    \item{CTC}{descrição}
#'    \item{V}{descrição}
#'    \item{Ds}{descrição}
#'    \item{Macro}{descrição}
#'    \item{Micro}{descrição}
#'    \item{VTP}{descrição}
#'    \item{PLA}{descrição}
#'    \item{AT}{descrição}
#'    \item{SILTE}{descrição}
#'    \item{ARG}{descrição}
#'    \item{HLIFS}{descrição}
#'}
#'@source \url{www.fcav.unesp.br}
#'
"data_fco2"
