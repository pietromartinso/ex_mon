defmodule ExMon.Game.Status do
  alias ExMon.Game
  def print_round_message() do
    IO.puts("\n======= The game has started. =======\n")
    IO.inspect(Game.info())
    IO.puts("-------------------------------------\n")
  end
end
