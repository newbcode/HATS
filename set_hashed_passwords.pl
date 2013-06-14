#!/usr/bin/perl
use strict;
use warnings;
use HATS::Schema;

# $ perl -Ilib set_hashed_passwords.pl 

my $schema = HATS::Schema->connect('dbi:mysql:hats', '', '');
my @users = $schema->resultset('User')->all;
foreach my $user (@users) {
    $user->password('password');
        $user->update;
        }
