defmodule RookServer.Repo do
  use Ecto.Repo,
    otp_app: :rook_server,
    adapter: Ecto.Adapters.Postgres
end
