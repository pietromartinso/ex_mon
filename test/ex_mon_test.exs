defmodule ExMonTest do
  use ExUnit.Case

  # para poder recuperar o output do puts como resultado do teste
  import ExUnit.CaptureIO

  alias ExMon.Player

  describe "create_player/4" do
    test "returns a player" do
      expected_response = %Player{
        life: 100,
        moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
        name: "Jeremias"
      }

      assert expected_response == ExMon.create_player("Jeremias", :soco, :chute, :cura)
    end
  end

  describe "start_game/1" do
    test "when game starts, returns a message" do
      player = Player.build("Jeremias", :soco, :chute, :cura)

      messages =
        capture_io(fn ->
          assert ExMon.start_game(player) == :ok
        end)

      assert messages =~ "The game has started."
      assert messages =~ "status: :started"
      assert messages =~ "turn: :player"
    end
  end

  describe "make_move/1" do
    setup do
      capture_io(fn ->
        ExMon.create_player("Jeremias", :soco, :chute, :cura)
        |> ExMon.start_game()
      end)

      # eu poderia retornar toda uma tupla com as variáveis necessárias para executar os testes deste describe
      :ok
    end

    test "when move is valid, do the move and then computer makes a move" do
      messages =
        capture_io(fn ->
          ExMon.make_move(:chute)
        end)

      assert messages =~ "The Player has attacked the Computer"
      assert messages =~ "move_avg: :chute"
      assert messages =~ "It's computer turn"
      assert messages =~ "It's player turn."
    end

    test "when move is invalid, that move must be rejected" do
      messages =
        capture_io(fn ->
          ExMon.make_move(:fail_move)
        end)

      assert messages =~ "Invalid move: fail_move"
    end

    # DESAFIO: teste de game over... modifica o estado pra gameover, tenta fazer o move, mas confirma que o jogo acabou
  end
end
