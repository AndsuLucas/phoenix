defmodule Phoenix1.Repo do
  use Ecto.Repo,
    otp_app: :phoenix1,
    adapter: Ecto.Adapters.Postgres
end
