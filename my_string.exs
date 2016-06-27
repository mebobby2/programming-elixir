defmodule MyString do

  def center(words) do
    column_width = Enum.max_by(words, &(String.length(&1))) |> String.length
    print Enum.map(words, &(center_word &1, column_width))
  end

  def center_word(word, column_width) do
    length = String.length word
    String.rjust word, round((column_width - length) / 2 + length)
  end

  def print(words) do
    Enum.each words, &(IO.puts &1)
  end

end