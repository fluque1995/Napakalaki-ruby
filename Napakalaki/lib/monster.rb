# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
# encoding: UTF-8


module Model

  class Monster
    def initialize (name, combatLevel, prize, badConsequence)

      @name = name
      @combatLevel = combatLevel
      @prize = prize
      @badConsequence = badConsequence

    end

    attr_reader :name, :combatLevel, :prize, :badConsequence

    def to_s()
      return "Nombre: #{@name}, nivel de combate: #{@combatLevel}\n\tPremio: #{@prize}\n" +
             "\tMal rollo: #{@badConsequence.to_s}"
    end
  end
end
