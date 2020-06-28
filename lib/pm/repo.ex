defmodule Pm.Repo do
  use Ecto.Repo,
    otp_app: :pm,
    adapter: Ecto.Adapters.Postgres
end
