defmodule ExMon.Game.Actions.Heal do
  alias ExMon.Game
  alias ExMon.Game.Status

  @heal_power 18..25

  def heal_life(player) do
    life_heal = calculate_heal_power()

    player
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(life_heal)
    |> update_player_life(player)
  end

  defp calculate_heal_power(), do: Enum.random(@heal_power)

  defp calculate_total_life(life, life_heal) when life + life_heal > 100, do: 100
  defp calculate_total_life(life, life_heal), do: life + life_heal

  defp update_player_life(life, player) do
    player
    |> Game.fetch_player()
    |> Map.put(:life, life)
    |> update_game(player, life)
  end

  defp update_game(player_data, player, life) do
    Game.info
    |> Map.put(player, player_data)
    |> Game.update()

    Status.print_move_message(player, :heal, life)
  end
end
