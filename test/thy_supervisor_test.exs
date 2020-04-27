defmodule ThySupervisorTest do
  use ExUnit.Case
  doctest ThySupervisor

  test "restart child when killed" do
    {:ok, sup_pid} = ThySupervisor.start_link([])
    {:ok, child_pid} = ThySupervisor.start_child(sup_pid, {ThyWorker, :start_link, []})

    Process.exit(child_pid, :kill)

    assert Enum.count(ThySupervisor.which_children(sup_pid)) == 1
  end
end
