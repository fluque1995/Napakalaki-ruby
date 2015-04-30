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
    
    ##
    # Método que obtiene el nivel de combate del monstruo oponente al luchar contra
    # un jugador sectario. Este método redefine el método Player.getOpponentLevel
    # porque el nivel de algunos monstruos varía dependiendo del tipo de jugador 
    # al que se enfrenten
    #
    def getOpponentLevel(monster)
      return monster.getSpecialValue
    end
    
    ##
    # Método que calcula el número de niveles que vale una determinada lista de 
    # tesoros. Este método redefine el método Player.computeGoldCoinsValue, ya que
    # para los jugadores sectarios, el valor en oro de sus objetos vale doble
    #
    def computeGoldCoinsValue(treasures)
      
      value = 0.0
      for t in treasures
        value += t.goldCoins
      end
      return (value/500.0)
      
    end
    
    ##
    # Método que devuelve el número de jugadores sectarios que hay jugando en ese
    # momento
    #
    def self.getTotalCultistPlayers()
      return @@totalCultistPlayers
    end
  end
end
