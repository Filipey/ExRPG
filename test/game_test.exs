ExUnit.start()

defmodule ExMon.GameTest do
  alias ExMon.Game
  alias ExMon.Player
  use ExUnit.Case, async: true

  describe "start/2" do
    test "starts the game state" do
      player = Player.build(:kick, :heal, :punch, "John Doe")
      computer = Player.build(:kick, :heal, :punch, "Atlas")

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build(:kick, :heal, :punch, "John Doe")
      computer = Player.build(:kick, :heal, :punch, "Atlas")

      Game.start(computer, player)

      expected_response = %{
        computer: %ExMon.Player{
          life: 100,
          moves: %{
            move_avg: :kick,
            move_heal: :heal,
            move_rnd: :punch
          },
          name: "Atlas"
        },
        player: %ExMon.Player{
          life: 100,
          moves: %{
            move_avg: :kick,
            move_heal: :heal,
            move_rnd: :punch
          },
          name: "John Doe"
        },
        status: :started,
        turn: :player
      }

      assert expected_response == Game.info()
    end
  end

  describe "update/1" do
    test "returns the updated game state" do
      player = Player.build(:kick, :heal, :punch, "John Doe")
      computer = Player.build(:kick, :heal, :punch, "Atlas")

      Game.start(computer, player)

      start_response = %{
        computer: %ExMon.Player{
          life: 100,
          moves: %{
            move_avg: :kick,
            move_heal: :heal,
            move_rnd: :punch
          },
          name: "Atlas"
        },
        player: %ExMon.Player{
          life: 100,
          moves: %{
            move_avg: :kick,
            move_heal: :heal,
            move_rnd: :punch
          },
          name: "John Doe"
        },
        status: :started,
        turn: :player
      }

      assert start_response == Game.info()

      updated_state = %{
        computer: %ExMon.Player{
          life: 30,
          moves: %{
            move_avg: :kick,
            move_heal: :heal,
            move_rnd: :punch
          },
          name: "Atlas"
        },
        player: %ExMon.Player{
          life: 85,
          moves: %{
            move_avg: :kick,
            move_heal: :heal,
            move_rnd: :punch
          },
          name: "John Doe"
        },
        status: :continue,
        turn: :player
      }

      Game.uptade(updated_state)

      expected_response = %{updated_state | turn: :computer, status: :continue}

      assert expected_response == Game.info()
    end
  end
end
