defmodule RpApi.Repo do
  use Ecto.Repo,
    otp_app: :rp_api,
    adapter: Ecto.Adapters.Postgres
end
