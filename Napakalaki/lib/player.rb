# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Player
  def initialize(name)
    @name = name
    @dead = true
    @level = 1
    @hiddenTreasures = 0
    @visibleTreasures = 0
    @pendingBadConsequence = nil
  end
  
 @@MAXHIDDENTREASURES = 4
  
  def bringToLive()
    
  end
    
  def incrementLevels(l)
    
  end
  
  def decrementLevels(l)
    
  end
  
  def setPendingBadConsquence(b)
    
  end
  
  def die()
    
  end
  
  def discardNecklaceIfVisible()
    
  end
  
  def dieIfNoTreasures()
    
  end
  
  def canIBuyLevels(l)
    
  end
  
  def computeGoldCoinsValue(t)
    
  end
  
  def applyPrize(p)
    
  end
  
  def combat(m)
    
  end
  
  def applyBadConsequence(bad)
    
  end
  
  def makeTreasureVisible(t)
    
  end
  
  def canMakeTreasureVisible(t)
    
  end
  
  def discardVisibleTreasure(t)
    
  end
  
  def discardHiddenTreasure(t)
    
  end
  
  def buyLevels(visible, hidden)
    
  end
  
  def getCombatLevel()
    
  end
  
  def validState()
    
  end
  
  def initTreasures()
    
  end
  
  def isDead()
    
  end
  
  def hasVisibleTreasures()
    
  end
  
  attr_reader :visibleTreasures, :hiddenTreasures
   
  private_class_method :bringToLive, :incrementLevels, :decrementLevels
  private_class_method :setPendingBadConsequence, :die, :discardNecklaceIfVisible
  private_class_method :dieIfNoTreasures, :canIBuyLevels
  protected_class_method :computeGoldCoinsValue
  
end
