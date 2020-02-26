defmodule Home do
  use Scenic.Scene

  import Scenic.Primitives
  alias Scenic.Graph
  alias Scenic.ViewPort

  @graph Graph.build(clear_color: :white)

  @spec init(any, any) :: {:ok, any, {:push, map}}
  def init(_, opts) do
    {:ok, %{graph: @graph, viewport: opts[:viewport]}, push: @graph}
  end

  def handle_input({:key, {"right", :release, 0}}, _context, %{viewport: vp} = state) do
    ViewPort.set_root(vp, {TextScene, state})
    {:halt, state}
  end

  def handle_input(_input, _, state) do
    {:noreply, state}
  end
end
