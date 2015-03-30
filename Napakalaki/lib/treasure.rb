# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


module Model

  class Treasure
    def initialize(n, g, min, max, t)
      @name = n
      @goldCoins = g
      @minBonus = min
      @maxBonus = max
      @type = t
    end

    attr_reader :name
    attr_reader :goldCoins, :minBonus, :maxBonus
    attr_reader :type

  end
end
