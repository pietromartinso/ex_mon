defmodule ExMon.Game do
  use Agent

  def start(computer, player) do
    initial_value = %{computer: computer, player: player, turn: :player, status: :started}
    #Inicializa o agent, passando como parâmetroa função anônima que retorna o map initial_value
    #O agent é inicializado dentro deste módulo, ou seja, este módulo possui estado associado ao map
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def info do
    #para recuperar o restado, eu preciso saber de qual módulo estamos falando (ou o PID do agente/módulo), passamos uma função anônima (&) e então passamos qual é o estado do qual estamos nos referindo (parãmetro &1)
    Agent.get(__MODULE__, & &1)
  end

  def update(state) do
    Agent.update(__MODULE__, fn _ -> state end)
  end

  #função que retorna o jogador atual (no caso, o jogador que foi passado como parâmetro durante o start_game que, por sua vez, está armazenado dentro do mapping do Agent)
  def player, do: Map.get(info(), :player)

  def turn, do: Map.get(info(), :turn)

  def fetch_player(player), do: Map.get(info(), player)
end
