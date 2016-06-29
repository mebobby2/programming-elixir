defmodule Echo do
  def echo do
    receive do
      { sender, msg } -> send sender, { :ok, msg}
      echo
    end
  end
end

defmodule Receiver do
  def run do
    receive do
      { :ok, msg } ->
        IO.puts msg
      run
    end
  end
end

receiver = spawn(Receiver, :run, [])

pid1 = spawn(Echo, :echo, [])
pid2 = spawn(Echo, :echo, [])

send pid1, { receiver, "fred" }
send pid2, { receiver, "betty" }