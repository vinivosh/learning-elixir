defmodule Cards.MixProject do
  use Mix.Project

  def project do
    [
      app: :cards,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Cards",
      source_url:
        "https://github.com/vinivosh/learning-elixir/tree/main/complete-elixir-bootcamp/cards",
      homepage_url:
        "https://github.com/vinivosh/learning-elixir/blob/main/complete-elixir-bootcamp/cards/README.md",
      docs: [
        # The main page in the docs
        main: "Cards",
        # logo: "path/to/logo.png",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
    ]
  end
end
