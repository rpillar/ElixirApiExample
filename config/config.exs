# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :rp_api,
  ecto_repos: [RpApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :rp_api, RpApiWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: RpApiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: RpApi.PubSub,
  live_view: [signing_salt: "V83C2c8Y"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# guardian config
config :rp_api, RpApiWeb.Auth.Guardian,
    issuer: "RpApi",
    secret_key: "j/x2Ukk1rseEPOc+03brMr/JQU5J9I5la5EG90T9Wodx6RNM+sHxjooHDICWCWIN"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
