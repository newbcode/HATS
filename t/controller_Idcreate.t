use strict;
use warnings;
use Test::More;


use Catalyst::Test 'HATS';
use HATS::Controller::Idcreate;

ok( request('/idcreate')->is_success, 'Request should succeed' );
done_testing();
