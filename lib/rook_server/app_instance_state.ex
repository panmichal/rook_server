defmodule RookServer.AppInstanceState do
  use GenServer
  require Logger

  @registry RookServer.DesktopAppRegistry
  @timeout 10_000

  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: via_tuple(name))
  end

  def init(name) do
    Logger.info("Starting #{inspect(name)}")
    {:ok, %{}, @timeout}
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  def handle_info(:timeout, state) do
    Logger.info("Received timeout")
    {:noreply, state}
  end

  defp via_tuple(name),
    do: {:via, Registry, {@registry, name}}
end
