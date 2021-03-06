#!perl

=pod

Long ago there was a problem where ack would ignore a file named
"0" because 0 is a false value in Perl.  Here we check to make sure
we don't fall prey to that again.

=cut

use warnings;
use strict;

use Test::More tests => 3;
use File::Next 0.22;

use lib 't';
use Util;

prep_environment();

BEGIN {
    use_ok( 'App::Ack' );
}

my $swamp = 't/swamp';

my @actual_swamp_perl = map { "$swamp/$_" } qw(
    0
    Makefile.PL
    options.pl
    perl.cgi
    perl.pl
    perl.pm
    perl.pod
    perl-test.t
    perl-without-extension
);

DASH_F: {
    my @args = qw( -f --perl );

    ack_sets_match( [ @args, $swamp ], \@actual_swamp_perl, 'DASH_F' );
}
