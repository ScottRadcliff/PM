defmodule PmWeb.ProjectController do
  use PmWeb, :controller
  alias Pm.Project
  alias Pm.Repo

  def index(conn, _params) do
    projects = Repo.all(Project)
    render(conn, "index.html", projects: projects)
  end

  def new(conn, _params) do
    changeset = Project.changeset(%Project{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"project" => project_params}) do
    %Project{}
    |> Project.changeset(project_params)
    |> Repo.insert()
    |> case do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project created successfully.")
        |> redirect(to: Routes.project_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Pm.Repo.get!(Project, id)
    render(conn, "show.html", project: project)
  end
end
