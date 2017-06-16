defmodule PortfolioPhoenix.Repo.Migrations.AddSlugsAndPublished do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :slug, :string
      add :published, :boolean, default: false
      add :date_published, :date
    end

    create index(:posts, [:slug], unique: true)
    
  end
end
