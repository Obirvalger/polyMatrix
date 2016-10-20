#! /usr/bin/perl

use strict;
use Math::BigRat;
use feature qw(say);
use Data::Dumper;

my $k = 5;

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
test(@functions);

my $os = "(2.g <+> 1.h)*(1.x^3 <+> 3.x^2 <+> 3.x^1 <+> 1.x^0)"; #outer summands
my $s = "(1.g <+> 1.h)*x^4 >+< (2.g <+> 1.h)*x^3 >+< (1.g <+> 1.h)*x^2 >+< (2.g <+> 1.h)*x^1 >+< (1.g <+> 1.h)*x^0";

my $ss = $f1;
my $ds = 1;

#say "$ss\n";
#say "@{[in_format($ss)]}\n";
#say "@{[polarize(in_format($ss), $ds)]}\n";
#say "@{[out_format(polarize(in_format($ss), $ds))]}\n";

=pod
for my $fun (@functions) {
    say $fun;
    for my $d (0..$k-1) {
        my $ps = polarize(in_format($fun), $d);
        my $ns = split($out_plus_r, $ps);
        die "$ns; $ps" if $ns != 5;
        say "d = $d";
        say out_format($ps), "\n";
    }
    say "\n";
}
=cut

sub test {
    for my $fs (@_) {
        my $out = out_format(polarize(in_format($fs), 0));
        #say $fs;
        #say $out;
        die "Zero polarization does not equal to formula" unless $fs eq $out;
    }
}

sub in_format {
    $_ = shift;
    
    # experemental
    # s/(\s*)(([a-wyz0-9\*]+\s*\+\s*)+)(\s*[a-wyz0-9\*]*$)/$1($2$4)/

    # plus
    s/\((.+?)\s*\+\s*(.+?)\)/($1Plus$2)/g;
    s/\s*\+\s*/$out_plus_s/g;
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
        if (@functions == 1) {
            push @summands, "${$powers{$x_pow}}{$functions[0]}.$functions[0]*$x_pow"
        } else {
            push @summands, qq[(@{[join($in_plus_s, (map {"${$powers{$x_pow}}{$_}.$_"} @functions))]})$x_mul_s$x_pow];
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
        my @mos = map {[split($in_plus_r, $_)]} @multipliers; # multiplication of summs
        print Dumper(@mos) if $dp;

        for my $fun (@{@mos[0]}) {
            my ($cf, $fs) = split($c_mul_r, $fun);
            for my $var (@{@mos[1]}) {
                my ($cx, $xs) = split($c_mul_r, $var);
                my $cs = $cf * $cx % $k;
                push @summands, "$cs$c_mul_s$fs$x_mul_s$xs";
            }
        }
        
        my $res = join $out_plus_s, @summands;
        say "$res\n" if $dp;
        return $res;
    }

    return (join $out_plus_s, ((map {expand_one($_)} (split($out_plus_r, shift)))));
}

sub outer_summands {
    my $s = shift;
    #$s =~ s/\((.*?)\+(.*?)\)/($1plus$2)/g;
    my @summands = split($out_plus_r, $s);
    @summands;
}

sub binomial { 
    my( $n, $r ) = @_;
    return unless defined $n && $n =~ /^\d+$/ && defined $r && $r =~ /^\d+$/;
    my $product = 1;
    while( $r > 0 ) {
        $product *= $n--;
        $product /= $r--;
    }
    return $product;
}
