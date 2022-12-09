defmodule ExMon do
  alias ExMon.Player
  alias ExMon.Game
  alias ExMon.Game.Status
  alias ExMon.Game.Actions

  @computer_name "Atlas"

  def create_player(move_avg, move_heal, move_rnd, name) do
    Player.build(move_avg, move_heal, move_rnd, name)
  end

  def start_game(player) do
    :punch
    |> create_player(:heal, :kick, @computer_name)
    |> Game.start(player)

    Status.print_round_message(Game.info())
  end

  def make_move(move) do
    move
    |> Actions.fetch_move()
    |> do_move()

  end

  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)
  defp do_move({:ok, move}) do
    case move do
      :move_heal -> "Healing..."
      move -> Actions.attack(move)
    end

    Status.print_round_message(Game.info())
  end
end
