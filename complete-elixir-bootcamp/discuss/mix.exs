defmodule Discuss.Mixfile do
  use Mix.Project

  def project do
    [
      app: :discuss,
      version: "0.0.1",
      elixir: "~> 1.2",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Discuss, []},
      applications: [
        :phoenix,
        :phoenix_pubsub,
        :phoenix_html,
        :cowboy,
        :logger,
        :gettext,
        :phoenix_ecto,
        :postgrex,
        :ueberauth,
        :ueberauth_github
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_), do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      # Docs and linter
      {:ex_doc, "~> 0.18.0", only: :dev, runtime: false},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},

      # Phoenix
      {:phoenix, "~> 1.2.5"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.6"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      # Downgraded from ~> 0.11
      {:gettext, "~> 0.10.0", override: true},
      {:cowboy, "~> 1.0"},

      # Authentication
      {:ueberauth, "~> 0.4.0"},
      {:ueberauth_github, "~> 0.4.0"},

      # Downgraded packages so the project works properly in Elixir 1.6.x
      {:bunt, "~> 0.2.1", runtime: false},
      {:earmark, "~> 1.2.0", runtime: false},
      {:jason, "~> 1.4.4", runtime: false},
      {:makeup, "~> 1.0.5", runtime: false},
      {:makeup_elixir, "~> 0.14.1", runtime: false},
      {:nimble_parsec, "~> 0.5.0", runtime: false},
      {:expo, "~> 0.3.0", runtime: false, override: true}
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
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
