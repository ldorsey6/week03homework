#!/usr/bin/perl

use strict;
use warnings;

my $file = "./q5_output";
open( my $RUN_OUT , '>' , $file ) or die( "Can't open $file ($!)" );

my $file_count = 1;

while ( $file_count <= 10 ) {

	my $file = "./seq".$file_count;
	open( my $OUT , '>' , $file ) or die( "Can't open $file ($!)" );
	my $length = 50 + int( rand( 100 - 50)) + 1;
	my $seq = random( $length, $OUT );
	my @run = ( "A" , "T" , "C" , "G" );
	foreach my $nucl ( @run ) {
		if ( $seq =~ /$nucl{4,}/ ) {
			print "$nucl run found in $file\n";
			print $RUN_OUT "$nucl run found in $file\n";
		}
	}
	$file_count++;
}


sub random{
	my ( @args ) = ( @_ );
	our $size = $args[0];
	my $out_file = $args[1];
	
	my @list = ( 'A' , 'T' , 'C' , 'G' );
	my $i = 0;
	my $sequence = '';
	while ( $i < $size ) {
		my $choice = int( rand @list ); 
		$sequence .=  $list[$choice];
		print $out_file "$list[$choice]";
		$i++;
	}
	return $sequence;	
}
