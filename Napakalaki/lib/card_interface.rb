# Module used to simulate an interface for cards

module CardInterface

  ##
  # Método que devuelve el valor básico de la carta.
  #
  def getBasicValue()
    raise NotImplementedError.new
  end
  
  ##
  # Método que devuelve el valor especial de la carta.
  #
  def getSpecialValue()
    raise NotImplementedError.new
  end
  
end
