# encoding: UTF-8
# Main module of the Napakalaki project

module Model
  require 'singleton'
  
  require_relative "player.rb"
  require_relative "monster.rb"
  require_relative "card_dealer.rb"
  require_relative "cultist_player.rb"
  ##
  # Clase principal del juego Napakalaki. Controla toda la información relativa
  # al desarrollo de una partida. Controla la información de los jugadores, el 
  # jugador que lleva el turno, los resultados de los combates y los mazos de 
  # cartas. Es una clase de tipo singleton, ya que no interesa tener más de una
  # instancia del juego en el programa al mismo tiempo.
  #
  class Napakalaki
    include Singleton

    ##
    # Inicializa el juego
    #
    def initialize()
      @currentPlayer = nil
      @players = Array.new
      @currentMonster = nil
      @currentPlayerIndex = -1
    end

    # Jugador que posee el turno
    attr_reader :currentPlayer
    
    # Monstruo actual, que pelea contra el jugador que posee el turno
    attr_reader :currentMonster

    ##
    # Inicializa el vector de jugadores.
    #
    def initPlayers(names)
      
      for name in names
        @players << Player.newPlayer(name)
      end
      
    end

    ##
    # Pasa el turno al siguiente jugador.
    #
    def nextPlayer()
      if(@currentPlayerIndex == -1)
        @currentPlayerIndex = rand(@players.size)
      else
        @currentPlayerIndex = (@currentPlayerIndex + 1) % @players.size
      end
      
      @currentPlayer = @players[@currentPlayerIndex]
      return @currentPlayer
    end
    
    private :initPlayers, :nextPlayer

    ##
    # Devuelve el jugador que posee el turno
    #
    def getCurrentPlayer()
      return @currentPlayer
    end
    
    ##
    # Devuelve el monstruo que posee el turno
    #
    def getCurrentMonster()
      return @currentMonster
    end
    
    ##
    # Simula un combate entre el jugador actual (currentPlayer) y el monstruo
    # actual (currentMonster), devolviendo el resultado de dicho combate
    #
    def combat()
      combatResult = @currentPlayer.combat(@currentMonster)
      cardDealer = CardDealer.instance
      cardDealer.giveMonsterBack(@currentMonster)
      if combatResult == CombatResult::LOSEANDCONVERT
        currentCultistCard = cardDealer.nextCultist
        newCultistPlayer = CultistPlayer.new(@currentPlayer, currentCultistCard)
        @players[@currentPlayerIndex] = newCultistPlayer
      end
      return combatResult
    end

    ##
    # Descarta un tesoro visible del jugador actual (currentPlayer)
    #
    def discardVisibleTreasure(treasure)
        @currentPlayer.discardVisibleTreasure(treasure)
    end

    ##
    # Descarta un tesoro oculto del jugador actual (currentPlayer)
    #
    def discardHiddenTreasures(treasure)
      @currentPlayer.discardHiddenTreasure(treasure)
    end

    ##
    # Pasa un tesoro del jugador actual de oculto a visible (equipa dicho objeto)
    #
    def makeTreasureVisible(treasure)
      allowed = @currentPlayer.canMakeTreasureVisible
      if allowed
        @currentPlayer.makeVisibleTreasure(treasure)
      end

    end

    ##
    # Compra niveles del jugador actual (currentPlayer)
    #
    def buyLevels(visible, hidden)
      return @currentPlayer.buyLevels(visible, hidden)
    end

    ##
    # Inicia el juego, inicializando a los jugadores que juegan, el CardDealer, 
    # y llamando al primer turno.
    #
    def initGame(players)
      cardDealer = CardDealer.instance
      cardDealer.initCards
      initPlayers(players)
      nextTurn
    end

    ##
    # Comprueba si el jugador actual puede hacer visible un determinado tesoro
    #
    def canMakeTreasureVisible(treasure)
      return @currentPlayer.canMakeTreasureVisible(treasure)
    end

    ##
    # Devuelve el array de tesoros visibles del jugador actual
    #
    def getVisibleTreasures()
      return @currentPlayer.visibleTreasures
    end

    ##
    # Devuelve el array de tesoros ocultos del jugador actual
    #
    def getHiddenTreasures()
      return @currentPlayer.hiddenTreasures
    end
    
    ##
    # Método que pasa al siguiente turno. Devuelve true si ha podido pasar al 
    # siguiente turno satisfactoriamente y false en caso contrario
    #
    def nextTurn()
      nextTurn = false
      if nextTurnIsAllowed
        cardDealer = CardDealer.instance
        @currentMonster = cardDealer.nextMonster
        nextPlayer
        if currentPlayer.dead
          currentPlayer.initTreasures
        end
        nextTurn = true
      end
      return nextTurn
    end
    
    ##
    # Método que comprueba si el turno siguiente está permitido, es decir, si el
    # jugador actual cumple con las condiciones necesarias para terminar su turno.
    # Utiliza como apoyo el método Player.validState()
    #
    def nextTurnIsAllowed()
      return (@currentPlayer == nil or @currentPlayer.validState);
    end

    ##
    # Método que comprueba si el combate anterior ha provocado el fin del juego, 
    # es decir, si el jugador gana la partida tras ganar el combate.
    #
    def endOfGame(result)
      return result == CombatResult::WINANDWINGAME
    end
  end
end
