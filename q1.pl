#!/usr/bin/perl

use strict;
use warnings;

my $file = "./q1_output";
open( my $OUT , '>' , $file ) or die( "Can't open $file ($!)" );

for ( my $i = 1 ; $i <= 12 ; $i++ ) {
	for ( my $j = 1 ; $j <= 12 ; $j++ ) {
		my $m = $i * $j;
		print "$m ";
		print $OUT "$m ";
	}
	print "\n";
	print $OUT "\n";
}
