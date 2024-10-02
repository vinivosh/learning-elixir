# Replacing all "e"s in the words by "i"s using Enum.map/2 and String.replace/3
words = ["a", "very", "fine", "collection", "of", "words", "enunciated"]
words = Enum.map(words, &String.replace(&1, "e", "i"))

Enum.each(words, &IO.puts/1)

########################################

# Multiplying all numbers together with Enum.reduce/2
nums = [5, 12, 9, 24, 9, 18]
nums_mult = Enum.reduce(nums, &(&1 * &2))

IO.puts("")
IO.puts(nums_mult)
