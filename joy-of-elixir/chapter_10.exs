# Re-writing chapter's 8 first exercise but now using the pipe operator!
person = "Write the name for a person: " |> IO.gets() |> String.trim()
object = "Write the name for an object: " |> IO.gets() |> String.trim()
place = "Write the name for a place: " |> IO.gets() |> String.trim()

IO.puts("Silly little #{person} started to look for their #{object} in #{place}. Unbeknownst to them, it was not there at all…")
