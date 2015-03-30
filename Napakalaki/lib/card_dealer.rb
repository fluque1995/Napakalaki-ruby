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
    
    @unusedMonsters = Array.new();
    prize = Prize.new(2,1)
    badConsequence = BadConsequence.newSpecificTreasures("Pierdes tu armadura visible y otra oculta",
                     0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
    @unusedMonsters << Monster.new("3 Byakhees de bonanza", 8, prize, badConsequence)

    prize = Prize.new(1,1)
    badConsequence = BadConsequence.newSpecificTreasures("Embobados con el lindo primigenio, te descartas" +
                     " de tu casco visible", 0, [TreasureKind::HELMET], [])
    @unusedMonsters << Monster.new("Chibithulhu", 2, prize, badConsequence)

    prize = Prize.new(1,1)
    badConsequence = BadConsequence.newSpecificTreasures("El primordial bostezo contagioso. " +
                     "Pierdes el calzado visible", 0, [TreasureKind::SHOE], [])
    @unusedMonsters << Monster.new("El sopor de Dunwich", 2, prize, badConsequence)

    prize = Prize.new(4,1)
    badConsequence = BadConsequence.newSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan " +
                      "caer en mitad del vuelo. Descarta una mano visible y otra oculta",
                      0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
    @unusedMonsters << Monster.new("Ángeles de la noche ibicenca", 14, prize, badConsequence)

    prize = Prize.new(3,1)
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes todos tus tesoros visibles", 0, 5, 0)
    @unusedMonsters << Monster.new("El gorrón en el umbral", 10, prize, badConsequence)

    prize = Prize.new(2,1)
    badConsequence = BadConsequence.newSpecificTreasures("Pierdes la armadura visible",
                      0, [TreasureKind::ARMOR], [])
    @unusedMonsters << Monster.new("H.P. Munchcraft", 6, prize, badConsequence)

    prize = Prize.new(1,1)
    badConsequence = BadConsequence.newSpecificTreasures("Sientes bichos bajo la ropa," +
                      " descarta tu armadura visible", 0, [TreasureKind::ARMOR], [])
    @unusedMonsters << Monster.new("Bichgooth", 2, prize, badConsequence)

    prize = Prize.new(4,2)
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles",
                      5, 3, 0)
    @unusedMonsters << Monster.new("El rey de rosa", 13, prize, badConsequence)

    prize = Prize.new(1,1)
    badConsequence = BadConsequence.newNumberOfTreasures("Toses los pulmones y pierdes 2 niveles",
                      2, 0, 0)
    @unusedMonsters << Monster.new("La que redacta en las tinieblas", 2, prize, badConsequence)

    prize = Prize.new(2,1)
    badConsequence = BadConsequence.newDeath("Estos monstruos resultan bastante " +
                      "superficiales y te aburren mortalmente. Estás muerto")
    @unusedMonsters << Monster.new("Los hondos", 8, prize, badConsequence)

    prize = Prize.new(2,1)
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes dos niveles y dos tesoros ocultos",
                      2, 0, 2)
    @unusedMonsters << Monster.new("Semillas Cthulhu", 4, prize, badConsequence)

    prize = Prize.new(2,1)
    badConsequence = BadConsequence.newSpecificTreasures("Te intentas escaquear. Pierdes una mano visible",
                      0, [TreasureKind::ONEHAND], [])
    @unusedMonsters << Monster.new("Dameargo", 1, prize, badConsequence)

    prize = Prize.new(1,1)
    badConsequence = BadConsequence.newNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles",
                      3, 0, 0)
    @unusedMonsters << Monster.new("Pollipólipo volante", 3, prize, badConsequence)

    prize = Prize.new(3,1)
    badConsequence = BadConsequence.newDeath("No le hace gracia que pronucien mal su" +
                      " nombre, estás muerto")
    @unusedMonsters << Monster.new("Yskhtihyssg-Goth", 12, prize, badConsequence)

    prize = Prize.new(4,1)
    badConsequence = BadConsequence.newDeath("La familia te atrapa. Estás muerto")
    @unusedMonsters << Monster.new("Familia feliz", 1, prize, badConsequence)

    prize = Prize.new(2,1)
    badConsequence = BadConsequence.newSpecificTreasures("La quinta directiva primaria " +
                     "te obliga a perder dos niveles y un tesoro de dos manos visible", 2,
                      [TreasureKind::BOTHHANDS], [])
    @unusedMonsters << Monster.new("Roboggoth", 8, prize, badConsequence)

    prize = Prize.new(1,1)
    badConsequence = BadConsequence.newSpecificTreasures("Te asusta en la noche. Pierdes" +
                      " un casco visible", 0, [TreasureKind::HELMET],[])
    @unusedMonsters << Monster.new("El espia", 5, prize, badConsequence)

    prize = Prize.new(1,1)
    badConsequence = BadConsequence.newNumberOfTreasures("Menudo susto te llevas. Pierdes" +
                      " 2 niveles y 5 tesoros visibles", 2, 5, 0)
    @unusedMonsters << Monster.new("El lenguas", 20, prize, badConsequence)

    prize = Prize.new(1,1)
    badConsequence = BadConsequence.newSpecificTreasures("Te faltan manos para tanta" +
                      " cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos",
                      3, [TreasureKind::ONEHAND, TreasureKind::BOTHHANDS],[])
    @unusedMonsters << Monster.new("Bicéfalo", 20, prize, badConsequence)

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
