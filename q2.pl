#!/usr/bin/perl

use strict;
use warnings;

my $file = "./q2_output";
open( my $OUT , '>' , $file ) or die( "Can't open $file ($!)" );

print "What size? ";
my $input = <STDIN>;

mult_table($input);

sub mult_table {
	my( $size ) = ( @_ ); 
	for ( my $i = 1 ; $i <= $size  ; $i++ ) {
		for ( my $j = 1 ; $j <= $size  ; $j++ ) {
			my $m = $i * $j;
			printf "$m ";
			print $OUT "$m ";
		}
		print "\n";
		print $OUT "\n";
	}
}
