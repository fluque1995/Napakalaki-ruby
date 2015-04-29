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

      return (@visibleTreasures == 0 and @hiddenTreasures == 0 and 
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
      if @visibleTreasures > 0
        @visibleTreasures -= 1
      else
        t = @specificVisibleTreasures.find_index(treasure.type)
        if t != nil
          @specificVisibleTreasures.delete_at(t)
        end
      end
    end

    ##
    # Quita al jugador un determinado tesoro oculto si éste lo posee
    #
    def substractHiddenTreasure(treasure)
      if @hiddenTreasures > 0
        @hiddenTreasures -= 1
      else
        t = @specificHiddenTreasures.find_index(treasure.type)
        if t != nil
          @specificHiddenTreasures.delete_at(t)
        end
      end
    end

    ##
    # Ajusta un determinado mal rollo a un mal rollo que pueda ser cumplido por 
    # un determinado jugador. Este método es necesario para que un jugador pueda
    # cumplir un mal rollo que le aplica un monstruo. Crea el mal rollo más cercano
    # al que el monstruo tiene y que puede ser cumplido por el jugador al que se
    # le aplica.
    #
    def adjustToFitTreasureLists(visibleTreasuresArray, hiddenTreasuresArray)
      
      badConsequence = self.copy()
      
      if not badConsequence.kills
        
        if badConsequence.visibleTreasures > 0 or badConsequence.hiddenTreasures > 0
          
          badConsequence.visibleTreasures = badConsequence.visibleTreasures < visibleTreasuresArray.size ?
                                            badConsequence.visibleTreasures : visibleTreasuresArray.size
          badConsequence.hiddenTreasures = badConsequence.hiddenTreasures < hiddenTreasuresArray.size ?
                                           badConsequence.hiddenTreasures : hiddenTreasuresArray.size
        
        else
          
          supportVisibles = visibleTreasuresArray.dup
          for t in badConsequence.specificVisibleTreasures
            found = false
            for treasure in supportVisibles
              if treasure.type == t and not found
               found = true
               index = supportVisibles.find_index(treasure)
              end
            end
            if not found
              index = badConsequence.specificVisibleTreasures.find_index(t)
              badConsequence.specificVisibleTreasures.delete_at(index)
            end
            supportVisibles.delete_at(index)
          end
          
          supportHiddens = hiddenTreasuresArray.dup
          for t in badConsequence.specificHiddenTreasures
            found = false
            for treasure in supportHiddens
              if treasure.type == t
                found = true
                index = supportHiddens.find_index(treasure)
              end
            end
            if not found
              index = badConsequence.specificHiddenTreasures.find_index(t)
              badConsequence.specificHiddenTreasures.delete_at(index)
            end
            supportHiddens.delete_at(index)
          end  
        end
      end
      
      return badConsequence
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
    
    ##
    # Método que devuelve una copia exacta del mal rollo que llama a la función,
    # pero con identidad distinta. Este método es necesario para evitar modificar
    # el mal rollo asociado a los mostruos cuando estos se ajustan para ser cumplidos
    # por un jugador en el método BadConsequence.adjustToFitTreasureLists
    #
    def copy()
      if @death == true
        badConsequence = BadConsequence.newDeath(@name)
      elsif @visibleTreasures > 0 or @hiddenTreasures > 0
        badConsequence = BadConsequence.newNumberOfTreasures(@name, @levels, @visibleTreasures,
                                                             @hiddenTreasures)
      else
        badConsequence = BadConsequence.newSpecificTreasures(@name, @levels, @specificVisibleTreasures.dup,
                                                             @specificHiddenTreasures.dup)
      end
      
      return badConsequence
    end
    
    protected :copy
  end
end

