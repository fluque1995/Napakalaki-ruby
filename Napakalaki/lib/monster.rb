# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
  def initialize (name, combatLevel, prize, badConsequence)
    
    @name = name
    @combatLevel = combatLevel
    @prize = prize
    @badConsequence = badConsequence
    
  end
  
  attr_reader :name
  attr_reader :combatLevel
  attr_reader :prize
  attr_reader :badConsequence
  
  def to_s()
    return "Nombre: #{@name}, nivel de combate: #{@combatLevel}, premio: #{@prize}," +
           " mal rollo: #{@badConsequence.to_s}"
  end
end
