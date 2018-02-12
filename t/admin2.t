#!perl -wT

# Check the admin 2 database is sensible

use strict;
use warnings;
use Test::Most tests => 4;
use lib 't/lib';
use MyLogger;

BEGIN {
	use_ok('Geo::Coder::Free::DB::admin2');
}

CITIES: {
	Geo::Coder::Free::DB::init(directory => 'lib/Geo/Coder/Free/databases');
	my $admin2 = new_ok('Geo::Coder::Free::DB::admin2' => [logger => new_ok('MyLogger')]);

	my $kent = $admin2->fetchrow_hashref({ concatenated_codes => 'GB.ENG.G5' });
	ok($kent->{asciiname} eq 'Kent');
}
