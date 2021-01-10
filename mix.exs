defmodule Rube.MixProject do
  use Mix.Project

  def project do
    [
      app: :rube,
      version: "0.1.0",
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      preferred_cli_env: [
        "test.docker": :test
      ]
    ]
  end

  def application do
    [
      mod: {Rube.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:deque, "~> 1.0"},
      {:ecto_sql, "~> 3.4"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:phoenix, "~> 1.5"},
      {:phoenix_ecto, "~> 4.1"},
      {:phoenix_html, "~> 2.14"},
      {:phoenix_live_dashboard, "~> 0.2"},
      {:phoenix_live_view, "~> 0.15"},
      {:phoenix_live_react, "~> 0.4"},
      {:plug_cowboy, "~> 2.0"},
      {:postgrex, ">= 0.0.0"},
      # {:slurp, git: "~/workspace/fremantle-industries/slurp"},
      # {:slurp, path: "~/workspace/fremantle-industries/slurp"},
      {:slurp, github: "fremantle-industries/slurp"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:logger_file_backend, "~> 0.0.10", only: [:dev, :test]},
      {:excoveralls, "~> 0.8", only: :test},
      {:ex_unit_notifier, "~> 0.1", only: :test},
      {:floki, ">= 0.27.0", only: :test},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      "setup.deps": ["deps.get", "cmd npm install --prefix assets"],
      setup: ["setup.deps", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end