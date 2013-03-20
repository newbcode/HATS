package HATS::Controller::Member;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

HATS::Controller::Member - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched HATS::Controller::Member in Member.');
}

sub create :Local {
  my ( $self, $c, $user_id ) = @_;

  my $nickname     = $c->request->params->{nickname}       || 'N/A';
  my $email        = $c->request->params->{email}          || 'N/A';
  my $password     = $c->request->params->{password}       || 'N/A';

  $c->stash(template => 'member/create.tt' );
  #$c->stash(template => 'index.tt2'); 

  # Validate and insert data into database
  #$c->res->redirect($c->uri_for_action('/index'));
}

=head1 AUTHOR

newbcode,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
