#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Model
  class SpecificBadConsequence < BadConsequence
    def initialize(aText, someLevels, someSpecificVisibleTreasures, 
                   someSpecificHiddenTreasures)

      super(aText, someLevels, 0, 0, someSpecificVisibleTreasures, someSpecificHiddenTreasures, false)

    end
    
    public_class_method :new

    def isEmpty()
      return ((@specificVisibleTreasures == nil or @specificVisibleTreasures.empty?) and 
             (@specificHiddenTreasures == nil or @specificHiddenTreasures.empty?))
    end

    def substractVisibleTreasure(treasure)
      t = @specificVisibleTreasures.find_index(treasure.type)
      if t != nil
        @specificVisibleTreasures.delete_at(t)
      end
    end
    
    def substractHiddenTreasure(treasure)
      t = @specificHiddenTreasures.find_index(treasure.type)
        if t != nil
          @specificHiddenTreasures.delete_at(t)
        end
    end
    
    def adjustToFitTreasureLists(visibleTreasuresArray, hiddenTreasuresArray)
      
      supportVisibles = visibleTreasuresArray.dup
      visibleTreasuresToKeep = Array.new
      
      for treasureKind in @specificVisibleTreasures
        
        treasureToRemove = nil
        
        for treasure in supportVisibles
        
          if treasure.type == treasureKind
            
           treasureToRemove = treasure
           
          end
        
        end
        
        if treasureToRemove != nil
        
          supportVisibles.delete(treasureToRemove)
          visibleTreasuresToKeep << treasureKind
        
        end
      
      end

      supportHiddens = hiddenTreasuresArray.dup
      hiddenTreasuresToKeep = Array.new
      
      for treasureKind in @specificHiddenTreasures
        
        treasureToRemove = nil
        
        for treasure in supportHiddens
      
          if treasure.type == treasureKind
          
            treasureToRemove = treasure
          
          end
        
        end
        
        if treasureToRemove != nil
          
          supportHiddens.delete(treasureToRemove)
          hiddenTreasuresToKeep << treasureKind
          
        end
      end
      
      return SpecificBadConsequence.new(@text, @levels, visibleTreasuresToKeep, hiddenTreasuresToKeep)
    end
    ##
    # Método que devuelve una copia exacta del mal rollo que llama a la función,
    # pero con identidad distinta. Este método es necesario para evitar modificar
    # el mal rollo asociado a los mostruos cuando estos se ajustan para ser cumplidos
    # por un jugador en el método BadConsequence.adjustToFitTreasureLists
    #
    def copy()
      
      badConsequence = SpecificBadConsequence.new(@text, @levels, @specificVisibleTreasures.dup,
                                                             @specificHiddenTreasures.dup)
      
      return badConsequence
      
    end
    
    def to_s
      
      text = super
      text += "Texto: #{@text}\n\t\tNiveles: #{@levels}"
      
      if (@specificVisibleTreasures.empty? == false)
        text += "\n\t\tTesoros visibles específicos: "
        for treasure in @specificVisibleTreasures
          text += treasure.to_s + ", "
        end
      end

      if (@specificHiddenTreasures.empty? == false)
        text += "\n\t\tTesoros ocultos específicos: "
        for treasure in @specificHiddenTreasures
          text += treasure.to_s + ", "  
        end
      end

      return text
    end
  end
end
