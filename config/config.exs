# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# For backwards compatibility, the following configuration is required.
# see https://ash-hq.org/docs/guides/ash/latest/get-started#temporary-config for more details
config :ash, :use_all_identities_in_manage_relationship?, false

config :companies_reg_ex,
  ash_apis: [CompaniesRegEx.Resources]

  # Geo.PostGIS: Use Jason coder
config :geo_postgis, json_library: Jason

# Ash: Type shorthands
config :ash, :custom_types, [
  geometry: AshGeo.Geometry,
  geo_json: AshGeo.GeoJson,
  geo_wkt: AshGeo.GeoWkt,
  geo_wkb: AshGeo.GeoWkb,
  geo_any: AshGeo.GeoAny,
  # You may add shorthands for any narrowed types here
  #point26918: CoolApp.Type.GeometryPoint26918,
]

config :companies_reg_ex,
  ecto_repos: [CompaniesRegEx.Repo]

# Configures the endpoint
config :companies_reg_ex, CompaniesRegExWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: CompaniesRegExWeb.ErrorHTML, json: CompaniesRegExWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: CompaniesRegEx.PubSub,
  live_view: [signing_salt: "U70qhj3P"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :companies_reg_ex, CompaniesRegEx.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.3.2",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
