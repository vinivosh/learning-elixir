# Writing an Elixir file from within Elixir
file_name = "elixir-code.ex"
creation_output = File.write(file_name, "IO.puts \"This file was generated from Elixir\"\n")
IO.puts("Output of the creation of the \"#{file_name}\" file:")
IO.inspect(creation_output)

# Trying to remove an inexistent file
deletion_output = File.rm("inexistent-image.jpg")

IO.puts("Output of the deletion of an inexistent file:")
IO.inspect(deletion_output)
