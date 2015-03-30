# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


module Model

  class Player
    def initialize(name)
      @name = name
      @dead = true
      @level = 1
      @hiddenTreasures = Array.new
      @visibleTreasures = Array.new
      @pendingBadConsequence = nil
    end

    attr_reader :level, :dead
    attr_reader :visibleTreasures, :hiddenTreasures

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