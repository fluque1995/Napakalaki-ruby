# encoding: UTF-8
# Main module of the Napakalaki project

module Model

  ##
  # Clase que representa las cartas de monstruos que hay en la partida. Cada 
  # objeto de esta clase representa a una carta de monstruo de la baraja del 
  # juego. 
  #
  class Monster
    
    ##
    # Inicializa a un nuevo monstruo. Atributos:
    # - name: Nombre del monstruo
    # - combatLevel: Nivel de combate
    # - prize: Premio que se gana si se derrota al monstruo en combate
    # - badConsequence: Mal rollo que se aplica al jugador si es derrotado por
    # el monstruo
    #
    def initialize (name, combatLevel, prize, badConsequence)

      @name = name
      @combatLevel = combatLevel
      @prize = prize
      @badConsequence = badConsequence

    end

    # Nombre del monstruo
    attr_reader :name
    # Nivel de combate
    attr_reader :combatLevel 
    # Premio por derrotarlo en combate
    attr_reader :prize
    # Mal rollo que se aplica si se pierde el combate contra él
    attr_reader :badConsequence

    ##
    # Método que devuelve el estado completo del monstruo en un string. Sirve
    # para detectar fallos.
    #
    def to_s()
      return "Nombre: #{@name}, nivel de combate: #{@combatLevel}\n\tPremio: #{@prize}\n" +
             "\tMal rollo: #{@badConsequence.to_s}"
    end
  end
end
