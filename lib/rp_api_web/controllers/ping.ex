defmodule RpApiWeb.PingController do
  use RpApiWeb, :controller

  def index(conn, _params) do
    text conn, "RpApi is Alive - #{Mix.env()}"
  end
end
