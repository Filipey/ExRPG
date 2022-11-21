defmodule ExMon.Game.Status do
  alias ExMon.Game

  def print_round_message() do
    IO.puts("\n|=====| The game was started! |=====|\n")
    IO.inspect(Game.info())
    IO.puts("------------------------------------")

  end

  def print_wrong_move_message(move) do
    IO.puts("\n |=====| Move #{move} does not exists! |=====|\n")
  end
end
