defmodule Identicon.MixProject do
  use Mix.Project

  def project do
    [
      app: :identicon,
      version: "0.1.0",
      elixir: "~> 1.6.0",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nimble_parsec, "~> 0.5.0", runtime: false},
      {:bunt, "~> 0.2.1", runtime: false},
      {:earmark, "~> 1.2.0", runtime: false},
      {:jason, "~> 1.4.4", runtime: false},
      {:makeup, "~> 1.0.5", runtime: false},
      {:makeup_elixir, "~> 0.14.1", runtime: false},
      {:ex_doc, "~> 0.18.0", only: :dev, runtime: false},
      {:egd, github: "erlang/egd"},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false}
    ]
  end
end
