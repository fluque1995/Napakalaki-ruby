# encoding: UTF-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
  
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
  
  attr_reader :text, :levels, :visibleTreasures, :hiddenTreasures
  attr_reader :specificVisibleTreasures, :specificHiddenTreasures
  
  private_class_method :new
  
  def self.newNumberOfTreasures(aText, someLevels, someVisibleTreasures, 
                                          someHiddenTreasures)
    return new(aText, someLevels, someVisibleTreasures,
                     someHiddenTreasures, [], [], false)
  end
  
  def self.newSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, 
                           someSpecificHiddenTreasures)
    return new(aText, someLevels, 0, 0, someSpecificVisibleTreasures,
                       someSpecificHiddenTreasures, false)
  end
  
  def self.newDeath(aText)
    return new(aText, 0, 0, 0, [], [], true)
  end
    
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
  
  def isEmpty()
  end
  
  def kills()
    return @death
  end

  def substractVisibleTreasure(t)
    
  end
  
  def substractHiddenTreasure(t)
    
  end
  
  def adjustToFitTreasureLists(v, h)
    
  end
  
end
