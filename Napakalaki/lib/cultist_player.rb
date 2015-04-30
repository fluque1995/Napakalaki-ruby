# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Model
  class CultistPlayer < Player
    
    def initialize(player, cultist)
      super(player)
      @myCultistCard = cultist
      @@totalCultistPlayers += 1
    end
    
    @@totalCultistPlayers = 0
    
    def getCombatLevel()
      return super.getCombatLevel + @@totalCultistPlayers*@myCultistCard.gainedLevels
    end
    
    def shouldConvert()
      return super
    end
    
    def getOpponentLevel()
      
    end
    
    def computeGoldCoinsValue()
      
    end
    
    def self.getTotalCultistPlayers()
      return @@totalCultistPlayers
    end
  end
end
