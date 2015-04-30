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
    
    ##
    # Método que devuelve el nivel de combate de un jugador sectario. Un jugador
    # sectario tiene como nivel de combate el nivel de combate que le corresponde
    # como jugador más el bonus que obtiene por ser sectario, que depende del número
    # de sectarios que haya jugando.
    #
    def getCombatLevel()
      return super.getCombatLevel + @myCultistCard.getSpecialValue
    end
    
    ##
    # Redefinición del método Player.shouldConvert. En este caso se devuelve siempre
    # false porque el sectario no debe volverse a convertir, ya que una vez convertido
    # en sectario un jugador no puede dejar de serlo, y por tanto, no debe volver
    # a convertirse en sectario por segunda vez
    #
    def shouldConvert()
      return false
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
