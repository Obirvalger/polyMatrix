#! /usr/bin/perl

use strict;
use warnings;
use Carp;
use Getopt::Long;
use feature qw(say);
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

my $out;
if ($outfile) {
    open($out, '>', $outfile) or
        die "Can't open '$outfile' $!";
} else {
    open($out, '>-');
}
$latex = 1 if defined $outfile and $outfile =~ /\.tex$/;
$verbose //= 1 if @functions > 1 and $latex;
$verbose //= 0; 

print $out preamble() if $latex and not $pure;

unless ($reorder) {
    while (my ($i, $function) = each @functions) {
        say $out '' if @functions > 1 and $i > 0;
        say $out "f$i = ($function)" if $verbose >= 1 and not $latex;
        say $out "\$f_$i = ($function)\$" if $verbose >= 1 and $latex;
        if (defined $polarization) {
            say poly($function, $polarization, $vector);
        } else {
            say $out '$$\\begin{array}{', 'c' x $k, '}' if $latex;
            for my $d (0..$k-1) {
                #my $s = () = make_poly($function, $_) =~ /[1-9]/g;
                #say "d = $_, s = $s, f = $f";
                my $polynomial = poly($function, $d, $vector);
                $polynomial = to_latex($polynomial,
                    zero_indexes(make_poly($function, $d))) if $latex;

                if ($latex and 0) {
                    $polynomial =~ s/\*//g;
                    $polynomial .= " \\\\";
                }
               
                say $out $polynomial;
            }
            say $out '\\end{array}$$' if $latex;
        }
    }
} else {
    say $out '\\begin{tabular}{C}' if $verbose >= 1 and $latex;
    while (my ($i, $function) = each @functions) {
        say $out "f$i = ($function)" if $verbose >= 1 and not $latex;
        say $out "f_$i = ($function) \\\\" if $verbose >= 1 and $latex;
    }
    say $out '\\end{tabular}' if $verbose >= 1 and $latex;
    for my $d (0..$k-1) {
        say $out '' if @functions > 1 and $latex;
#         say $out '\\hrulefill' if @functions > 1 and $latex;
        say $out '' if @functions > 1 and not $latex;
        say $out '\\begin{tabular}{|', 'C|' x $k, '}' if $latex;
        say $out '\\hline' if @functions > 1 and $latex;
        for my $function (@functions) {
            my $polynomial = poly($function, $d, $vector);
            $polynomial = to_latex($polynomial,
                    zero_indexes(make_poly($function, $d))) if $latex;
            
            say $out $polynomial;
        }
        say $out '\\end{tabular}' if $latex;
    }
}

print $out "\\end{document}\n" if $latex and not $pure;

sub to_latex {
    $_ = shift;
    my $zero_indexes = shift;
    my @zero_indexes = @{$zero_indexes};
    s/\*//g;
    s/\((\w+?)\s*\+\s*(\w+?)\)/($1 Plus $2)/g;
    my @summands = split /\s*\+\s*/;
    for my $i (@zero_indexes) {
        splice @summands, $i, 0, 'Nop';
=pod        
        if ($i < @summands) {
            splice @summands, $i, 0, 'Nop';
        } else {
            push @summands, 'Nop';
        }
=cut        
    }
    $_ = join " & + ", @summands;
    s/Nop\s*+//g;
    s/Nop//g;
    s/\+//g if $reorder; 
    s/Plus/+/g;
    s/$/ \\\\ \\hline/ if $reorder;
    s/$/ \\\\/ unless $reorder;
    
    $_;
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

sub preamble {
'\documentclass[a4paper, 12pt]{extarticle}
\usepackage[utf8]{inputenc}
\usepackage[russian]{babel}
\usepackage{array}
\newcolumntype{C}{>{$}c<{$}}

\begin{document}
'
}
