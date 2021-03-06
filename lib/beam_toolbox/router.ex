defmodule BeamToolbox.Router do
  alias BeamToolbox.Controllers
  use Phoenix.Router,
        port: 4000,
        dispatch: [
          { :_, [
              {"/stylesheets/[...]", :cowboy_static, {:dir, "priv/static/stylesheets"}},
              {"/images/[...]", :cowboy_static, {:dir, "priv/static/images"}},
              {:_, Plug.Adapters.Cowboy.Handler, { __MODULE__, [] }}
          ]}
        ]

  get "/pages/:page", Controllers.Pages, :show, as: :page
  get "/projects/:project", Controllers.Projects, :show, as: :project
  get "/categories", Controllers.Categories, :index, as: :categories
  get "/categories/:category", Controllers.Categories, :show, as: :category
end
