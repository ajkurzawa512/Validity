#!/usr/bin/perl
#

sub find_file { ## find growing fooack file
my $CMD="du -k \*fooack\*";
my @FILELIST=`$CMD`;
foreach $LINE (@FILELIST) {
	my ($size, $fn)=split (/\s+/, $LINE);
	$oldsz=${size_."$fn"};
	#print "$oldsz = $size = $fn\n";
	if($oldsz ne "" and "$oldsz" lt "$size") { 
		monitor("$fn"); 
		exit; 
	}
	${size_."$fn"}=$size;
}
sleep 5; find_file();
}

sub monitor { ## begin monitor on growing fooack file
print "MONITORING: @_\n";
while($LOOP!=1) {
	my $CMD=`du -k @_`;
	print "$CMD";
	sleep 5;
} }

find_file();

