#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Model
  class NumberBadConsequence < BadConsequence
    def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
      
      super(aText, someLevels, someVisibleTreasures, someHiddenTreasures, Array.new, Array.new, false)

    end
    
    public_class_method :new

    def isEmpty()
      return (@hiddenTreasures == 0 and @visibleTreasures == 0)
    end
    
    def substractVisibleTreasure(treasure)
      @visibleTreasures -= 1
    end
    
    def substractHiddenTreasure(treasure)
      @hiddenTreasures -= 1
    end
    
    def adjustToFitTreasureLists(visibleTreasuresArray, hiddenTreasuresArray)
      
      badConsequence = self.copy
      
      badConsequence.visibleTreasures = badConsequence.visibleTreasures < visibleTreasuresArray.size ?
                                          badConsequence.visibleTreasures : visibleTreasuresArray.size
      badConsequence.hiddenTreasures = badConsequence.hiddenTreasures < hiddenTreasuresArray.size ?
                                           badConsequence.hiddenTreasures : hiddenTreasuresArray.size

      return badConsequence
    end
    
    ##
    # Método que devuelve una copia exacta del mal rollo que llama a la función,
    # pero con identidad distinta. Este método es necesario para evitar modificar
    # el mal rollo asociado a los mostruos cuando estos se ajustan para ser cumplidos
    # por un jugador en el método BadConsequence.adjustToFitTreasureLists
    #
    def copy()
      
      badConsequence = NumberBadConsequence.new(@name, @levels, @visibleTreasures,
                                                             @hiddenTreasures)
      return badConsequence
    end
    
    def to_s()
      
      text = super
      text += "Texto: #{@text}\n\t\tNiveles: #{@levels}, tesoros visibles: #{@visibleTreasures}," +
             " tesoros ocultos: #{@hiddenTreasures}"
      return text
      
    end
    
  end
end
