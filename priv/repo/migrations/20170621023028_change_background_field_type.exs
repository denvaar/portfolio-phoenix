defmodule PortfolioPhoenix.Repo.Migrations.ChangeBackgroundFieldType do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      modify :banner_bg_color, :text
      modify :banner_fg_color, :text
    end
  end
end
