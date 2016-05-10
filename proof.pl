#! /usr/bin/perl

use warnings;
use 5.018;
use File::Temp qw( tempfile tempdir);
use File::Copy;

my ($out, $filename) = tempfile(SUFFIX => '.tex', DIR => ".", UNLINK => 1);

print $out <<'END';
\documentclass[a4paper, 14pt]{extarticle}

\usepackage[utf8]{inputenc}
\usepackage[russian]{babel}

\begin{document}

END

#my ($k, $fun) = (3, '[1,1,2,2]');
my ($k, $fun) = (5, '[0,1,4]');
my @vectors_ = split ('\n', `./PolyMatrix AllFamily $fun`);
singular() if $?;
my @vectors = map {my $s=$_; $s =~ s/(\[|\])/\\$1/g; $s} @vectors_;
#my @functions = qw(t h f g);
my @functions = qw(f g h p s t);
my %substs; @substs{@vectors} = @functions;

for my $f (@vectors_) {
    say $out '$',$substs{$f =~ s/(\[|\])/\\$1/gr},'=f_{(',$f =~ s/\[|\]//gr,')}','$';

    open(my $fh, "./PolyMatrix Polynomials $f|") or die $!;

    print $out "\$\$\n\\begin{array}{l}\n";
    while (<$fh>) {
        singular() if $?;
        chomp;
        #print "$_\n";
        s/;(1;)?//g;
        #print "$_\n";
        for my $key (keys %substs) {
            #s/$key/{\\cdot}$substs{$key}_{n}/g;
            s/$key/$substs{$key}_{n}/g;
        }
        s/(\a*)_\{n\}/$1_{n+1}/;
        s/\{\\cdot\}//;
        s/(\s)\{\\cdot\}/$1/g;
        s/(\d+)//;#d: $1,\\ /;
        s/;(1;)?//g;
        #s/(x(\^\{\d+\})?)(\d+)/$3$1/g;          # вынести коэффициент вперед
        #s/(\(x\+\d+\)(\^\{\d+\})?)(\d+)/$3$1/g; #
        s/x/x_{n+1}/g;
        print $out "$_ \\\\\n";
    }
    print $out "\\end{array}\n\$\$\n\n";
}

#say '| l ' x ($k+1) . '|';
print $out "\\begin{center} \n\\begin{tabular}";
say $out '{' . '| l ' x ($k+1) . '|}';
say $out '\hline';
say $out ' & ' . join(' & ', 0..$k-1) . ' \\\\';
say $out '\hline';

my $lens = `./PolyMatrix Length $fun`;
singular() if $?;
my $i = 0;
for (split '\n', $lens) {
    s/,/ & /g;
    s/[\[|\]]//g;
    s/$/ \\\\\n\\hline/g;
    say $out "\$$functions[$i++]_{1}\$ & $_";
}

say $out <<'END';
\end{tabular}
\end{center}
END

say $out '\end{document}';

#system "pdflatex $filename";#  &> /dev/null";
system "pdflatex $filename  &> /dev/null";
die "Bad latex" if $?;
move($filename, 'proof.tex');
unlink $filename;
$filename =~ s/(.*).tex/$1/;
unlink ($filename . '.aux');
unlink ($filename . '.log');
move(($filename . '.pdf'), 'proof.pdf');
system 'xdg-open proof.pdf';

sub singular {
    unlink $filename;
    say 'Singular!';
    die;
}
