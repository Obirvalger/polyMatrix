#! /usr/bin/perl

use strict;
use warnings;
use Carp;
use Getopt::Long;
use autodie;
use feature qw(say);

my ($k, $treshold, $infile, $outfile);

Getopt::Long::Configure ("bundling");
GetOptions (
    'k=i'          => \$k,
    't|treshold=i' => \$treshold,
    'in:0'         => \$infile, # output file STDIN by default
    'out:0'        => \$outfile # output file STDOUT by default
    );

my $in;
unless (defined $infile) {
    system("./filter_complex.pl -k $k -t $treshold")
        unless -f "complex_${k}_$treshold.txt"; 
    open($in, '<', "complex_${k}_$treshold.txt");
} elsif ($infile) {
    open($in, '<', $infile);
} else {
    open($in, '<-');
}

my $out;
unless (defined $outfile) {
    open($out, '>', "pairs_${k}_$treshold.txt");
} elsif ($outfile) {
    open($out, '>', $outfile);
} else {
    open($out, '>-');
}
    
my %functions;

while (my $fun = <$in>) {
    chomp $fun;
    $functions{$fun} = 1;
}

for my $f (keys %functions) {
    for my $g (keys %functions) {
        if ($f lt $g) {
            my $complex = 1;
            for my $c (1..$k-1) {
                my $h = add_mul($f, $g, $c);
                unless ($functions{$h}) {
                    $complex = 0;
                    last;
                }
            }
            
            say $out "$f,$g" if $complex;
        }
    }
}

sub add_mul {
    my $f = shift;
    my $g = shift;
    my $c = shift;
    $c //= 1;

    my @f = split //, $f;
    my @g = split //, $g;
    my @h;

    for (my $i = 0; $i < @f; $i++) {
        $h[$i] = ($f[$i] + $c*$g[$i]) % $k; 
    }

    join '', @h;
}
