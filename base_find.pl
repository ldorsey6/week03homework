#!/usr/bin/perl

use strict;
use warnings;

my $file = "./q5_output";
open( my $RUN_OUT , '>' , $file ) or die( "Can't open $file ($!)" );

my $file_count = 1;

while ( $file_count <= 10 ) {

	my $file = "./seq".$file_count;
	#will produce random length between 50 and 100 for starting sequence length
	my $length = 50 + int( rand( 100 - 50)) + 1;
	open( my $OUT , '>' , $file ) or die( "Can't open $file ($!)" );
	my $seq = random( $OUT, $length );
	my @run = ( "A" , "T" , "C" , "G" );
	foreach my $nucl ( @run ) {
		if ( $seq =~ /$nucl{4,}/ ) {
			print "$nucl run found in $file\n";
			print $RUN_OUT "$nucl run found in $file\n";
		}
	}
	close($OUT);
	$file_count++;
}

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