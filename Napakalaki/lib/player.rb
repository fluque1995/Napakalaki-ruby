# encoding: UTF-8
# Main module of the Napakalaki project

require_relative "treasure.rb"
require_relative "treasure_kind.rb"
require_relative "bad_consequence.rb"
require_relative "card_dealer.rb"
require_relative "dice.rb"
require_relative "combat_result.rb"

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
    
    ##
    # Nivel del jugador
    #
    def getLevel
      return @level
    end
    
    # Nivel del jugador
    attr_reader :level
    
    ##
    # Indica si el jugador está muerto
    #
    def getDead
      return @dead
    end
    
    # Atributo que indica si el jugador está muerto
    attr_reader :dead
    
    ##
    # Array de tesoros visibles del jugador
    #
    def getVisibleTreasures
      return @visibleTreasures
    end
    
    # Array de tesoros visibles del jugador
    attr_reader :visibleTreasures
    
    ##
    # Array de tesoros ocultos del jugador    
    #
    def getHiddenTreasures
      return @hiddenTreasures
    end
    
    # Array de tesoros ocultos del jugador
    attr_reader :hiddenTreasures
    
    ##
    # Getter para el nombre del jugador
    #
    def getName()
      return @name
    end
    
    # Número máximo de tesoros ocultos que puede poseer un jugador
    @@MAXHIDDENTREASURES = 4

    # Método que devuelve la vida al jugador
    def bringToLife()
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
      cardDealer = CardDealer.instance
      while not @visibleTreasures.empty?
        treasure = @visibleTreasures.pop
        cardDealer.giveTreasureBack(treasure)
      end
      
      @visibleTreasures.clear
      
      while not @hiddenTreasures.empty?
        treasure = @hiddenTreasures.pop
        cardDealer.giveTreasureBack(treasure)
      end

      @hiddenTreasures.clear
      @level = 1
      @dead = true
    end
    
    ##
    # Método que descarta una armadura de tipo collar si el jugador lo tiene equipado.
    # Dado que no se puede tener más de un turno consecutivo el mismo objeto de 
    # collar equipado, se llamará a este método después de cada ataque.
    #
    def discardNecklaceIfVisible()
      for t in @visibleTreasures
        if t.getType == TreasureKind::NECKLACE
          @visibleTreasures.delete(t)
          cardDealer = CardDealer.instance
          cardDealer.giveTreasureBack(t)
        end
      end
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
      
      value = 0.0
      for t in treasures
        value += t.goldCoins
      end
      return (value/1000.0)
      
    end

    ##
    # Método que aplica un determinado premio al jugador.
    #
    def applyPrize(prize)
      nLevels = prize.levels
      incrementLevels(nLevels)
      nTreasure = prize.treasures
      cardDealer = CardDealer.instance
      i = 0
      while i < nTreasure
        treasure = cardDealer.nextTreasure
        @hiddenTreasures << treasure
        i+=1
      end
    end

    ##
    # Método que simula un combate contra un monstruo.
    #
    def combat(monster)
      myLevel = getCombatLevel
      monsterLevel = getOpponentLevel(monster)
    
      if monsterLevel < myLevel
    
        myPrize = monster.prize
        applyPrize(myPrize)
        
        if @level < 10
          combatResult = CombatResult::WIN
        else
          combatResult = CombatResult::WINANDWINGAME
        end
      else
        dice = Dice.instance
        escape = dice.nextNumber
        
        if escape < 5
          
          bc = monster.badConsequence
          amIDead = bc.kills
          
          if amIDead
            die
            combatResult = CombatResult::LOSEANDDIE
          else
            applyBadConsequence(bc)
            if shouldConvert
              combatResult = CombatResult::LOSEANDCONVERT
            else
              combatResult = CombatResult::LOSE
            end
          end
        else
          combatResult = CombatResult::LOSEANDESCAPE
        end
      
      end
      
      discardNecklaceIfVisible
      return combatResult
    end
    
    ##
    # Método que aplica un mal rollo al jugador, actualizando su estado a un 
    # estado consistente
    #
    def applyBadConsequence(badConsequence)
      nLevels = badConsequence.levels
      decrementLevels(nLevels)
      
      pendingBadConsequence = badConsequence.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
      setPendingBadConsequence(pendingBadConsequence)
    end

    ##
    # Método que convierte un tesoro oculto del jugador en tesoro visible, actualizando
    # su mano
    #
    def makeTreasureVisible(treasure)
      if canMakeTreasureVisible(treasure)
        t = @hiddenTreasures.index(treasure)
        @hiddenTreasures.delete_at(t)
        @visibleTreasures << treasure
      end
    end

    ##
    # Método que comprueba si un determinado tesoro puede convertirse en tesoro
    # visible
    #
    def canMakeTreasureVisible(treasure)
      allowed = true
      if treasure.getType == TreasureKind::ONEHAND
        count = 0
        
        for t in @visibleTreasures
        
          if t.getType == TreasureKind::ONEHAND
            count += 1
          
            if count > 1
              allowed = false
            end
            
          elsif t.getType == TreasureKind::BOTHHANDS
            allowed = false
          end
        
        end
        
      else
        for t in @visibleTreasures
          if treasure.getType == t.getType or (treasure.getType == TreasureKind::BOTHHANDS and 
                                               t.getType == TreasureKind::ONEHAND)
            allowed = false
          end
        end
      end
      
      return allowed
    end
    
    ##
    # Método que descarta un determinado tesoro visible
    #
    def discardVisibleTreasure(treasure)
      t = @visibleTreasures.find_index(treasure)
      if t != nil
        @visibleTreasures.delete_at(t)
        if @pendingBadConsequence != nil
          @pendingBadConsequence.substractVisibleTreasure(treasure)
        end
      end
      cardDealer = CardDealer.instance
      cardDealer.giveTreasureBack(treasure)
      dieIfNoTreasures
    end
    
    ##
    # Método que descarta un determinado tesoro oculto
    #
    def discardHiddenTreasure(treasure)
      t = @hiddenTreasures.find_index(treasure)
      if t != nil
        @hiddenTreasures.delete_at(t)
        if @pendingBadConsequence != nil
          @pendingBadConsequence.substractHiddenTreasure(treasure)
        end
      end
      cardDealer = CardDealer.instance
      cardDealer.giveTreasureBack(treasure)
      dieIfNoTreasures
    end

    ##
    # Método que compra una serie de niveles a partir de un conjunto de tesoros
    # visibles y un conjunto de tesoros ocultos. Tras la compra, el jugador habrá
    # aumentado un determinado número de niveles, y habrá perdido los tesoros 
    # que haya utilizado para la compra
    #
    def buyLevels(visibleTreasures, hiddenTreasures)
      levels = computeGoldCoinsValue(visibleTreasures)
      levels += computeGoldCoinsValue(hiddenTreasures)
      canI = canIBuyLevels(levels.to_i)
      
      if canI
        incrementLevels(levels.to_i)
        for treasure in visibleTreasures
          discardVisibleTreasure(treasure)
        end
        
        for treasure in hiddenTreasures
          discardHiddenTreasure(treasure)
        end
      end
      
      return canI
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
    # decir, si tiene un número de tesoros ocultos menor que el máximo permitido
    # y si ha cumplido el mal rollo que tiene asignado
    #
    def validState()
      return (@hiddenTreasures.size <= @@MAXHIDDENTREASURES and (@pendingBadConsequence == nil or 
                                                               @pendingBadConsequence.isEmpty))
    end

    def initTreasures()
      bringToLife
      dice = Dice.instance
      throw = dice.nextNumber
      cardDealer = CardDealer.instance
      if throw == 1
        treasure = cardDealer.nextTreasure
        @hiddenTreasures << treasure
      elsif throw == 6
        for i in (1..3)
          treasure = cardDealer.nextTreasure
          @hiddenTreasures << treasure
        end
      else
        for i in (1..2)
          treasure = cardDealer.nextTreasure
          @hiddenTreasures << treasure
        end
      end
      
    end

    ##
    # Comprueba si el jugador actual tiene algún tesoro visible.
    #
    def hasVisibleTreasures()
      return (@visibleTreasures.empty? == false)
    end

    private :bringToLife, :incrementLevels, :decrementLevels
    private :die, :discardNecklaceIfVisible
    private :dieIfNoTreasures, :canIBuyLevels
    protected :computeGoldCoinsValue
    
    ##
    # Método que obtiene el nivel de combate del monstruo oponente
    #
    def getOpponentLevel(monster)
      return monster.getBasicValue
    end

    ##
    # Método que lanza el dado para ver si el jugador debe convertirse en sectario
    # o no después de perder un combate. Devolverá true en caso de que salga un 6
    # en el dado, y false en caso contrario.
    #
    def shouldConvert()
      dice = Dice.instance
      number = dice.nextNumber
      
      return (number == 6)
    
    end
    
    protected :getOpponentLevel, :shouldConvert
    
    #Examen
    def setVisibleTreasureList(treasures)
      @visibleTreasures = treasures
    end
    
    def setHiddenTreasureList(treasures)
      @hiddenTreasures = treasures
    end
    
    def to_s()
      return "Nombre: #{@name}, nivel: #{@level.to_i}\n\tNivel de combate: #{getCombatLevel}"
    end
    #fin
  end
end