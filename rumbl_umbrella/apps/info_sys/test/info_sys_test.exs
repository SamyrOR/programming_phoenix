defmodule InfoSysTest do
  use ExUnit.Case
  alias InfoSys.Result

  defmodule TestBackend do
    def name(), do: "Wolfram"

    def compute("result", _opts) do
      [%Result{backend: __MODULE__, text: "result"}]
    end

    def compute("none", _opts) do
      []
    end

    def compute("timeout", _opts) do
      Process.sleep(:infinity)
    end

    def compute("boom", _opts) do
      raise "boom!"
    end
  end

  test "compute/2 with timout returns no results" do
    results = InfoSys.compute("timeout", backends: [TestBackend], timeout: 10)
    assert results == []
  end

  @tag :capture_log
  test "compute/2 discard backend errors" do
    assert InfoSys.compute("boom", backends: [TestBackend]) == []
  end
end
