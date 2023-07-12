defmodule ExMon.Game.Status do
  alias ExMon.Game
  def print_round_message() do
    IO.puts("\n======= The game has started. =======\n")
    IO.inspect(Game.info())
    IO.puts("-------------------------------------\n")
  end

  def print_wrong_move_message(move), do: IO.puts("\n======= Invalid move: #{move}. =======\n")

  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n======= The Player has attacked the Computer dealing: #{damage} damage. =======\n")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("\n======= The Computer has attacked the Player dealing: #{damage} damage. =======\n")
  end


end
