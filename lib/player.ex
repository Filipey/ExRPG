defmodule ExMon.Player do
  @required_keys [:life, :moves, :name]
  @max_life 100

  @enforce_keys @required_keys
  defstruct @required_keys

  def build(move_avg, move_heal, move_rnd, name) do
    %ExMon.Player{
      name: name,
      life: @max_life,
      moves: %{
        move_avg: move_avg,
        move_heal: move_heal,
        move_rnd: move_rnd,
      },
    }
  end
end
