defmodule ExMon.Game.Actions do
  alias ExMon.Game
  alias ExMon.Game.Actions.{Attack, Heal}



  def attack(move) do
    case Game.turn() do
      :player -> Attack.attack_opponnent(:computer, move)
      :computer -> Attack.attack_opponnent(:player, move)
    end
  end

  def heal() do
    case Game.turn() do
      :player -> Heal.heal_life(:player)
      :computer -> Heal.heal_life(:computer)
    end
  end

  def fetch_move(move) do
    Game.player()
    |> Map.get(:moves)
    |> find_move(move)
  end

  defp find_move(moves, move) do
    # Olha dentro do enum moves, se não encontrar nada (default), retorna :error, caso contrário, tenta associar a chave e o valor e retorna a chave caso o valor seja igual ao move passado como parâmetro
    # Os parâmetros da função anônima estão associados à sintaxe de tuplas, já que cada posição do map moves é uma tupla com "key: value"
    Enum.find_value(moves, {:error, move}, fn {key, value} ->
      if value == move, do: {:ok, key} #[DÚVIDA] não dava pra resolver isso aqui com pattern matching?
    end)
  end
end
