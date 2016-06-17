#!/usr/bin/perl

use strict;
use warnings;

print "Enter regexp: ";
my $regex = <STDIN>;
chomp $regex;

my $exit = 0; 
while ( $exit == 0 ) {
	print "Enter string or 'exit' to exit: ";
	my $input = <STDIN>;
	chomp $input;
	unless ( $input =~ /exit/ ) {
		if ( $input =~ /$regex/ ) {
			print "Match!\n";
		} else {
			print "No match!\n";
		} 
	} else {
		print "bye bye!\n";
		$exit = 1;
	}	
}