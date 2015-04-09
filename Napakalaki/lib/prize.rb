# encoding: UTF-8
# Main module of the Napakalaki project

module Model

  ##
  # Clase que representa los premios que se obtienen en el juego. Cuando un jugador
  # (Player) vence en combate a un monstruo (Monster), recibe un premio, consistente
  # en una determinada subida de niveles y un robo de cartas de tesoro. Esta clase
  # sirve de apoyo a la clase Monster.
  #
  class Prize
    
    ##
    # Inicializa un premio, especificando el número de niveles que se aumentan
    # y el número de tesoros que se obtienen.
    #
    def initialize(treasures, levels)
      @treasures = treasures
      @levels = levels
    end

    # Tesoros obtenidos
    attr_reader :treasures
    # Niveles aumentados
    attr_reader :levels

    ##
    # Método que devuelve un string con toda la información relativa al premio.
    # Sirve para trazar fallos.
    #
    def to_s()
      return "Tesoros: #{@treasures}, niveles: #{@levels}"
    end
  end
end
