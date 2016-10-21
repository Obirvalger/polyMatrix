#! /usr/bin/perl

use strict;
use Math::BigRat;
use feature qw(say);
use Data::Dumper;

my $k = 5;
my $test = 1; # run testing functions?

# strings, representing operators (regexp form)
my $in_plus_s  = q/ <\+> /;
my $out_plus_s = q/ >\+< /;
my $c_mul_s    = q/\./;
my $x_mul_s    = q/\*/;

# regular expressions from strings
my $in_plus_r  = qr/$in_plus_s/;
my $out_plus_r = qr/$out_plus_s/;
my $c_mul_r    = qr/$c_mul_s/;
my $x_mul_r    = qr/$x_mul_s/;

# make operator strings look normal
$in_plus_s  =~ s/\\//g;
$out_plus_s =~ s/\\//g;
$c_mul_s    =~ s/\\//;
$x_mul_s   =~ s/\\//g;

my $f0 = "g*x^4 + h*x^3 + g*x^2 + h*x + g";
my $f1 = "h*x^4 + 2*g*x^3 + h*x^2 + 2*g*x + h";
my $f2 = "(g + h)*x^4 + (2*g + h)*x^3 + (g + h)*x^2 + (2*g + h)*x + (g + h)";
my $f3 = "(g + 2*h)*x^4 + (4*g + h)*x^3 + (g + 2*h)*x^2 + (4*g + h)*x + (g + 2*h)";
my $f4 = "(g + 3*h)*x^4 + (g + h)*x^3 + (g + 3*h)*x^2 + (g + h)*x + (g + 3*h)";
my $f5 = "(g + 4*h)*x^4 + (3*g + h)*x^3 + (g + 4*h)*x^2 + (3*g + h)*x + (g + 4*h)";

my @functions = ($f0, $f1, $f2, $f3, $f4, $f5);
test_zero_polarization(@functions) if $test;
test_in_out_identity(@functions) if $test;
test_arithmetic_operations(@functions) if $test;

my $ss = $f4;
my $ds = 1;

latex_polarizations(@functions);

#say is_complex(@functions);
#$, = "\n"; say @functions;
#say "$ss\n";
#say "@{[const_multiply(0, $ss)]}\n";
#say plus($ss, $ss);
#say "@{[expand(in_format($ss))]}\n";
#say "@{[in_format($ss)]}\n";
#say "@{[polarize(in_format($ss), $ds)]}\n";
#say $ss;
#say "@{[out_format(polarize(in_format($ss), $ds))]}\n";

sub latex_polarizations {
    for my $fun (@functions) {
        #say $fun;
        say '$$\begin{array}{l}';
        for my $d (0..$k-1) {
            my $ps = out_format(polarize(in_format($fun), $d));
            $ps =~ s/\*//g;
            #my $ns = split($out_plus_r, $ps);
            #die "$ns; $ps" if $ns != 5;
            #say "d = $d";
            say "@{[out_format($ps)]} \\\\";
        }
        say '\end{array}$$';
        #say "\n";
    }
}

sub is_complex {
    my $res = 1;

    for my $fun (@functions) {
        for my $d (1..$k-1) {
            my $ps = polarize(in_format($fun), $d);
            my $ns = split($out_plus_r, $ps);
            if ($ns != $k) {
                say "Only $ns summands in\n@{[out_format($ps)]}";
                $res = 0;
                last;
            }
        }
    }

    $res;
}

sub plus {
    my @a = @_;
    out_format(collect(join($out_plus_s,
        map {expand(in_format($_))} @a)));
}

sub const_multiply {
    my ($c, $s) = @_;
    $s = expand(in_format($s));
    $s =~ s/(\d+)\./($1*$c)%$k . '.'/ge;
    out_format(collect($s));
}

sub in_format {
    $_ = shift;
    
    # experemental
    # s/(\s*)(([a-wyz0-9\*]+\s*\+\s*)+)(\s*[a-wyz0-9\*]*$)/$1($2$4)/

    # plus
    s/\(([\w\d\.\*]+?)\s*\+\s*([\w\d\.\*]+?)\)/($1Plus$2)/g;
    s/(\s\+\s)/$out_plus_s/g;
    s/([\w\d\(\)])\+([\w\d\(\)])/$1$out_plus_s$2/g;
    s/Plus/$in_plus_s/g;

    # multiply
    s/(\d+)\*([a-z]+)/$1.$2/g;
    s/(\d+)([a-z]+)/$1.$2/g;
    s/([^\*\.])([a-z]+)/${1}1.$2/g;
    s/^([a-z]+)/1.$1/;

    # power
    s/([a-z]+)$/$1*x^0/;
    s/\)$/)*x^0/g;
    s/x([^\^])/x^1$1/g;
    s/x$/x^1/;

    $_;
}

sub out_format {
    $_ = shift;
    s/$in_plus_r/ + /g;
    s/$out_plus_r/ + /g;
    s/1$c_mul_r//g;
    s/$c_mul_r/*/g;
    s/\(x(\s*)\+(\s*)(\d+)\)\^1\b/(x$1+$2$3)/g;
    s/\*\(x\s*\+\s*\d+\)\^0//g;
    s/x\^1\b/x/g;
    s/\*x\^0//g;

    $_;
}

sub polarize {
    sub powM {
        my ($x, $d, $e) = @_;
        my @summands;

        for (my $i = 0; $i <= $e+0; $i++) {
            my $c = (binomial($e, $i) * $d ** $i) % $k; # const
            my $p = $e - $i; # power
            my $xs = "x^$p";
            my $cs = "$c$c_mul_s";
            my $ss = $cs . $xs;
            $ss = "" if $c == 0;
            push @summands, $ss if $ss;
        }

        my $res = join($in_plus_s, @summands);
        return "($res)"
    }

    my ($s, $d) = @_;
    $s =~ s/(x)\^(.)/powM($1, $d, $2)/ge;
    my $res = collect(expand($s));
    $res =~ s/x/(x+$d)/g if $d != 0;
    $res;
}

sub collect {
    sub sort_powers {
        my ($a, $b) = @_;
        my ($tmp, $ad) = split(/\^/, $a);
        my ($tmp, $bd) = split(/\^/, $b);
        $ad <=> $bd;
    }

    my $dp = 0; # debugging print
    my $s = shift;
    my %powers;
    my @summands;

    for my $summand (split($out_plus_r, $s)) {
        my ($cf, $x_pow) = split($x_mul_r, $summand);
        my ($cs, $fs) = split($c_mul_r, $cf);
        ${$powers{$x_pow}}{$fs} += $cs;
        ${$powers{$x_pow}}{$fs} %= $k;
    }

    print Dumper(%powers) if $dp;
    
    for my $x_pow (sort {sort_powers($b, $a)} keys %powers) {
        my @functions = sort {$a cmp $b} keys %{$powers{$x_pow}};
        @functions = grep {${$powers{$x_pow}}{$_} != 0} @functions;
        if (@functions == 0) {
            # do nothing
        } elsif (@functions == 1) {
            push @summands,
                "${$powers{$x_pow}}{$functions[0]}.$functions[0]*$x_pow"
        } else {
            push @summands, 
                qq[(@{[join($in_plus_s, (map {"${$powers{$x_pow}}{$_}.$_"}
                    @functions))]})$x_mul_s$x_pow];
        }
    }
    join $out_plus_s, @summands;
}

sub expand { 
    sub expand_one {
        my $dp = 0; # debugging print
        my $s = shift;
        say $s if $dp; 
        $s =~ s/\(|\)//g;
        my @summands;
        my @multipliers = split($x_mul_r, $s);
        # multiplication of summs
        my @mos = map {[split($in_plus_r, $_)]} @multipliers;
        print Dumper(@mos) if $dp;

        for my $fun (@{@mos[0]}) {
            my ($cf, $fs) = split($c_mul_r, $fun);
            for my $var (@{@mos[1]}) {
                my ($cx, $xs);
                if ($var =~ /^\d+\./) {
                    ($cx, $xs) = split($c_mul_r, $var);
                } else {
                    $cx = 1;
                    $xs = $var;
                }
                my $cs = $cf * $cx % $k;
                push @summands, "$cs$c_mul_s$fs$x_mul_s$xs";
            }
        }
        
        my $res = join $out_plus_s, @summands;
        say "$res\n" if $dp;
        return $res;
    }

    return (join $out_plus_s, ((map {expand_one($_)}
        (split($out_plus_r, shift)))));
}

sub outer_summands {
    my $s = shift;
    #$s =~ s/\((.*?)\+(.*?)\)/($1plus$2)/g;
    my @summands = split($out_plus_r, $s);
    @summands;
}

sub binomial { 
    my( $n, $r ) = @_;
    return unless defined $n && 
        $n =~ /^\d+$/ && 
        defined $r && 
        $r =~ /^\d+$/;
    
    my $product = 1;
    while( $r > 0 ) {
        $product *= $n--;
        $product /= $r--;
    }
    return $product;
}

sub test_in_out_identity {
    for my $fs (@_) {
        my $in1 = in_format($fs);
        my $in2 = in_format(in_format($fs));
        my $out1 = out_format(in_format($fs));
        my $out2 = out_format(out_format(in_format($fs)));
        
        die "Formulas:\n$fs\n$in1\n$in2\nin_format is not identity operation" 
            if $in1 ne $in2;
        die "Formulas:\n$fs\n$out1\n$out2\nout_format is not identity operation"
            if $out1 ne $out2;
    }
}

sub test_arithmetic_operations {
    for my $fs (@_) {
        my $times0 = const_multiply(0, $fs);
        my $times1 = const_multiply(1, $fs);
        my $times2 = const_multiply(2, $fs);
        my $sum = plus($fs, $fs);
        my $sum0 = plus($fs, $times0);

        die "Multiplication by 2 does not equal to addition to itself"
            if $sum ne $times2;
        die "Multiplication by 1 does not identity" if $times1 ne $fs;
        die "Multiplication by 0 does not return empty string"
            if $times0 ne '';
        die "Addition an empty string (multiplied by zero formula) does not identity"
            if $sum0 ne $fs;
    }
}

sub test_zero_polarization {
    for my $fs (@_) {
        my $out = out_format(polarize(in_format($fs), 0));

        die "Zero polarization:\n$out\ndoes not equal to formula:\n$fs"
            if $fs ne $out;
    }
}
