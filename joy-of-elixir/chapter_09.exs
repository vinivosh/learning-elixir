# Replacing all "e"s in each word of a list using Enum.map/2 and String.replace/3
words = ["a", "very", "fine", "collection", "of", "words", "enunciated"]

words_changed = Enum.map(words, fn (word) -> String.replace(word, "e", "o") end)
Enum.each(words_changed, &IO.puts/1)


# Using Enum.reduce/2 to multiply all numbers from a list
nums = [5, 12, 9, 24, 9, 18]
mult = Enum.reduce(nums, fn (num, acc) -> num * acc end)
IO.puts(mult)
