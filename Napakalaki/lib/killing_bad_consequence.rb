#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "bad_consequence.rb"

module Model
  
  class KillingBadConsequence < BadConsequence
  
    def initialize(aText)

      super(aText, 0, 0, 0, Array.new, Array.new, true)

    end

    public_class_method :new
    
    def isEmpty()
      return true
    end
    
    def adjustToFitTreasureLists()
      
      badConsequence = self.copy()
      return badConsequence
      
    end
    
    ##
    # Método que devuelve una copia exacta del mal rollo que llama a la función,
    # pero con identidad distinta. Este método es necesario para evitar modificar
    # el mal rollo asociado a los mostruos cuando estos se ajustan para ser cumplidos
    # por un jugador en el método BadConsequence.adjustToFitTreasureLists
    #
    def copy()
      
      badConsequence = KillingBadConsequence.new(@text)
      return badConsequence
    
    end
    
    def to_s()
      
      text = super
      text += "Texto: #{@text}"
      return text
      
    end
  end
end
