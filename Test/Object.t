BEGIN {
	@*INC.push( "C:/Strawberry-Perl/perl/lib", "C:/Users/jabuhacx/perl5" );
}

my $a = Nil;
if $a { say "nil is true"; }
if !$a { say "nil is false"; }
