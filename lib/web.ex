defmodule My.Web do
  use Plug.Router

  plug :match
  plug :dispatch

  def start_server do
    Plug.Adapters.Cowboy.http(__MODULE__, nil, port: 5454)
    # {:ok, _} = My.MongoPool.start_link hostname: "localhost", port: 3001, database: "meteor"
    # {:ok, _} = My.MongoPool.start_link hostname: "ds031942.mlab.com", port: 31942, database: "taxi-hop-on", username: "macaw", password: "parrot"
  end

  get "/hello" do
    cursor = Mongo.find(My.MongoPool, "rides", %{}, [limit: 1])
    text = cursor
    |> BSON.decode

    conn
    |> Plug.Conn.put_resp_content_type("text/plain")
    |> Plug.Conn.send_resp(200, text)
  end

  match _ do
    Plug.Conn.send_resp(conn, 404, "not found")
  end
end
