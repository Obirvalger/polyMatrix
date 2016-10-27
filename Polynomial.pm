    #! /usr/bin/perl

use strict;
use warnings;
use Carp;
use feature 'say';

our $k = 2; # declare specific our $k you need in your scrit

sub print_poly {
    my $f = shift;
    my $d = shift;
    $d //= 0;
    my @res;

    my @p = reverse split //, make_poly($f, $d);
    for my $i (0..@p-1) {
        my $pow = $k - 1 - $i;
        my $xs;

        if ($pow == 0) {
            $xs = 1;
        } elsif ($pow == 1) {
            $xs = "(x+$d)";
            $xs = "x" if $d == 0;
        } else {
            $xs = "(x+$d)^$pow";
            $xs = "x^$pow" if $d == 0;
        }

        my $c = $p[$i];
        if ($c == 0) {
            # do nothing    
        }
        elsif ($c == 1) {
            push @res, $xs;
        } else {
            push @res, "$c*$xs" if $xs ne 1;
            push @res, $c if $xs eq 1;
        }
    }

    join ' + ', @res;
}

sub filter_complex {
    my $treshold = shift;
    open(my $fh, '<', 'functions_5_1.txt');
    while (my $fun = <$fh>) {
        chomp $fun;
        say $fun if is_complex($fun, $treshold);
        #say "$fun; @{[make_poly($fun,0)]}" if is_complex($fun);
        #$i++;
        #last if $i > 166;
    }
}

sub all_polarizations {
    my $f = shift;
    my @res;

    for my $d (0..$k-1) {
        push @res, make_poly($f, $d);
    }

    @res;
}

sub is_complex {
    my $f = shift;
    my $treshold = shift;
    my $res = 1;

    for my $d (0..$k-1) {
       if ((() = make_poly($f, $d) =~ /0/g) > $k - $treshold) {
           $res = 0;
           last;
       }
    }

    return $res;
}

sub make_poly {
    my $fun = shift;
    my $d = shift;
    my @f = split //, $fun;

    my @poly;
    $poly[0] = $f[-$d];
    for my $j (1..$k-2) {
    my $val = 0;
    for my $i (1..$k-1) {
        $val += $i**($k-1-$j) * $f[$i-$d];
    }
    $poly[$j] = (-1 * $val) % $k;
    }
    $poly[$k-1] -= $f[$_-$d] for (0..$k-1);
    $poly[$k-1] %= $k;
    join '', @poly;
}

sub make_vec {
    my $polynomial = shift;
    local $k = 5;
    my $vec = '';
    $polynomial =~ s/\^/**/g;
#     say $polynomial;
    $polynomial =~ /^[\s\d\(\)\+\*x]+$/ or croak "Wrong polynomial";
    $polynomial =~ s/x/\$i/g;
    $polynomial = "($polynomial) % $k";
    for my $i (0..$k-1) {
        $vec .= eval $polynomial;
    }
    
    $vec;
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
