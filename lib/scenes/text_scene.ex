defmodule TextScene do
  use Scenic.Scene

  import Scenic.Primitives
  alias Scenic.Graph
  alias Scenic.ViewPort

  def init(%{graph: graph}, opts) do
    this_graph = graph |> text("This is the text", fill: :black, t: {300, 400})
    {:ok, %{graph: this_graph, viewport: opts[:viewport]}, push: this_graph}
  end

  def handle_input({:key, {"left", :release, 0}}, _context, %{viewport: vp} = state) do
    ViewPort.set_root(vp, {Home, state})
    {:halt, state}
  end

  def handle_input(_input, _, state) do
    {:noreply, state}
  end
end
