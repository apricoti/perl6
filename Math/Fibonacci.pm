module Math::Fibonacci;

my @fibonacci = 1, 1, *+* ... *;

sub fibonacci($x) is export { say "looking for f[$x]..."; @fibonacci[$x]; }

# doesn't seem to work on rakudo perl 6  jan 2012... program just stops after hanging for a couple of seconds
