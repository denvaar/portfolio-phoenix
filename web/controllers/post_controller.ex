defmodule PortfolioPhoenix.PostController do
  use PortfolioPhoenix.Web, :controller

  alias PortfolioPhoenix.Post
  alias PhoenixBlog.ImageUploader
  
  plug Guardian.Plug.EnsureAuthenticated,
    [handler: __MODULE__] when not action in [:index, :show, :create_photo, :remove_file]

  def index(conn, params) do
    page = Post
           |> Repo.paginate(params)
    render(conn, "index.html", posts: page.entries, page: page)
  end

  def new(conn, _params) do
    changeset = Post.changeset(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    post_params = Map.put(post_params, "author", "Denvo")
    changeset = Post.changeset(%Post{}, post_params)

    case Repo.insert(changeset) do
      {:ok, _post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: post_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get_by!(Post, slug: id)
    render(conn, "show.html", post: post)
  end

  def edit(conn, %{"id" => id}) do
    post = Repo.get_by!(Post, slug: id)
    changeset = Post.changeset(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Repo.get_by!(Post, slug: id)
    changeset = Post.changeset(post, post_params)

    case Repo.update(changeset) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: post_path(conn, :show, post))
      {:error, changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
  end 

  def delete(conn, %{"id" => id}) do
    post = Repo.get_by!(Post, slug: id)
    Repo.delete!(post)

    conn
    |> put_flash(:info, "Post deleted")
    |> redirect(to: post_path(conn, :index))
  end

  def create_photo(conn, %{"images" => upload}) do
    if uploaded_file = upload do
      File.cp(uploaded_file.path, Path.expand("./uploads/#{uploaded_file.filename}"))
    end
    render(conn, "upload.json", path: "/uploads/#{uploaded_file.filename}")
  end

  def remove_file(conn, %{"path" => path}) do
    full_path = Path.expand("./" <> path)
    case File.rm(full_path) do
      :ok ->
        render(conn, "remove.json", path: path)
      {:error, reason} ->
        render(conn, "remove.json", reason: "Could not remove: file does not exist")
    end
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_status(401)
    |> render(PortfolioPhoenix.ErrorView, :"401")
  end
end
