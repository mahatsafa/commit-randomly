# elixir notes
defmodule Notes do
  def greet(name), do: "hello #{name}"
end

IO.puts(Notes.greet("practice"))

nums = [1, 2, 3]
doubled = Enum.map(nums, fn n -> n * 2 end)
IO.inspect(doubled)

# TODO: try pattern matching / genserver next
