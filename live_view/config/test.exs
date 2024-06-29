import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :live_view, LiveViewWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "MUNjdCdyVX8de6KbqKvIjOc6Rxmi29OwRRSS9w/hoctGiIAQIPHhujk/WPaLVeXq",
  server: false

# In test we don't send emails.
config :live_view, LiveView.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  # Enable helpful, but potentially expensive runtime checks
  enable_expensive_runtime_checks: true
