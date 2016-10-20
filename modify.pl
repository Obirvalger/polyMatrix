#! /usr/bin/env perl
use strict;

open(my $fh, "<", $ARGV[0]);

my $rm_comments = 1;

my $zm = qr/^#0 /;
#my $hm = qr/(^##)|$zm/;
my $hm = qr/(^## )/;

while (<$fh>) {
#remove summands, multiplyed by zero
s/0\*\(.*?\).*?\+ //g if $_ =~ $zm;
s/ \+ 0\*\(.*?\)\S*$// if $_ =~ $zm;
s/0\*.*?\+ //g if $_ =~ $zm;
s/ \+ 0\*\S*$// if $_ =~ $zm;

s/\(g \+ h\)/f2/g if $_ =~ $hm;
s/\(g \+ 2\*h\)/f3/g if $_ =~ $hm;
s/\(g \+ 3\*h\)/f4/g if $_ =~ $hm;
s/\(g \+ 4\*h\)/f5/g if $_ =~ $hm;

s/\(2\*g \+ h\)/2*f4/g if $_ =~ $hm;
s/\(3\*g \+ h\)/3*f3/g if $_ =~ $hm;
s/\(4\*g \+ h\)/4*f5/g if $_ =~ $hm;

s/\sg \+ h$/ f2/g if $_ =~ $hm;
s/\sg \+ 2\*h$/ f3/g if $_ =~ $hm;
s/\sg \+ 3\*h$/ f4/g if $_ =~ $hm;
s/\sg \+ 4\*h$/ f5/g if $_ =~ $hm;

s/\s2\*g \+ h$/2*f4/g if $_ =~ $hm;
s/\s3\*g \+ h$/3*f3/g if $_ =~ $hm;
s/\s4\*g \+ h$/4*f5/g if $_ =~ $hm;

s/g/f0/g if $_ =~ $hm;
s/h/f1/g if $_ =~ $hm;

s/$zm// if $rm_comments;

print $_;
}
