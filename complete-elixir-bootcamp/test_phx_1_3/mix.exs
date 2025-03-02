defmodule TestPhx13.Mixfile do
  use Mix.Project

  def project do
    [
      app: :test_phx_1_3,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {TestPhx13.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      # Docs and linter
      {:ex_doc, "~> 0.18.0", only: :dev, runtime: false},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},

      {:phoenix, "~> 1.3.4"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      # Downgraded from ~> 0.11 to 0.10.0
      {:gettext, "~> 0.10.0", override: true},
      {:cowboy, "~> 1.0"},

      # Downgraded packages so the project works properly in Elixir 1.6.x
      {:bunt, "~> 0.2.1", runtime: false},
      {:earmark, "~> 1.2.0", runtime: false},
      {:jason, "~> 1.4.4", runtime: false},
      {:makeup, "~> 1.0.5", runtime: false},
      {:makeup_elixir, "~> 0.14.1", runtime: false},
      # Downgraded from 2.0.6
      {:mime, "~> 1.0.0", runtime: false, override: true},
      {:nimble_parsec, "~> 0.5.0", runtime: false},
      {:expo, "~> 0.3.0", runtime: false, override: true},
      # Downgraded from 1.16.1
      {:plug, "~> 1.9.0", runtime: false, override: true},
      # Downgraded from 2.1.0
      {:plug_crypto, "~> 1.1.0", runtime: false, override: true}

      # warning: the dependency :expo requires Elixir "~> 1.11" but you are
      # running on v1.6.6
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
