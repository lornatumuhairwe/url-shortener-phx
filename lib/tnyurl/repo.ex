defmodule Tnyurl.Repo do
  use Ecto.Repo,
    otp_app: :tnyurl,
    adapter: Ecto.Adapters.Postgres
end
