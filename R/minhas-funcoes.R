#' @title Define se os pontos pertencem a um polígono
#'
#' @name def_pol
#'
#' @description Verifica para um ou mais pontos se eles se enquadram em um determinado polígono.
#'
#' @param x Vetor com a coordenada x do ponto
#' @param y Vetor com a coordenada y do ponto
#' @param pol matriz do polígono
#'
#'
#' @details Função baseada na função point.in.pol do pacote sp, utilizada
#' para filtrar os pontos pertencentes aos polígonos dos estados,
#' regiões e muicípios do Brasil. Os polígonos são oriundos do pacote geobr.
#'
#' @return o retorno da função será um vetor lógico dizendo que os pontos
#' pertencem ou não ao polígono especificado por pol
#'
#' @export
#' @examples

def_pol <- function(x, y, pol){
  as.logical(sp::point.in.polygon(point.x = x,
                                  point.y = y,
                                  pol.x = pol[,1],
                                  pol.y = pol[,2]))
}


