# encoding: UTF-8
# Main module of the Napakalaki project

module Model
  require 'singleton'

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
      @currentPlayer = 0
      @players = Array.new
      @currentMonster = 0

    end

    # Jugador que posee el turno
    attr_reader :currentPlayer
    
    # Monstruo actual, que pelea contra el jugador que posee el turno
    attr_reader :currentMonster

    ##
    # Inicializa el vector de jugadores.
    #
    def initPlayer(names)

    end

    ##
    # Pasa el turno al siguiente jugador.
    #
    def nextPlayer()

    end

    private :initPlayer, :nextPlayer

    ##
    # Simula un combate entre el jugador actual (currentPlayer) y el monstruo
    # actual (currentMonster), devolviendo el resultado de dicho combate
    #
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
