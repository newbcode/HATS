package HATS::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'HATS::Schema',
    
    connect_info => {
        dsn => 'dbi:mysql:database=hats',
        user => 'hats',
        password => 'sado999',
    }
);

=head1 NAME

HATS::Model::DB - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<HATS>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<HATS::Schema>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.6

=head1 AUTHOR

kangyunchang

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
