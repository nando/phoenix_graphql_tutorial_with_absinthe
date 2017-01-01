use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_graphql_tutorial_with_absinthe, PhoenixGraphqlTutorialWithAbsinthe.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_graphql_tutorial_with_absinthe, PhoenixGraphqlTutorialWithAbsinthe.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "",
  database: "phoenix_graphql_tutorial_with_absinthe_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
