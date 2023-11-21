import Config

config :friends, Friends.Repo,
  database: Path.expand("../friends.db", Path.dirname(__ENV__.file)),
  pool_size: 5,
  stacktrace: true,
  show_sensitive_data_on_connection_error: true

config :friends, ecto_repos: [Friends.Repo]
