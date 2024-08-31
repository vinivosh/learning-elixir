# There are no exercises in chapter 12 of Joy of Elixir :(
# So I gave myself the famous "fizzbuzz" challenge

# Write an Elixir function that, given an integer, prints:
# - "fizz" if the integer is divisible by 3
# - "buzz" if it's divisible by 5 instead
# - "fizzbuzz" if it's divisible by 3 and 5 at the same time
# - The integer itself it none of the above

fizzbuzz = fn (num) ->
  cond do
    rem(num, (3 * 5)) == 0 -> IO.puts("fizzbuzz")
    rem(num, 3) == 0 -> IO.puts("fizz")
    rem(num, 5) == 0 -> IO.puts("buzz")
    true -> IO.puts(num) # Is this how we do a "catch-all" clause in a cond? hmmm…
  end
end

Enum.each(1..50, &(fizzbuzz.(&1)))
