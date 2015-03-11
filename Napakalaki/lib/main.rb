# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "prize.rb"
require_relative "monster.rb"
require_relative "bad_consequence.rb"
require_relative "treasure_kind.rb"

prize = Prize.new(2,1)

badConsequence = BadConsequence.new("Pierdes tu armadura visible y otra oculta",
                        0, 1, 1, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])

monster = Monster.new("3 Byakhees de bonanza", 8, prize, badConsequence)

puts monster.toString()
                      