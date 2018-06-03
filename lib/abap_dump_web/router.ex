defmodule AbapDumpWeb.Router do
  use AbapDumpWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(AbapDumpWeb.Plugs.Veil.UserId)
    plug(AbapDumpWeb.Plugs.SetUser)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", AbapDumpWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/post", PostController, :index)
    resources("/pearls", PearlController)
  end

  # Other scopes may use custom stacks.
  # scope "/api", AbapDumpWeb do
  #   pipe_through :api
  # end

  scope "/auth", AbapDumpWeb do
    pipe_through(:browser)

    get("/signout", AuthController, :delete)
    get("/:provider", AuthController, :request)
    get("/:provider/callback", AuthController, :new)
  end

  # Default Routes for Veil
  scope "/veil", AbapDumpWeb.Veil do
    pipe_through(:browser)

    post("/users", UserController, :create)

    get("/users/new", UserController, :new)
    get("/sessions/new/:request_id", SessionController, :create)
    get("/sessions/signout/:session_id", SessionController, :delete)
  end

  # Add your routes that require authentication in this block.
  # Alternatively, you can use the default block and authenticate in the controllers.
  # See the Veil README for more.
  scope "/", AbapDumpWeb do
    pipe_through([:browser, AbapDumpWeb.Plugs.Veil.Authenticate])
  end
end
