defmodule Chatty.Application do
  use Application
  use N2O

  def room() do
    case N2O.session(:room) do
         '' -> '/root'
         "" -> '/root'
          x -> x
    end
  end

  def env(_app) do
    [
      {:port, :application.get_env(:n2o, :port, 8002)}
    ]
  end

  def start(_, _) do
    :cowboy.start_clear(:http, env(:sample), %{env: %{dispatch: :n2o_cowboy.points()}})
    Supervisor.start_link([], strategy: :one_for_one, name: Chatty.Supervisor)
  end

end
