#! /usr/bin/perl

use strict;
use warnings;
use Carp;
use Getopt::Long;
use autodie;
use feature qw(say);
use Polynomial;

our $k;
my $treshold;
my $infile;
my $outfile;

Getopt::Long::Configure ("bundling");
GetOptions (
    'k=i'          => \$k,
    't|treshold=i' => \$treshold,
    'in:0'         => \$infile, # output file STDIN by default
    'out:0'        => \$outfile # output file STDOUT by default
    );

my $in;
unless (defined $infile) {
    open($in, '<', "functions_${k}_1.txt");
} elsif ($infile) {
    open($in, '<', $infile);
} else {
    open($in, '<-');
}

my $out;
unless (defined $outfile) {
    open($out, '>', "complex_${k}_$treshold.txt");
} elsif ($outfile) {
    open($out, '>', $outfile);
} else {
    open($out, '>-');
}

# say $out 'lol';

filter_complex($k, $treshold, $in, $out);
