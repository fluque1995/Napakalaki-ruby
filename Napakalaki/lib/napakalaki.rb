# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Model

  class Napakalaki
    include Singleton

    def initialize()
      @currentPlayer = 0
      @players = Array.new
      @currentMonster = 0

    end

    attr_reader :currentPlayer, :currentMonster

    def initPlayer(names)

    end

    def nextPlayer()

    end

    private_class_method :initPlayer, :nextPlayer

    def combat()

    end

    def discardVisibleTreasures(t)

    end

    def discardHiddenTreasures(t)

    end

    def makeTreasureVisible(t)

    end

    def buyLevels(visible, hidden)

    end

    def initGame(players)

    end

    def canMakeTreasureVisible(t)

    end

    def getVisibleTreasures()

    end

    def getHiddenTreasures()

    end

    def nextTurn()

    end

    def nextTurnAllowed()

    end

    def endOfGame(result)

    end


  end
end