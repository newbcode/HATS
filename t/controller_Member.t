use strict;
use warnings;
use Test::More;


use Catalyst::Test 'HATS';
use HATS::Controller::Member;

ok( request('/member')->is_success, 'Request should succeed' );
done_testing();
