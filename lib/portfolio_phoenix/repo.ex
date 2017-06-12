defmodule PortfolioPhoenix.Repo do
  use Ecto.Repo, otp_app: :portfolio_phoenix
  use Scrivener, page_size: 5
end
