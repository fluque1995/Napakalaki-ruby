# encoding: UTF-8
# Main module of the Napakalaki project

module Model

  ##
  # Módulo que controla los distintos resultados posibles dentro de un combate
  # entre un jugador (Objeto de la clase Player) y un monstruo (Objeto de la clase
  # Monster). Dependiendo del resultado del combate, se han de ajustar distintos
  # parámetros posteriormente.
  #
  module CombatResult
    
    # El jugador gana el combate y la partida
    WINANDWINGAME= :WINANDWINGAME
    # El jugador gana el combate
    WIN= :WIN
    # El jugador pierde el combate y no consigue escapar
    LOSE= :LOSE
    # El jugador pierde el combate pero escapa
    LOSEANDESCAPE= :LOSEANDESCAPE
    # El jugador pierde el combate y el monstruo lo mata
    LOSEANDDIE= :LOSEANDDIE
    # El jugador pierde el combate, se le aplica el mal rollo pero se convierte 
    # en sectario
    LOSEANDCONVERT= :LOSEANDCONVERT
  end
end
