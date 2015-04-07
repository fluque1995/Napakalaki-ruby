# encoding: UTF-8
# Main module of the Napakalaki project

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
    # 
    attr_reader :dead
    attr_reader :visibleTreasures
    attr_reader :hiddenTreasures

    @@MAXHIDDENTREASURES = 4

    def bringToLive()
      @dead = false
    end

    def incrementLevels(levels)
      @level += levels
      if(@level > 10)
        @level = 10
      end
    end

    def decrementLevels(levels)
      @level -= levels
      if(@level < 1)
        @level = 1
      end
    end

    def setPendingBadConsquence(bc)
      @pendingBadConsequence = bc

    end

    def die()

    end

    def discardNecklaceIfVisible()

    end

    def dieIfNoTreasures()
      if(@hiddenTreasures.empty? and @visibleTreasures.empty?)
        @dead = true
      end
    end

    def canIBuyLevels(levels)
      return (@level + levels < 10) 
    end

    def computeGoldCoinsValue(t)

    end

    def applyPrize(p)

    end

    def combat(m)

    end

    def applyBadConsequence(bad)

    end

    def makeTreasureVisible(t)

    end

    def canMakeTreasureVisible(t)

    end

    def discardVisibleTreasure(t)

    end

    def discardHiddenTreasure(t)

    end

    def buyLevels(visible, hidden)

    end

    def validState()
      return (@hiddenTreasures.size < 4 and @pendingBadConsequence.isEmpty)
    end

    def initTreasures()

    end

    def hasVisibleTreasures()
      return (@visibleTreasures.empty? == false)
    end

    private_class_method :bringToLive, :incrementLevels, :decrementLevels
    private_class_method :setPendingBadConsequence, :die, :discardNecklaceIfVisible
    private_class_method :dieIfNoTreasures, :canIBuyLevels
    protected_class_method :computeGoldCoinsValue

  end
end