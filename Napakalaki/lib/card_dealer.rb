# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class CardDealer
  include Singleton
  
  def initialize()
    @unusedMonsters = nil
    @usedMonsters = nil
    @unusedTreasures = nil
    @usedTreasures = nil 
    
  end
  
  def initTreasuresCardDeck()
    
  end
  
  def initMonsterCardDeck()
    
  end
  
  def shuffleTreasures()
    
  end
  
  def shuffleMonsters()
    
  end
  
  private_class_method :initTreasuresCardDeck, :initMonstersCardDeck
  pricate_class_method :shuffleTreasures, :shuffleMonsters
  
  def nextTreasure()
    
  end
  
  def nextMonster()
    
  end
  
  def giveTreasureBack(t)
    
  end
  
  def giveMonsterBack(m)
    
  end
  
  def initCards()
    
  end
  
end
