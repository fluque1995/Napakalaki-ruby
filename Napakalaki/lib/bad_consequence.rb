# encoding: UTF-8
# Main module of the Napakalaki project

module Model
  
  require_relative "treasure_kind.rb"
  require_relative "treasure.rb"

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
    attr_accessor :text
    # Niveles que pierdes contra el monstruo
    attr_accessor :levels
    # Tesoros visibles que pierdes contra el monstruo
    attr_accessor :visibleTreasures
    # Tesoros ocultos que pierdes contra el monstruo
    attr_accessor :hiddenTreasures
    # Array de tesoros visibles específicos que pierdes contra el monstruo
    attr_accessor :specificVisibleTreasures
    # Array de tesoros ocultos específicos que pierdes contra el monstruo
    attr_accessor :specificHiddenTreasures

    private_class_method :new

    ##
    # Método que comprueba si el mal rollo está vacío, es decir, si no tiene nada
    # que aplicar
    #
    def isEmpty()

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

    ##
    # Ajusta un determinado mal rollo a un mal rollo que pueda ser cumplido por 
    # un determinado jugador. Este método es necesario para que un jugador pueda
    # cumplir un mal rollo que le aplica un monstruo. Crea el mal rollo más cercano
    # al que el monstruo tiene y que puede ser cumplido por el jugador al que se
    # le aplica.
    #

    def adjustToFitTreasureLists(visibleTreasuresArray, hiddenTreasuresArray)

    end
   
    ##
    # Método que devuelve en un string la información completa del monstruo. Sirve
    # para trazar errores.
    #
    def to_s()

      return "Esto es un mal rollo con las siguientes consecuencias:\n\t"

    end
    
    ##
    # Método que devuelve una copia exacta del mal rollo que llama a la función,
    # pero con identidad distinta. Este método es necesario para evitar modificar
    # el mal rollo asociado a los mostruos cuando estos se ajustan para ser cumplidos
    # por un jugador en el método BadConsequence.adjustToFitTreasureLists
    #
    def copy()
      
    end
    
    protected :copy
  end
end

