defmodule RpApiWeb.Router do
  use RpApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RpApiWeb do
    pipe_through :api

    get "/ping", PingController, :index
  end
end
