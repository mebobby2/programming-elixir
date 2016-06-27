defmodule Parse do

  #Parse.printable?('abasda') => true
  #Parse.printable?('abasda\t') => false
  #Parse.printable?([97, 98, 99]) => true
  def printable?(str), do: Enum.all?(str, &(&1 >= ?\s && &1 <= ?~))


  def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)


  def calculate(str) do
    [left, operator, right] = Enum.chunks_by(str, &(&1 == ?\s)) |> Enum.reject &(&1 == ' ')
  end 

end