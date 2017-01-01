defmodule PhoenixGraphqlTutorialWithAbsinthe.Router do
  use PhoenixGraphqlTutorialWithAbsinthe.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :graphql do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug PhoenixGraphqlTutorialWithAbsinthe.Web.Context
  end

  scope "/", PhoenixGraphqlTutorialWithAbsinthe do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api" do
    pipe_through :graphql
 
    forward "/", Absinthe.Plug,
      schema: PhoenixGraphqlTutorialWithAbsinthe.Schema
  end
 
  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: PhoenixGraphqlTutorialWithAbsinthe.Schema

end
