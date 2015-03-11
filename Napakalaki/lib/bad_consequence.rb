# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, 
                 someSpecificVisibleTreasures, someSpecificHiddenTreasures, death = false)
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
  
  def toString()
    return "Text = " + self.text + ", levels = " + self.levels.to_s + 
      ", visible treasures = " + self.visibleTreasures.to_s +
      ", hidden treasures = " + self.hiddenTreasures.to_s 
  end
end
