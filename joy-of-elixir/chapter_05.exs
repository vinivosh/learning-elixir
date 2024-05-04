# Function to turn temperatures from fahrenheit into celsius
f_to_celsius = fn (c) -> (c - 32) / 1.8 end

IO.puts(f_to_celsius.(95))
IO.puts(f_to_celsius.(104))


# Function to return the number of seconds in n days
seconds_in_days = &(&1 * 24 * 60 * 60)

IO.puts(seconds_in_days.(1))
IO.puts(seconds_in_days.(7))


# Function to calculate the average between two ages, given inside two maps
# avg_ages = fn (map1, map2) -> (map1.age + map2.age) / 2 end

# Improvement: using pattern matching in the arguments. Nice feature!
avg_ages = fn (%{age: age1}, %{age: age2}) -> (age1 + age2) / 2 end

IO.puts(avg_ages.(%{name: "Vini", age: 27}, %{name: "Juliana", age: 23}))
IO.puts(avg_ages.(%{name: "Nabucodonosor II", age: 54}, %{name: "Xerxes", age: (10/12)}))
