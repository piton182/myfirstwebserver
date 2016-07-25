defmodule MyFirstWebServer do
  use Application

  def start(_type, _args) do
    {:ok, web_pid} = My.Web.start_server |> IO.inspect
    # Task.start(fn -> :timer.sleep(10000); IO.puts("done sleeping") end)

    My.BknRefKeeper.start |> Process.register(:bkn_ref_keeper)
    {:ok, web_pid}
  end
end
