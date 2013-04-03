package HATS::Controller::Off_site;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

HATS::Controller::Off_site - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    #$c->response->body('Matched HATS::Controller::Off_site in Off_site.');
    $c->stash(template => 'off_site/off_main.tt');
}

sub write :Local {
    my ( $self, $c ) = @_;

    #$c->response->body('이슈등록 페이지 입니다');
    $c->stash(template => 'off_site/off_write.tt');
    #$c->stash(template => 'off_site/test.tt');
}
=head1 AUTHOR

newbcode,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
