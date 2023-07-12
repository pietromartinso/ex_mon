defmodule ExMon.Game.Status do
  def print_round_message(%{status: :started} = info) do
    IO.puts("\n======= The game has started. =======\n")
    IO.inspect(info)
    IO.puts("-------------------------------------\n")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n======= It's #{player} turn. =======\n")
    IO.inspect(info)
    IO.puts("-------------------------------------\n")
  end

  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\n======= The Game is Over =======\n")
    IO.inspect(info)
    IO.puts("-------------------------------------\n")
  end

  def print_wrong_move_message(move), do: IO.puts("\n======= Invalid move: #{move}. =======\n")

  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n======= The Player has attacked the Computer dealing: #{damage} damage. =======\n")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("\n======= The Computer has attacked the Player dealing: #{damage} damage. =======\n")
  end

  def print_move_message(player, :heal, life) do
    IO.puts("\n======= #{player} healed itself by: #{life} life points. =======\n")
  end


end
