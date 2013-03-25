package HATS::Controller::Login;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

HATS::Controller::Login - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path Args(0) {
    my ( $self, $c ) = @_;
    my $nickname = $c->request->params->{nickname};
    my $password = $c->request->params->{password};

    if ( $nickname && $password ) { 
        if ($c->authenticate ({ nickname => $nickname,
                                password => $password })) {
            $c->response->redirect($c->uri_for( $c->controller('hats')));
            return;
        }
        else {
            $c->stash(error_msg => "Bad UserName or Password.");
        }
    }
    else {
        $c->stash(error_msg => "Empty username or password.")
        unless ($c->user_exists);
    }
    $c->stash(template => 'login.tt');
}

sub create : Local {
    my ( $self, $c ) = @_;
    #$c->response->body( 'This page is login create action');
    $c->stash(template => 'member/create.tt');
}

sub create_do :Local {
  my ( $self, $c ) = @_;

    my $nickname = $c->request->params->{nickname};
    my $email    = $c->request->params->{email};
    my $password    = $c->request->params->{password};
    my $user  =  $c->model('DB::user')->create({

        nickname => $nickname,
        email => $email,
        password => $password
  });
  # Validate and insert data into database
  $c->res->redirect($c->uri_for('/hats'));
  #$c->response->body("$nickname $email $password");
}

=head1 AUTHOR

kangyunchang,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
