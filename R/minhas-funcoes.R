#' @title Define se um ponto pertence um poligono
#'
#' @name def_pol
#'
#' @description Verifica se um ou mais pontos estao dentro dos limites
#' definidos por um determinado poligono.
#'
#' @param x Vetor com a(s) coordenada(s) x de pontos.
#' @param y Vetor com a(s) coordenada(s) y de pontos.
#' @param pol matriz contendo as coordenadas X e Y do poligono em suas colunas.
#'
#'
#' @details Tarefa baseada na funcao `point.in.pol` do pacote {`sp`},
#' utilizada para filtrar os pontos pertencentes aos poligonos dos estados,
#' regioes e municipios do Brasil. Os poligonos das regioes sao oriundos do
#' pacote {`geobr`}.
#'
#' @return retorna um vetor logico com TRUE para os pontos pertencens ao
#' poligono.
#'
#' @export
#' @examples
#' x <- 0:10
#' y <- x*2
#' poligono <- matrix(c(4.5,4.5,7.5,7.5,4.5,5,15,15,5,5),
#'                    ncol = 2)
#' vetor_logico <- def_pol(x,y, poligono)
#' plot(x,y, col=ifelse(vetor_logico,"red","blue"),
#'      pch=ifelse(vetor_logico,15,0))
#' points(poligono, typ="l")

def_pol <- function(x, y, pol){
  as.logical(sp::point.in.polygon(point.x = x,
                                  point.y = y,
                                  pol.x = pol[,1],
                                  pol.y = pol[,2]))
}
