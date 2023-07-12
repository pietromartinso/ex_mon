defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game, Player}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Jeremias", :soco, :chute, :cura)
      computer = Player.build("Robotinik", :soco, :chute, :cura)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("Jeremias", :soco, :chute, :cura)
      computer = Player.build("Robotinik", :soco, :chute, :cura)

      Game.start(computer, player)

      expected_response = %{
        status: :started,
        player: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "Jeremias"
        },
        computer: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "Robotinik"
        },
        turn: :player
      }

      assert Game.info() == expected_response
    end
  end

  describe "update/1" do
    test "returns the game estate updated" do
      player = Player.build("Jeremias", :soco, :chute, :cura)
      computer = Player.build("Robotinik", :soco, :chute, :cura)

      Game.start(computer, player)

      first_state = %{
        status: :started,
        player: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "Jeremias"
        },
        computer: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "Robotinik"
        },
        turn: :player
      }

      assert Game.info() == first_state

      new_state = %{
        status: :started,
        player: %ExMon.Player{
          life: 85,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "Jeremias"
        },
        computer: %ExMon.Player{
          life: 42,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "Robotinik"
        },
        turn: :player
      }

      Game.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}

      assert Game.info() == expected_response
    end
  end

  # DESAFIO:
  # Criar testes das outras funções públicas do game: player, turn e fetch_player
  #
  #
  #
  #
end
