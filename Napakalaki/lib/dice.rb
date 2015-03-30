# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'Random'

module Model

  class Dice
    include Singleton

    def initialize
      @dice = Random.new
    end

    def nextNumber()
      return 1+@dice.rand(6)
    end

  end
end
