#! /usr/bin/env perl

use warnings;
use strict;

open(my $fds, ">singular.txt");
open(my $fdn, ">nonsingular.txt");

while (<>) {
    my @res =  split;
    my $sing = $res[0] =~ /^[Ss]ingular$/;
    print {$sing ? $fds : $fdn} "$res[1]\n";
}

close($fds);
close($fdn);
