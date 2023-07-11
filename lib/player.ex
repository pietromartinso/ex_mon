defmodule ExMon.Player do

  #Força os campos da struct que precisam ser preenchidos (not null)
  @required_keys [:life, :move_avg, :move_heal, :move_rnd, :name]

  @enforce_keys @required_keys
  # Define a struct
  defstruct @required_keys

  @max_life 100

  #Cria uma nova struct
  def build(name, move_rnd, move_avg, move_heal) do
    %ExMon.Player{
      life: @max_life,
      move_avg: move_avg,
      move_heal: move_heal,
      move_rnd: move_rnd,
      name: name
    }
  end
end
