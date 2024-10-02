# Testing input and output of strings
protag = String.trim(IO.gets("Insert the name for the main character in our story: "))
setting = String.trim(IO.gets("Insert the name for the setting in the story: "))

macguffin =
  String.trim(IO.gets("Insert the name for the important object to be sought out in the story: "))

IO.puts(
  "In that faithful day, #{protag} proceeded into #{setting} with no knowledge that an epic quest for the #{macguffin} would be starting..."
)

# Testing raw values outside the Elixir REPL ("iex" command)
# "In that faithful day, #{protag} proceeded into #{setting} with no knowledge that an epic quest for the #{macguffin} would be starting..."
