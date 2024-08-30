# There are no exercises in chapter 12 of Joy of Elixir :(
# So I gave myself the famous "fizzbuzz" challenge

# Write an Elixir function that, given an integer, outputs:
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

# I don't know how to do a "for loop" yet lol…

fizzbuzz.(1)
fizzbuzz.(2)
fizzbuzz.(3)
fizzbuzz.(4)
fizzbuzz.(5)
fizzbuzz.(6)
fizzbuzz.(7)
fizzbuzz.(8)
fizzbuzz.(9)
fizzbuzz.(10)
fizzbuzz.(11)
fizzbuzz.(12)
fizzbuzz.(13)
fizzbuzz.(14)
fizzbuzz.(15)
fizzbuzz.(16)
IO.puts("…")
fizzbuzz.(26)
fizzbuzz.(27)
fizzbuzz.(28)
fizzbuzz.(29)
fizzbuzz.(30)
fizzbuzz.(31)
