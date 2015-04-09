# encoding: UTF-8
# Main module of the Napakalaki project

module Model

  ##
  # Clase que representa el mal rollo que te produce un monstruo cuando pierdes 
  # un combate contra él. Esta clase sirve de apoyo a la clase Monster.
  #
  class BadConsequence

    public
    def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, 
                   someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
      @text = aText
      @levels = someLevels
      @visibleTreasures = someVisibleTreasures
      @hiddenTreasures = someHiddenTreasures
      @specificVisibleTreasures = someSpecificVisibleTreasures
      @specificHiddenTreasures = someSpecificHiddenTreasures
      @death = death
    end

    # Texto que representa al mal rollo
    attr_reader :text
    # Niveles que pierdes contra el monstruo
    attr_reader :levels
    # Tesoros visibles que pierdes contra el monstruo
    attr_reader :visibleTreasures
    # Tesoros ocultos que pierdes contra el monstruo
    attr_reader :hiddenTreasures
    # Array de tesoros visibles específicos que pierdes contra el monstruo
    attr_reader :specificVisibleTreasures
    # Array de tesoros ocultos específicos que pierdes contra el monstruo
    attr_reader :specificHiddenTreasures

    private_class_method :new
    
    ##
    # Constructor para el tipo de mal rollo que implica la pérdida de  un número
    # de niveles y tesoros.
    # 
    # Atributos:
    # - aText: Texto que representa el mal rollo
    # - someLevels: Niveles que se pierden
    # - someVisibleTreasures: Tesoros visibles que se pierden
    # - someHiddenTreasures: Tesoros ocultos que se pierden
    #
    def self.newNumberOfTreasures(aText, someLevels, someVisibleTreasures, 
                                            someHiddenTreasures)
      return new(aText, someLevels, someVisibleTreasures,
                       someHiddenTreasures, [], [], false)
    end

    ##
    # Constructor para el tipo de mal rollo que implica la pérdida de tesoros 
    # específicos.
    # 
    # Atributos:
    # - aText: Texto que representa el mal rollo
    # - someLevels Niveles que se pierden
    # - someSpecificVisibleTreasures: Tesoros visibles específicos que se pierden
    # - someSpecificHiddenTreasures: Tesoros ocultos específicos que se pierden
    #
    def self.newSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, 
                             someSpecificHiddenTreasures)
      return new(aText, someLevels, 0, 0, someSpecificVisibleTreasures,
                         someSpecificHiddenTreasures, false)
    end

    ##
    # Constructor para el tipo de mal rollo que implica la muerte del jugador
    # 
    # Atributos:
    # - aText: Texto que representa el mal rollo
    #
    def self.newDeath(aText)
      return new(aText, 0, 0, 0, [], [], true)
    end

    ##
    # Método que comprueba si el mal rollo está vacío, es decir, si no tiene nada
    # que aplicar
    #
    def isEmpty()

      return (@levels == 0 and @visibleTreasures == 0 and @hiddenTreasures == 0 and 
          (@specificVisibleTreasures == nil or @specificVisibleTreasures.empty?) and 
          (@specificHiddenTreasures == nil or @specificHiddenTreasures.empty?) and 
          @death == false)

    end

    ##
    # Método que comprueba si el mal rollo implica la muerte del jugador. Funciona
    # como un getter del atributo death
    #
    def kills()
      return @death
    end

    ##
    # Quita al jugador un determinado tesoro visible si éste lo posee
    #
    def substractVisibleTreasure(treasure)

    end

    ##
    # Quita al jugador un determinado tesoro oculto si éste lo posee
    #
    def substractHiddenTreasure(treasure)

    end

    def adjustToFitTreasureLists(visibleTreasures, hiddenTreasures)

    end
    
    ##
    # Método que devuelve en un string la información completa del monstruo. Sirve
    # para trazar errores.
    #
    def to_s()
      printable_text = "Texto: #{@text}\n\t\tNiveles: #{@levels}, tesoros visibles: #{@visibleTreasures}," +
             " tesoros ocultos: #{@hiddenTreasures}"

      if (specificVisibleTreasures.empty? == false)
        printable_text += "\n\t\tTesoros visibles específicos: "
        for treasure in specificVisibleTreasures
          printable_text += treasure.to_s + ", "
        end
      end

      if (specificHiddenTreasures.empty? == false)
        printable_text += "\n\t\tTesoros ocultos específicos: "
        for treasure in specificHiddenTreasures
          printable_text += treasure.to_s + ", "  
        end
      end

      return printable_text
    end

  end
end
