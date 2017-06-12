defmodule PortfolioPhoenix.Post do
  use PortfolioPhoenix.Web, :model

  @derive {Phoenix.Param, key: :slug}
  schema "posts" do
    field :title, :string
    field :summary, :string
    field :content, :string
    field :author, :string
    field :slug, :string
    field :published, :boolean, default: false
    field :date_published, Timex.Ecto.Date

    timestamps()
  end

  def sorted(query) do
    from p in query,
    order_by: [asc: p.inserted_at]
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    params = Map.merge(params, slug_map(params))

    struct
    |> cast(params, [:title, :summary, :content, :author, :published, :date_published, :slug])
    |> validate_required([:title, :summary, :content, :author, :published, :date_published, :slug])
  end

  defp slug_map(%{"title" => title}) do
    slug = String.downcase(title) |> String.replace(" ", "-")
    %{"slug" => slug}
  end
  defp slug_map(_params) do
    %{}
  end
end
