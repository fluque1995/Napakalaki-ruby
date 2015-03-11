# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Prize
  def initialize(treasures, levels)
    @treasures = treasures
    @levels = levels
  end
  
  attr_reader :treasures
  attr_reader :levels
  
  def toString()
    return "Treasures = " + self.treasures.to_s + ", levels = " + self.levels.to_s
  end
end
