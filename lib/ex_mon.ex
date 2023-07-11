defmodule ExMon do
  # Renomeando ExMon.Player para apenas Player
  alias ExMon.{Game, Player}
  alias ExMon.Game.Status

  @computer_name "Robotinik"

  def create_player(name, move_avg, move_rnd, move_heal) do
    Player.build(name, move_avg, move_rnd, move_heal)
  end

  def start_game(player) do
    @computer_name
    |> create_player(:punch, :kick, :heal)
    |> Game.start(player)

    Status.print_round_message()
  end

  # 29, 01:46
  # def make_move(move) do
  #   Actions.fetch_move(move)
  # end
end
