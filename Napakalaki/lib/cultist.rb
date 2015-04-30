#encoding: utf-8
# Main module of the Napakalaki project

module Model

  ##
  # Clase que representa una carta de sectario del juego. Cada objeto de esta 
  # clase representa a una carta de sectario de las que hay en el juego. Estas
  # cartas sirven para saber el comportamiento nuevo que tiene un jugador cuando
  # se convierte en sectario de acuerdo con las reglas del juego. 
  #
  class Cultist
    def initialize(name, gainedLevels)
      @name = name
      @gainedLevels = gainedLevels
    end
    
    attr_reader :name
    attr_reader :gainedLevels
    
    ##
    # Devuelve los niveles que gana el jugador por convertirse en sectario
    #
    def getBasicValue()
      return @gainedLevels
    end
    
    ##
    # Devuelve el número de niveles que gana el jugador por ser sectario, multiplicado
    # por el número de sectarios que hay en ese momento jugando. Este es el bonus
    # real de niveles que recibe un jugador para el combate por ser sectario
    #
    def getSpecialValue()
      return (@gainedLevels*CultistPlayer.getTotalCultistsPlayers)
    end
    
    ##
    # Devuelve la información relativa al sectario en un string. Sirve para trazar
    # errores
    #
    def to_s()
      return "Nombre: #{@name}, niveles ganados: #{@gainedLevels.to_s}"
    end
  end
end
