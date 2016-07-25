defmodule My.BknRefKeeper do
    def start do
        spawn __MODULE__, :loop, [1]
    end

    def loop(state) do
        receive do
            {:get_bkn_ref, caller} -> send caller, {:bkn_ref, state}
        end
        loop(state+1)
    end
end
