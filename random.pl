#!/usr/bin/perl

use strict;
use warnings;

my $file = "./q3_output";
open( my $OUT , '>' , $file ) or die( "Can't open $file ($!)" );

print "What sequence length would you like returned? ";
my $input = <STDIN>;
chomp $input;

my @list = ( 'A' , 'T' , 'C' , 'G' );

my $i = 0;

while ( $i < $input ) {
	my $choice = int( rand @list );
	print "$list[$choice]";
	print $OUT "$list[$choice]";
	$i++;
}
print "\n";
