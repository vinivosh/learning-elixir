#
# * ############################################################################
# * Stuff to try out in the REPL ("iex" command)
# * ############################################################################
#

# Numbers of hours in 30 days, now using variables! 😱😱😱
seconds = 86400
seconds * 30 / 60 / 60

# Using variables inside strings
name = "Vini"
"sup #{name} 🤓"
# Huh, elixir deals with unicode shit like emojis just fine. Cool!

# Error demo
5 / "four"
# (ArithmeticError) bad argument in arithmetic expression
# Happens, of course, because we tried to divide a number by a string. Incompatible types, y'know?
