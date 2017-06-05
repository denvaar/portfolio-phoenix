defmodule PortfolioPhoenix.PageController do
  use PortfolioPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
