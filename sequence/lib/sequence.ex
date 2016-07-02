defmodule Sequence do
  use Application

  def start(_type, initial_number) do
    { :ok, _pid } = Sequence.Supervisor.start_link(Application.get_env(:sequence, :initial_number))
  end
end
