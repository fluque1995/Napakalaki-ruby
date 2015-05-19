#encoding: utf-8
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

      badConsequence = self.copy
      
      supportVisibles = visibleTreasuresArray.dup
      for t in badConsequence.specificVisibleTreasures
        found = false
        for treasure in supportVisibles
          if treasure.type == t and not found
           found = true
           treasure_index = supportVisibles.find_index(treasure)
          end
        end
        if not found
          index = badConsequence.specificVisibleTreasures.find_index(t)
          badConsequence.specificVisibleTreasures.delete_at(index)
        else
          supportVisibles.delete_at(treasure_index)
        end
      end

      supportHiddens = hiddenTreasuresArray.dup
      for t in badConsequence.specificHiddenTreasures
        found = false
        for treasure in supportHiddens
          if treasure.type == t
            found = true
            treasure_index = supportHiddens.find_index(treasure)
          end
        end
        if not found
          index = badConsequence.specificHiddenTreasures.find_index(t)
          badConsequence.specificHiddenTreasures.delete_at(index)
        else
          supportHiddens.delete_at(treasure_index)
        end
      end
      
      return badConsequence
    end
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
