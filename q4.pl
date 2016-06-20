#!/usr/bin/perl

use strict;
use warnings;

my $file = "./q4_output";
open( my $OUT , '>' , $file ) or die( "Can't open $file ($!)" );

print "What sequence length would you like returned? ";
my $input1 = <STDIN>;
chomp $input1;

print "Produce random length between 1 and $input1? Type yes, or press enter if no ";
my $input2 = <STDIN>;

my $seq = random( $OUT, $input1, $input2 );

close($OUT);

sub random{
	my ( @args ) = ( @_ );
	my $OUTPUT = $args[0];
	my $size = $args[1];
	if ( length(@args) > 2 ) {
		my $random_length = $args[2];
		chomp $random_length;
		if ( $random_length eq "yes" ) {
			$size = int( rand $size ) + 1;
		}
	}
	
	my @list = ( 'A' , 'T' , 'C' , 'G' );
	my $i = 0;
	my $sequence = '';
	while ( $i < $size ) {
		my $choice = int( rand @list );
		$sequence .=  $list[$choice];
		$i++;
	}
	print "$sequence";
	print $OUTPUT "$sequence";
	print "\n";
	return $sequence
}