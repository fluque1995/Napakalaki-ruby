# encoding: UTF-8
# Main module of the Napakalaki project

require_relative "treasure.rb"
require_relative "treasure_kind.rb"
require_relative "bad_consequence.rb"

module Model

  ##
  # Clase que representa a los jugadores. Cada objeto de esta clase representa
  # un jugador dentro del juego, y mantiene la información relativa a las cartas
  # de tesoro que le pertenecen (Treasures), así como el nivel del mismo.
  #
  class Player

    ##
    # Inicializa un nuevo jugador. Atributos:
    # - name: Nombre del jugador.
    #
    def initialize(name)
      @name = name
      @dead = true
      @level = 1
      @hiddenTreasures = Array.new
      @visibleTreasures = Array.new
      @pendingBadConsequence = nil
    end

    # Nivel del jugador
    attr_reader :level
    # Atributo que indica si el jugador está muerto
    attr_reader :dead
    # Array de tesoros visibles del jugador
    attr_reader :visibleTreasures
    # Array de tesoros ocultos del jugador
    attr_reader :hiddenTreasures

    # Número máximo de tesoros ocultos que puede poseer un jugador
    @@MAXHIDDENTREASURES = 4

    # Método que devuelve la vida al jugador
    def bringToLive()
      @dead = false
    end
    
    ##
    # Método que incrementa el nivel del jugador, sumándole a su nivel (level),
    # un cierto número de niveles (levels)
    #
    def incrementLevels(levels)
      @level += levels
      if(@level > 10)
        @level = 10
      end
    end
    
    ##
    # Método que decrementa el nivel del jugador, restándole a su nivel (level),
    # un cierto número de niveles (levels)
    #
    def decrementLevels(levels)
      @level -= levels
      if(@level < 1)
        @level = 1
      end
    end

    ##
    # Método que asigna al jugador el mal rollo especificado como argumento
    #
    def setPendingBadConsequence(bc)
      @pendingBadConsequence = bc

    end

    ##
    # Método que mata al jugador, actualizando los parámetros necesarios.
    #
    def die()

    end
    
    #Examen
    def setVisibleTreasureList(treasures)
      @visibleTreasures = treasures
    end
    
    def setHiddenTreasureList(treasures)
      @hiddenTreasures = treasures
    end
    #fin

    ##
    # Método que descarta una armadura de tipo collar si el jugador lo tiene equipado.
    # Dado que no se puede tener más de un turno consecutivo el mismo objeto de 
    # collar equipado, se llamará a este método después de cada ataque.
    #
    def discardNecklaceIfVisible()

    end

    ##
    # Método que mata al jugador si éste no tiene ningún tesoro.
    #
    def dieIfNoTreasures()
      if(@hiddenTreasures.empty? and @visibleTreasures.empty?)
        @dead = true
      end
    end

    ##
    # Comprueba si el jugador tiene permitido comprar un número determinado de 
    # niveles. El jugador no puede ganar el juego comprando niveles (no puede 
    # comprar el nivel 10).
    #
    def canIBuyLevels(levels)
      return (@level + levels < 10) 
    end

    ##
    # Contabiliza el dinero que se obtiene al vender una serie de tesoros. Este 
    # dinero se utiliza a posteriori para comprar un determinado número de niveles.
    #
    def computeGoldCoinsValue(treasures)

    end

    ##
    # Método que aplica un determinado premio al jugador.
    #
    def applyPrize(prize)

    end

    ##
    # Método que simula un combate contra un monstruo.
    #
    def combat(monster)

    end

    ##
    # Método que aplica un mal rollo al jugador, actualizando su estado a un 
    # estado consistente
    #
    def applyBadConsequence(badConsequence)

    end

    ##
    # Método que convierte un tesoro oculto del jugador en tesoro visible, actualizando
    # su mano
    #
    def makeTreasureVisible(treasure)

    end

    ##
    # Método que comprueba si un determinado tesoro puede convertirse en tesoro
    # visible
    #
    def canMakeTreasureVisible(treasure)

    end
    
    ##
    # Método que descarta un determinado tesoro visible
    #
    def discardVisibleTreasure(treasure)

    end
    
    ##
    # Método que descarta un determinado tesoro oculto
    #
    def discardHiddenTreasure(treasure)

    end

    ##
    # Método que compra una serie de niveles a partir de un conjunto de tesoros
    # visibles y un conjunto de tesoros ocultos. Tras la compra, el jugador habrá
    # aumentado un determinado número de niveles, y habrá perdido los tesoros 
    # que haya utilizado para la compra
    #
    def buyLevels(visibleTreasures, hiddenTreasures)

    end

    ##
    # Método que calcula el nivel de combate del jugador, usando para esto el nivel
    # propio sumado al bonus que le otorguen los distintos tesoros visibles que posea
    #
    def getCombatLevel()
      combatLevel = @level
      hasNecklace = false
      
      for treasure in @visibleTreasures
        if treasure.getType == TreasureKind::NECKLACE
          hasNecklace = true
        end
      end
      
      if hasNecklace
        for treasure in @visibleTreasures
          combatLevel += treasure.maxBonus
        end
      else
        for treasure in @visibleTreasures
          combatLevel += treasure.minBonus
        end
      end
      
      return combatLevel
    end
    ##
    # Método que comprueba si el jugador se encuentra en un estado válido, es
    # decir, si tiene un número de tesoros ocultos menor que 
    #
    def validState()
      return (@hiddenTreasures.size < @@MAXHIDDENTREASURES and @pendingBadConsequence.isEmpty)
    end

    def initTreasures()

    end

    def hasVisibleTreasures()
      return (@visibleTreasures.empty? == false)
    end

    private :bringToLive, :incrementLevels, :decrementLevels
    private :die, :discardNecklaceIfVisible
    private :dieIfNoTreasures, :canIBuyLevels
    protected :computeGoldCoinsValue
    
  end
end
