defmodule TannhauserOS.MixProject do
  use Mix.Project

  def project do
    [
      app: :tannhauser_os,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: releases()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:libcluster, "~> 3.3"}
    ]
  end

  defp releases do
    [
      tannhauser_os: [
        include_executables_for: [:unix],
        applications: [tannhauser_os: :permanent]
      ]
    ]
  end
end
