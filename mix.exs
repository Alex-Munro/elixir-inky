defmodule Inky.MixProject do
  use Mix.Project

  def project do
    [
      app: :inkylixir,
      version: "0.1.4",
      elixir: "~> 1.11.2",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "inkylixir",
      description: description(),
      package: package(),
      source_url: "https://github.com/Alex-Munro/elixir-inky/"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end
  defp description() do
    "Parsing Inky input and returning expanded html for the Zurb Foundation for Emails framework
    https://github.com/foundation/inky
    https://github.com/foundation/foundation-emails
    "
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Alex-Munro/elixir-inky/"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:floki, "~> 0.29.0"},
      {:fast_html, "~> 2.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
