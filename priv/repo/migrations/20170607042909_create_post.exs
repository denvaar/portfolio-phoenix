defmodule PortfolioPhoenix.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :summary, :text
      add :content, :text
      add :author, :string

      timestamps()
    end

  end
end