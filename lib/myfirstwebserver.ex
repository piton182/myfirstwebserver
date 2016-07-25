defmodule MyFirstWebServer do
  use Application

  def start(_type, _args) do
    My.Web.start_server
    # Task.start(fn -> :timer.sleep(10000); IO.puts("done sleeping") end)

    pid = My.BknRefKeeper.start
    Process.register pid, :bkn_ref_keeper
  end
end
