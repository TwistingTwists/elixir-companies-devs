defmodule CompaniesRegExWeb.DashboardLive do
  use CompaniesRegExWeb, :live_view

  import Phoenix.HTML.Form
  alias CompaniesRegEx.Resources.Recruiters

  def render(assigns) do
    ~H"""
    <h2>Recruiters</h2>
    <div>
      <%= for post <- @recruiters do %>
        <div>
          <div><%= post.title %></div>
          <div><%= if Map.get(post, :content), do: post.content, else: "" %></div>
          <button phx-click="delete_post" phx-value-post-id={post.id}>delete</button>
        </div>
      <% end %>
    </div>

    <h2>Create Recruiters</h2>
    <.form :let={f} for={@create_form} phx-submit="create_post">
      <%= text_input(f, :title, placeholder: "input title") %>
      <%= submit("create") %>
    </.form>

    <h2>Update Recruiters</h2>
    <.form :let={f} for={@update_form} phx-submit="update_post">
      <%= label(f, :"post name") %>
      <%= select(f, :recruiter_id, @recruiter_selector) %>
      <%= text_input(f, :content, value: "", placeholder: "input content") %>
      <%= submit("update") %>
    </.form>
    """
  end

  def mount(_params, _session, socket) do
    recruiters = Recruiters.read_all!()

    socket =
      assign(socket,
        recruiters: recruiters,
        recruiter_selector: recruiter_selector(recruiters),
        create_form: AshPhoenix.Form.for_create(Recruiters, :create) |> to_form(),
        update_form:
          AshPhoenix.Form.for_update(List.first(recruiters, %Recruiters{}), :update) |> to_form()
      )

    {:ok, socket}
  end

  def handle_event("delete_post", %{"post-id" => recruiter_id}, socket) do
    recruiter_id |> Recruiters.get_by_id!() |> Recruiters.destroy!()
    recruiters = Recruiters.read_all!()

    {:noreply,
     assign(socket, recruiters: recruiters, recruiter_selector: recruiter_selector(recruiters))}
  end

  def handle_event("create_post", %{"form" => %{"title" => title}}, socket) do
    Recruiters.create(%{title: title})

    recruiters =
      Recruiters.read_all!()
      |> IO.inspect()

    {:noreply,
     assign(socket, recruiters: recruiters, recruiter_selector: recruiter_selector(recruiters))}
  end

  def handle_event("update_post", %{"form" => form_params}, socket) do
    %{"recruiter_id" => recruiter_id, "content" => content} = form_params

    recruiter_id |> Recruiters.get_by_id!() |> Recruiters.update!(%{content: content})
    recruiters = Recruiters.read_all!()

    {:noreply,
     assign(socket, recruiters: recruiters, recruiter_selector: recruiter_selector(recruiters))}
  end

  defp recruiter_selector(recruiters) do
    for recruiter <- recruiters do
      {recruiter.title, recruiter.id}
    end
  end
end
