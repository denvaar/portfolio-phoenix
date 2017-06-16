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
    field :banner_bg_color, :string, size: 10
    field :banner_fg_color, :string, size: 10

    timestamps()
  end

  def sorted(query) do
    from p in query,
      order_by: [desc: p.date_published]
  end

  def maybe_filter_published(query, false) do
    from p in query,
      where: p.published == true
  end
  def maybe_filter_published(query, true), do: query


  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    params = Map.merge(params, slug_map(params))

    struct
    |> cast(params, [:title, :summary, :content, :author,
                     :published, :date_published, :slug,
                     :banner_bg_color, :banner_fg_color])
    |> validate_required([:title, :summary, :content,
                          :author, :published, :date_published,
                          :slug, :banner_bg_color, :banner_fg_color])
  end

  defp slug_map(%{"title" => title}) do
    %{"slug" => Slugger.slugify_downcase(title)}
  end
  defp slug_map(_params) do
    %{}
  end
end
