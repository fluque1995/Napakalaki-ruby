# encoding: UTF-8
# Main module of the Napakalaki project

module Model
  
  require_relative "treasure_kind.rb"
  ##
  # Clase que representa una carta de tesoro del juego. Estas cartas se obtienen
  # robando cartas del mazo de tesoros al principio de la partida, o al vencer en 
  # combate contra un monstruo.
  #
  class Treasure
    
    ##
    # Inicializa una carta de tesoros, especificando los siguientes atributos:
    # - name: Nombre del tesoro
    # - goldCoins: Monedas de oro que cuesta
    # - minBonus: Bonus mínimo de niveles que otorga
    # - maxBonux: Bonus máximo de niveles que otorga 
    # - type: Tipo de tesoro. Los tipos de tesoro posibles vienen especificados 
    # en el módulo TreasureKind
    #
    def initialize(name, goldCoins, minBonus, maxBonus, type)
      @name = name
      @goldCoins = goldCoins
      @minBonus = minBonus
      @maxBonus = maxBonus
      @type = type
    end

    # Nombre del tesoro
    attr_reader :name
    # Precio en monedas de oro
    attr_reader :goldCoins
    # Bonus mínimo que otorga
    attr_reader :minBonus
    # Bonus máximo que otorga
    attr_reader :maxBonus
    
    # Tipo de tesoro
    def getType()
      return @type
    end
    
    # Tipo de tesoro
    attr_reader :type
    
    ##
    # Devuelve en un string toda la información relativa al tesoro. Sirve para 
    # trazar errores
    #
    def to_s()
      return "Nombre: #{@name}, precio: #{@goldCoins}, bonus mínimo: #{@minBonus},
              bonus máximo: #{@maxBonus}, tipo: #{@type.to_s}" 
    end

  end

end
