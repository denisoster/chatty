defmodule Chatty.MixProject do
  use Mix.Project

  def project do
    [
      app: :chatty,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Chatty.Application, []},
      extra_applications: [:ranch, :cowboy, :logger, :n2o, :syn, :nitro]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  def deps do
    [
      {:ex_doc, "~> 0.29.0", only: :dev},
      {:cowboy, "~> 2.8.0"},
      {:nitro, "~> 8.2.4"},
      {:n2o, "~> 10.12"},
      {:syn, "~> 2.1.1"}
    ]
  end
end
