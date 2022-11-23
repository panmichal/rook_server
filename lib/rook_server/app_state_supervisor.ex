defmodule RookServer.AppStateSupervisor do
  use DynamicSupervisor
  alias RookServer.AppInstanceState

  def start_link(_opts) do
    DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_opts) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_child(name) do
    DynamicSupervisor.start_child(__MODULE__, {AppInstanceState, name})
  end

  def get_children_names() do
    DynamicSupervisor.which_children(__MODULE__)
    |> Enum.map(fn {_, pid, _, _} -> pid end)
    |> Enum.map(fn pid -> Registry.keys(RookServer.DesktopAppRegistry, pid) end)
    |> List.flatten()
  end
end
