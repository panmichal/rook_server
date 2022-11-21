defmodule HealthController do
  use RookServerWeb, :controller

  def index(conn, _params) do
    json(conn, %{status: "ok"})
  end
end
