#! /usr/bin/perl

use warnings;
use 5.018;
use File::Temp qw( tempfile tempdir);
use File::Copy;

my ($out, $filename) = tempfile(SUFFIX => '.tex', DIR => ".", UNLINK => 1);

print $out <<'END';
\documentclass[a4paper, 12pt]{article}

\usepackage[utf8]{inputenc}
\usepackage[russian]{babel}

\begin{document}

END

my $fun = '[0,1,4]';
my @vectors_ = split ('\n', `./PolyMatrix AllFamily $fun`);
my @vectors = map {s/(\[|\])/\\$1/g; $_} split ('\n', `./PolyMatrix AllFamily $fun`);
my @functions = qw(f g h p s t);
my %substs; @substs{@vectors} = @functions;

for my $f (@vectors_) {
    say $out '$',$substs{$f =~ s/(\[|\])/\\$1/gr},'=f_{(',$f =~ s/\[|\]//gr,')}','$';

    open(my $fh, "./PolyMatrix Polynomials $f|") or die $!;

    print $out "\$\$\n\\begin{array}{l}\n";
    while (<$fh>) {
        chomp;
        #print "$_\n";
        s/;(1;)?//g;
        #print "$_\n";
        for my $key (keys %substs) {
            s/$key/{\\cdot}$substs{$key}_{n}/g;
            #s/$key/$substs{$key}/g;
        }
        s/(\a*)_\{n\}/$1_{n+1}/;
        s/\{\\cdot\}//;
        s/(\s)\{\\cdot\}/$1/g;
        s/(\d+)//;#d: $1,\\ /;
        s/;(1;)?//g;
        s/(x(\^\{\d+\})?)(\d+)/$3$1/g;
        s/(\(x\+\d+\)(\^\{\d+\})?)(\d+)/$3$1/g;
        s/x/x_{n+1}/g;
        print $out "$_ \\\\\n";
    }
    print $out "\\end{array}\n\$\$\n\n";
}

say $out '\end{document}';

system "pdflatex $filename &> /dev/null";
unlink $filename;
$filename =~ s/(.*).tex/$1/;
unlink ($filename . '.aux');
unlink ($filename . '.log');
move(($filename . '.pdf'), 'proof.pdf');
exec 'xdg-open proof.pdf';
