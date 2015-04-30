# encoding: UTF-8
# Main module of the Napakalaki project

require_relative "card_interface"

module Model

  ##
  # Clase que representa las cartas de monstruos que hay en la partida. Cada 
  # objeto de esta clase representa a una carta de monstruo de la baraja del 
  # juego. 
  #
  class Monster
    
    include CardInterface
    
    ##
    # Inicializa a un nuevo monstruo. Atributos:
    # - name: Nombre del monstruo
    # - combatLevel: Nivel de combate
    # - prize: Premio que se gana si se derrota al monstruo en combate
    # - badConsequence: Mal rollo que se aplica al jugador si es derrotado por
    # el monstruo
    #
    def initialize (name, combatLevel, prize, badConsequence, levelChange)

      @name = name
      @combatLevel = combatLevel
      @prize = prize
      @badConsequence = badConsequence
      @levelChangeAgainstCultist = levelChange
    end
    
    def self.newMonsterLevelStatic(name, combatLevel, prize, badConsequence)
      return new(name, combatLevel, prize, badConsequence, 0)
    end
    
    def self.newMonsterLevelDynamic(name, combatLevel, prize, badConsequence, levelChange)
      return new(name, combatLevel, prize, badConsequence, levelChange)
    end
    
    private_class_method :new

    # Nombre del monstruo
    attr_reader :name
    
    # Nivel de combate
    def getLevel()
      return @combatLevel
    end
    
    # Nivel de combate
    attr_reader :combatLevel 
    # Premio por derrotarlo en combate
    attr_reader :prize
    # Mal rollo que se aplica si se pierde el combate contra él
    attr_reader :badConsequence

    ##
    # Devuelve el nivel del monstruo cuando pelea contra un jugador normal
    #
    def getBasicValue()
      return @level
    end
    
    ##
    # Devuelve el nivel del monstruo cuando pelea contra un jugador sectario
    #
    def getSpecialValue()
      return (@level + @levelChangeAgainstCultistPlayer)
    end
    
    ##
    # Devuelve el valor de cambio de los niveles del monstruo cuando pelea contra
    # un jugador sectario
    #
    def levelChangeAgainstCultistPlayer()
      return @levelChangeAgainstCultist
    end
    
    ##
    # Método que devuelve el estado completo del monstruo en un string. Sirve
    # para detectar fallos.
    #
    def to_s()
      text = "Nombre: #{@name}, nivel de combate: #{@combatLevel}"
      
      if @levelChangeAgainstCultist != 0
        text += ", modificación de nivel contra sectarios: #{@levelChangeAgainstCultist}"
      end
      
      text += "\n\tPremio: #{@prize}\n\tMal rollo: #{@badConsequence.to_s}"
    end
  end
  
end
