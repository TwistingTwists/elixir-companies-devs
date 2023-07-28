[
  import_deps: [:ecto, :ecto_sql, :phoenix, :ash, :ash_phoenix, :ash_postgres],
  inputs: ["priv/*/seeds.exs", "*.{heex,ex,exs}", "{config,lib,test}/**/*.{heex,ex,exs}"],
  plugins: [Phoenix.LiveView.HTMLFormatter],
  subdirectories: ["priv/*/migrations"]
]
