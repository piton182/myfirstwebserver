defmodule MyFirstWebServer do
  use Application

  def start(_type, _args) do
    My.Web.start_server
    # Task.start(fn -> :timer.sleep(10000); IO.puts("done sleeping") end)
  end
end
