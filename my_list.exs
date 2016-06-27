defmodule MyList do

	def mapsum([], total, _func), do: total
	def mapsum([head | tail], total, func) do
		mapsum(tail, total + func.(head), func)
	end


	def max([head | tail]) do
		_max(tail, head)
	end
	defp _max([], current_max), do: current_max
	defp _max([head | tail], current_max) when head > current_max do
		_max(tail, head)
	end
	defp _max([head | tail], current_max) when head <= current_max do
		_max(tail, current_max)
	end


	def span(from, to) when from != to do
		[from | span(from + 1, to) ]
	end
	def span(from, to) when from == to do
		[to]
	end


	# MyList.all?([1,2,3], &(&1 > 2)) # => false
  # MyList.all?([1,2,3], &(&1 < 5)) # => true
	def all?([], _func), do: true
	def all?([head | tail], func) do
		func.(head) && all?(tail, func)
	end


	#MyList.each [1,2,3], &(IO.puts "#{&1}")
	def each([], _func), do: :ok
	def each([head | tail], func) do
		func.(head)
		each(tail, func)
	end


	#MyList.filter [1,2,3], &(&1 > 1) # => [2,3]
	def filter([], _func), do: []
	def filter([head | tail], func) do
		if func.(head) do
			[ head | filter(tail, func) ]
		else
			filter(tail, func)
		end
	end


	# MyList.take([1, 2, 3], 2)
  # [1,2]
  # MyList.take([1, 2, 3], 10)
  # [1,2,3]
  # MyList.take([1, 2, 3], 0)
  # []
  # MyList.take([1, 2, 3], -1)
  # [1,2]
  def take(collection, count), do: _take(collection, count, [])
  defp _take([], _, result), do: result
  defp _take(_, count, result) when length(result) == count, do: result
  defp _take(collection, count, result) when count < 0 do
    _take(collection, length(collection) + count, result)
  end
  defp _take([head | tail], count, result) do
  	_take(tail, count, result ++ [head])
  end


  # .flatten(list)
  # MyList.flatten([1,[2]])
  # [1,2]
  # MyList.flatten([1,[2,3,[4]], 5, [[[6]]]])
  # [1,2,3,4,5,6]
  # MyList.flatten([])
  # []
  # MyList.flatten([1,[]])
  # [1]
  def flatten(list), do: _flatten(list, [])
  defp _flatten([head | tail], result) when is_list(head) do
  	_flatten(tail, _flatten(head, result))
  end
  defp _flatten([head | tail], result) do
  	_flatten(tail, result ++ [head])
  end
  defp _flatten([], result), do: result

end