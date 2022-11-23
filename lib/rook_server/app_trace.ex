defmodule RookServer.AppTrace do
  @moduledoc """
  A context module for tracing and inspecting instance of the Rook desktop app
  """

  def get_running_instances do
    Registry.keys(RookServer.DesktopAppRegistry, self())
  end
end
