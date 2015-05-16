# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Model
  class SpecificBadConsequence < BadConsequence
    def initialize(aText, someLevels, someSpecificVisibleTreasures, 
                   someSpecificHiddenTreasures)
      super(aText, someLevels, 0, 0, someSpecificVisibleTreasures, someSpecificHiddenTreasures, false)
=begin  
      @text = aText
      @levels = someLevels
      @visibleTreasures = 0
      @hiddenTreasures = 0
      @specificVisibleTreasures = someSpecificVisibleTreasures
      @specificHiddenTreasures = someSpecificHiddenTreasures
      @death = false
    
=end
    end
    
    public_class_method :new
    
        
    ##
    # Método que devuelve una copia exacta del mal rollo que llama a la función,
    # pero con identidad distinta. Este método es necesario para evitar modificar
    # el mal rollo asociado a los mostruos cuando estos se ajustan para ser cumplidos
    # por un jugador en el método BadConsequence.adjustToFitTreasureLists
    #
    def copy()
      badConsequence = SpecificBadConsequence.new(@name, @levels, @specificVisibleTreasures.dup,
                                                             @specificHiddenTreasures.dup)
      return badConsequence
    end
    

  end
end
