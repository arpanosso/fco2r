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
#'    \item{experimento}{A classificação  **Espacial** refere-se a experimentos nos quais uma malha
#'    amostral foi instalada como o objetivo de avaliar a variabilidade espacial
#'    da emissão de \eqn{CO_2} e atributos do solo relacionados por meio de técnicas geoestatísticas. Nos ensaios classificados com
#'   **Temporal**, a respiração do solo foi avaliada em diferentes tratamentos (usos,
#'    manejos ou preparo do solo).}
#'    \item{data}{Data da realização da avaliação em questão.}
#'    \item{manejo}{Manejo ou preparo do solo ou uso da terra que a parcela experimental foi submetida.}
#'    \item{tratamento}{Especificação a respeito do manejo/preparo/uso: AD (arado de disco);
#'    E (escarificador); GN ou gn (grade niveladora); GA (grade aradora); CQ (cana queimada);
#'    CC (cana crua); PD (plantio direto); EU (eucalipto); MT (mata ciliar); MN (mata natural);
#'    PI (pinus); SI (silvipastoril); PDr (pastagem degradada) e PR (pastagem reformada).}
#'    \item{revolvimento_solo}{Variável lógica indicando se houve revolvimento do solo previamente à condução do ensaio em questão.}
#'    \item{data_preparo}{Data em que ocorreu o revolvimento do solo, se verdadeiro.}
#'    \item{conversao}{Data em que a área foi convertidada de vegetação natural para o uso agrícola.}
#'    \item{cobertura}{Variável lógica indicando se no momento de availação o solo encontrava-se com cobertura superficial.}
#'    \item{cultura}{Cultura agrícola, florestal ou natural a que se destina a área.}
#'    \item{x}{coordenada X relativa à parcela ou malha amostral específica.}
#'    \item{y}{coordenada Y relativa à parcela ou malha amostral específica.}
#'    \item{longitude_muni}{Coordenada referente ao município no qual o experimento foi conduzido.}
#'    \item{latitude_muni}{Coordenada referente ao município no qual o experimento foi conduzido.}
#'    \item{estado}{Unidade federativa do município.}
#'    \item{municipio}{Cidade/município onde o experiemnto foi realizado.}
#'    \item{ID}{Identificação do ponto amostral dentro do ensaio específico.}
#'    \item{prof}{profunidade de coleta do atributo.}
#'    \item{FCO2}{Emissão de \eqn{CO_2} do solo em \eqn{\mu mol\;m^{-2}\; s^{-1}}
#'    }
#'    \item{Ts}{Temperatura do solo em \eqn{^{o}C}.}
#'    \item{Us}{Umidade do solo em \eqn{\%}.}
#'    \item{pH}{Potencial hidrogeniônico da solução do solo.}
#'    \item{MO}{Teor de matéria orgânica do solo em \eqn{g \; dm^{-3}}.}
#'    \item{P}{Teor de Fósforo disponível do solo em \eqn{mg \; dm^{-3}}.}
#'    \item{K}{Teor de Potássio do solo em \eqn{mmol_c \; dm^{-3}}.}
#'    \item{Ca}{Teor de Cálcio do solo em \eqn{mmol_c \; dm^{-3}}.}
#'    \item{Mg}{Teor de Magnésio do solo em \eqn{mmol_c \; dm^{-3}}.}
#'    \item{H_Al}{Teor de H+Al do solo em \eqn{mmol_c \; dm^{-3}}.}
#'    \item{SB}{Soma de bases do solo em \eqn{mmol_c \; dm^{-3}}.}
#'    \item{CTC}{Capacidade de troca caiônica do soloem \eqn{mmol_c \; dm^{-3}}.}
#'    \item{V}{Saturação por bases do solo em \eqn{\%}.}
#'    \item{Ds}{Densidade do solo em \eqn{g \; cm^{-3}}.}
#'    \item{Macro}{Macroporosidade do solo em \eqn{m^{3}m^{-3}}.}
#'    \item{Micro}{Microporosidade do solo em \eqn{m^{3}m^{-3}}.}
#'    \item{VTP}{Volume total de poros do solo em \eqn{m^{3}m^{-3}}.}
#'    \item{PLA}{Porosidade livre de água do solo em \eqn{\%}.}
#'    \item{AT}{Teor de areia total do solo em \eqn{g \; kg^{-1}}.}
#'    \item{SILTE}{Teor de silte do solo em \eqn{g \; kg^{-1}}.}
#'    \item{ARG}{Teor de argila do solo em \eqn{g \; kg^{-1}}.}
#'    \item{HLIFS}{Grau de humificação da matéria orgânica do solo em unidade arbitrária}
#'}
#'@source \url{www.fcav.unesp.br}
#'
"data_fco2"
