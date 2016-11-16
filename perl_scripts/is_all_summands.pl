#! /usr/bin/perl

use strict;
use warnings;
use Carp;
use Getopt::Long;
use feature qw(say);
use Data::Dumper;
use Polynomial;

our $k;
my $latex = 0;
my @functions;
my @generics;
my $polarization;
my $reorder = 0;
my $vector = 0;
my $pure = 0;
my $verbose;
my $outfile;

Getopt::Long::Configure ("bundling");
GetOptions (
    'k=i'              => \$k,
    'l|latex'          => \$latex,
    'f|function=s'     => \@functions,
    'g|generics=s'     => \@generics,
    'd|polarization:i' => \$polarization,
    'r|reorder'        => \$reorder, # group output by polarizations
    'vectors'          => \$vector, # output vectors instead of polynomials 
    'pure'             => \$pure, # if pure enabled doesn't print preamble
    'v|verbose:3'      => \$verbose, # additional information 0 disable, 3 max
    'out=s'            => \$outfile # output file STDOUT by default
    );

if (@generics and @functions) {
    say "Only one parametr {generics, functions} could be added!";
    exit;
}

@functions = split(',', join(',', @functions));
@generics = split(',', join(',', @generics));

if (@generics) {
    @functions = @generics;
    for my $c (1..$k-1) {
        push @functions, add_mul($generics[0], $generics[1], $c);
    }
}

for my $d (0..$k-1) {
    for my $function (@functions) {
        my %set;
        my $polynomial = poly($function, $d, $vector);
        #$polynomial = to_latex($polynomial,
        #        zero_indexes(make_poly($function, $d))) if $latex;
#        say $polynomial;
        say make_poly($function, $d);
        my %zeros=map { $_ => 1 } @{zero_indexes(make_poly($function, $d))};
        if (map { $_ => 1 } grep { $set{$_} } keys %zeros) {
            say 'lol';
        }
        say '';
    }
}

sub poly {
    my $f = shift; # function
    my $d = shift; # polarization
    my $vector = shift; # to vector or to polynomial
    my $res = '';
    
    if ($vector) {
        $res = make_poly($f, $d);
    } else {
        $res = print_poly($f, $d);
        make_vec($res) eq $f or 
            croak "Polynomial: $res\ndoesn't realize the function: $f";
    }
    
    $res;
}

sub zero_indexes {
    my $string = shift;
    $string = reverse $string;
    my $char =  '0';
    my $offset = 0;
    my @zero_indexes = ();

    my $result = index($string, $char, $offset);
    while ($result != -1) {
        push @zero_indexes, $result;
        $offset = $result + 1;
        $result = index($string, $char, $offset);
    }
    
    \@zero_indexes;
}
