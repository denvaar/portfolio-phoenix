defmodule PortfolioPhoenix.PostTest do
  use PortfolioPhoenix.ModelCase

  alias PortfolioPhoenix.Post

  @valid_attrs %{author: "some content", content: "some content", summary: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end
end
