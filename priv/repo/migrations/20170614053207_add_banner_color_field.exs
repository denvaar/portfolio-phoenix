defmodule PortfolioPhoenix.Repo.Migrations.AddBannerColorField do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :banner_bg_color, :string, size: 10
      add :banner_fg_color, :string, size: 10
    end
  end
end
