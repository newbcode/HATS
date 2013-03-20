package HATS::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

HATS::Controller::Root - Root Controller for HATS

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    #$c->detach->( $c->view("TT") );
    #$c->stash->('template', 'login.tt');
    #$c->response->body( 'Root.pm TEST PAGE' );
    # Get the username and password from form
    my $username = $c->request->params->{username};
    my $password = $c->request->params->{password};
 
    # If the username and password values were found in form
    if ($username && $password) {
        # Attempt to log the user in
        if ($c->authenticate({ username => $username,
                               password => $password  } )) {
            # If successful, then let them use the application
            $c->response->redirect($c->uri_for_action('/index'));
            return;
            #$c->response->redirect($c->uri_for(
            #   $c->controller('')->action_for('list')));
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
    $c->stash(template => 'login.tt' );
}

=head2 default

Standard 404 error page

=cut

sub hats :Global {
    my ( $self, $c ) = @_;
    $c->stash(template => 'index.tt' );
}

sub about_test :Global {
    my ( $self, $c ) = @_;
    $c->response->body( 'This is page about link ' );
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

kangyunchang,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
