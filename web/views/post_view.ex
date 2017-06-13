defmodule PortfolioPhoenix.PostView do
  use PortfolioPhoenix.Web, :view
  use Timex
  import Scrivener.HTML
  
  def as_html(text) do
    text
    |> Earmark.as_html!
    |> raw
  end

  def format_date(date) do
    date
    |> Timex.format!("%B %d, %Y", :strftime)
  end

  def render("upload.json", %{path: path}) do
    path
  end

  def render("remove.json", %{path: path}) do
    path
  end
  def render("remove.json", %{reason: reason}) do
    reason
  end

  def render("error.json", %{message: message}) do
    message 
  end

end
