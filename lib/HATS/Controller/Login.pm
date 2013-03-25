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
    # Get the username and password from form
    my $username = $c->request->params->{username};
    my $password = $c->request->params->{password};
    #$c->response->body( "$password");
 
    # If the username and password values were found in form
    if ($username && $password) {
        # Attempt to log the user in
        if ($c->authenticate({ username => $username,
                               password => $password  } )) {
            # If successful, then let them use the application
            $c->res->redirect($c->uri_for('/hats'));
            return;
        } else {
            # Set an error message
            $c->stash(error_msg => "Bad username or password.");
        }
    } else {
        # Set an error message
        $c->stash(error_msg => "Empty username or password.")
            unless ($c->user_exists);
    }
    # If either of above don't work out, send to the login page
    $c->stash(template => 'login.tt');
}

sub create : Local {
    my ( $self, $c ) = @_;
    #$c->response->body( 'This page is login create action');
    $c->stash(template => 'member/create.tt');
}

sub create_do :Local {
  my ( $self, $c ) = @_;

    my $username = $c->request->params->{username};
    my $email    = $c->request->params->{email};
    my $password    = $c->request->params->{password};
    my $user  =  $c->model('DB::user')->create({

        username => $username,
        email => $email,
        password => $password
  });
  # Validate and insert data into database
  $c->res->redirect($c->uri_for('/hats'));
  #$c->response->body("$username $email $password");
}

=head1 AUTHOR

kangyunchang,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
