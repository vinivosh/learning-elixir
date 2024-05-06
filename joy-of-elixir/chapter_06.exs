# Function to test pattern matching with maps inside functions
greeting = fn
  %{name: name, age: age} -> "Hello, #{name}! You're #{age} years old."
  %{name: name} -> "Hello, #{name}!"
  # _ -> "Hello, Anonymous!"
end

IO.puts(greeting.(%{name: "Vinícius H", age: 27}))
IO.puts(greeting.(%{name: "Vini", another_key: "another_value"}))
# IO.puts(greeting.([]))
