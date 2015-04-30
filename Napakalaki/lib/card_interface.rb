# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module CardInterface

  def getBasicValue()
    raise NotImplementedError.new
  end
  
  def getSpecialValue()
    raise NotImplementedError.new
  end
  
end
