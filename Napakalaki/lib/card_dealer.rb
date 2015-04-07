# encoding: UTF-8
# Main module of the Napakalaki project

module Model

  ##
  # Clase que permite mantener los dos tipos de mazos de cartas que hay en el juego.
  # 
  # Estos dos mazos son:
  # - Mazo con las cartas de monstruos. Se compone de objetos de la clase Monster.
  # - Mazo con las cartas de tesoros. Se compone de objetos de la clase Treasure.
  # 
  # Esta clase se encarga de la gestión completa de ambos mazos de cartas, inicializarlos,
  # barajarlos y repartir las cartas a los jugadores.
  # 
  # Es una clase de tipo singleton, ya que no interesa tener más de una instancia 
  # de dicha clase en cada juego.
  #
  class CardDealer
    include Singleton

    ##
    # Inicializa la instancia de la clase, inicializando los mazos de cartas que se
    # manejan.
    #
    def initialize()
      @unusedMonsters = nil
      @usedMonsters = nil
      @unusedTreasures = nil
      @usedTreasures = nil 

    end
    
    ##
    # Inicializa el mazo de cartas de tesoros.
    #
    def initTreasuresCardDeck()


      @unusedTreasures = Array.new

      @unusedTreasures << Treasure.new("¡Sí mi amo!", 0, 4, 7, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Botas de investigación", 600, 3, 4, TreasureKind::SHOE)
      @unusedTreasures << Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::HELMET)   
      @unusedTreasures << Treasure.new("A prueba de babas", 400, 2, 5, TreasureKind::ARMOR)   
      @unusedTreasures << Treasure.new("Botas de lluvia ácida", 800, 1, 1, TreasureKind::SHOE)   
      @unusedTreasures << Treasure.new("Casco minero", 400, 2, 4, TreasureKind::HELMET)   
      @unusedTreasures << Treasure.new("Ametralladora Thompson", 600, 4, 8, TreasureKind::BOTHHANDS)   
      @unusedTreasures << Treasure.new("Camiseta de la UGR", 100, 1, 7, TreasureKind::ARMOR)   
      @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 400, 3, 6, TreasureKind::ONEHAND)   
      @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 300, 2, 3, TreasureKind::ONEHAND)   
      @unusedTreasures << Treasure.new("Fez alópodo", 700, 3, 5, TreasureKind::HELMET)   
      @unusedTreasures << Treasure.new("Hacha prehistórica", 500, 2, 5, TreasureKind::ONEHAND)   
      @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 900, 4, 8, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Gaita", 500, 4, 5, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Insecticida", 300, 2, 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Escopeta de tres cañones", 700, 4, 6, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Garabato místico", 300, 2, 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("La fuerza de Mr. T", 1000, 0, 0, TreasureKind::NECKLACE)
      @unusedTreasures << Treasure.new("La rebeca metálica", 400, 2, 3, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Mazo de los antiguos", 200, 3, 4, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necroplayboycon", 300, 3, 5, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Lanzallamas", 800, 4, 8, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Necrocomicón", 100, 1, 1, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necronomicón", 800, 5, 7, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Linterna a dos manos", 400, 3, 6, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Necrognomicón", 200, 2, 4, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necrotelecom", 300, 2, 3, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Porra preternatural", 200, 2, 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Tentáculo de pega", 200, 0, 1, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Zapato deja-amigos", 500, 0, 1, TreasureKind::SHOE)
      @unusedTreasures << Treasure.new("Shogulador", 600, 1, 1, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Varita de atizamiento", 400, 3, 4, TreasureKind::ONEHAND)

    end

    ##
    # Inicializa el mazo de cartas de monstruos
    #
    def initMonsterCardDeck()

      @unusedMonsters = Array.new();
      prize = Prize.new(2,1)
      badConsequence = BadConsequence.newSpecificTreasures("Pierdes tu armadura visible y otra oculta",
                       0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
      @unusedMonsters << Monster.new("3 Byakhees de bonanza", 8, prize, badConsequence)

      prize = Prize.new(4,1)
      badConsequence = BadConsequence.newSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan " +
                        "caer en mitad del vuelo. Descarta una mano visible y otra oculta",
                        0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
      @unusedMonsters << Monster.new("Ángeles de la noche ibicenca", 14, prize, badConsequence)

      prize = Prize.new(3,1)
      badConsequence = BadConsequence.newNumberOfTreasures("Pierdes todos tus tesoros visibles", 0, 5, 0)
      @unusedMonsters << Monster.new("El gorrón en el umbral", 10, prize, badConsequence)

      @unusedMonsters = Array.new
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

    ##
    # Baraja el mazo de cartas de tesoros
    #
    def shuffleTreasures()
      @unusedTreasures.shuffle!
    end

    ##
    # Baraja el mazo de cartas de monstruos
    #
    def shuffleMonsters()
      @unusedMonsters.shuffle!
    end

    private_class_method :initTreasuresCardDeck, :initMonstersCardDeck
    pricate_class_method :shuffleTreasures, :shuffleMonsters

    ##
    # Devuelve el siguiente tesoro del mazo de cartas de tesoros. Si tras la 
    # extracción de dicho tesoro el mazo de tesoros queda vacío, se coge el mazo
    # de descartes de tesoros, se devuelve al mazo de tesoros y se baraja.
    #
    def nextTreasure()

    end

    ##
    # Devuelve el siguiente monstruo del mazo de cartas de monstruos. Si tras la 
    # extracción de dicho monstruo el mazo queda vacío, se coge el mazo
    # de descartes de monstruos, se devuelve al mazo de monstruos y se baraja.
    #
    def nextMonster()

    end

    ##
    # Devuelve el tesoro que estaba en juego al mazo de descartes de tesoros.
    #
    def giveTreasureBack(treasure)
      @usedTreasures << treasure
    end

    ##
    # Devuelve el monstruo en juego al mazo de descartes de monstruos.
    #
    def giveMonsterBack(monster)
      @usedMonsters << monster
    end

    ##
    # Inicializa los mazos de cartas.
    #
    def initCards()

    end

  end
end
