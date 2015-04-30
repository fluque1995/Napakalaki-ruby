# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Model

  class Cultist
    def initialize(name, gainedLevels)
      @name = name
      @gainedLevels = gainedLevels
    end
    
    attr_reader :name
    attr_reader :gainedLevels
    
    def to_s()
      return "Nombre: #{@name}, niveles ganados: #{@gainedLevels.to_s}"
    end
  end
end
