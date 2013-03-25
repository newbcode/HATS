use strict;
use warnings;
use Test::More;


use Catalyst::Test 'HATS';
use HATS::Controller::Hats;

ok( request('/hats')->is_success, 'Request should succeed' );
done_testing();
