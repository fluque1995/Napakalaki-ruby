# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Model
  class NumberBadConsequence < BadConsequence
    def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
      @text = aText
      @levels = someLevels
      @visibleTreasures = someVisibleTreasures
      @hiddenTreasures = someHiddenTreasures
      @specificVisibleTreasures = []
      @specificHiddenTreasures = []
      @death = false
    end
    
    public_class_method :new
    
        
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
    

  end
end
