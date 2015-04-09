# encoding: UTF-8
# Main module of the Napakalaki project

require 'singleton'

module Model

  ##
  # Clase que representa el dado que se usa en la partida. Es una clase de tipo
  # singleton, ya que no interesa tener más de un dado en el juego. Básicamente 
  # se utiliza para decidir el orden de juego al principio de la partida y para 
  # decidir el resultado de un combate cuando el jugador pierde (dependiendo de 
  # la tirada, el jugador podrá escapar del monstruo o no).
  #
  class Dice
    include Singleton

    ##
    # Inicializa la instancia del dado.
    #
    def initialize
      
    end

    ##
    # Genera una nueva tirada del dado. Genera un número aleatorio entre 1 y 6.
    #
    def nextNumber()
      return 1+ rand(6)
    end

  end
end
