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
  
  attr_reader :text
  attr_reader :levels
  attr_reader :visibleTreasures
  attr_reader :hiddenTreasures
  attr_reader :specificVisibleTreasures
  attr_reader :specificHiddenTreasures
  attr_reader :death
  
  private_class_method :new
  
  def newNumberOfTreasures(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
    badConsecuence = BadConsequence.new(aText, someLevels, someVisibleTreasures,
                     someHiddenTreasures, [], [], false)
    return badConsequence
  end
  
  def newSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, 
                           someSpecificHiddenTreasures)
      badConsequence = BadConsequence.new(aText, someLevels, someSpecificVisibleTreasures.size(),
                       someSpecificHiddenTreasures.size(), someSpecificVisibleTreasures,
                       someSpecificHiddenTreasures, false)
      return badConsequence
  end
  
  def newDeath(aText)
    badConsequence = BadConsequence.new(aText, 0, 0, 0, [], [], true)
    return badConsequence
  end
  
  def to_s()
    return "Texto: #{@text}, niveles: #{@levels}, tesoros visibles: #{@visibleTreasures}," +
           " tesoros ocultos: #{@hiddenTreasures}"
  end
end
