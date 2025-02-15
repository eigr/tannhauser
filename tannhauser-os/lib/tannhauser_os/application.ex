defmodule TannhauserOS.Application do
    use Application
  
    def start(_type, _args) do
        # TODO check cluster strategy and topology
      children = [
        {Cluster.Supervisor, [topologies: [tannhauser_os: [strategy: Cluster.Strategy.Epmd]]}
      ]
  
      opts = [strategy: :one_for_one, name: TannhauserOS.Supervisor]
      Supervisor.start_link(children, opts)
    end
  end