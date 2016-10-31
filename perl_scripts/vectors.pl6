#! /usr/bin/env perl6

my $k = @*ARGS[0];
#my $fh = open(@*ARGS[1], :w);
for ([X~] @(0..$k-1) xx $k) -> $x {say $x}
