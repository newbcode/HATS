use utf8;
package HATS::Schema::Result::Offwrite;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

HATS::Schema::Result::Offwrite

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::PassphraseColumn>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "PassphraseColumn");

=head1 TABLE: C<offwrite>

=cut

__PACKAGE__->table("offwrite");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 calltime

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 pjtname

  data_type: 'char'
  is_nullable: 0
  size: 30

=head2 callername

  data_type: 'char'
  is_nullable: 0
  size: 30

=head2 anscall

  data_type: 'char'
  is_nullable: 0
  size: 30

=head2 product

  data_type: 'char'
  is_nullable: 0
  size: 50

=head2 appname

  data_type: 'char'
  is_nullable: 0
  size: 30

=head2 remark

  data_type: 'text'
  is_nullable: 0

=head2 process

  data_type: 'integer'
  is_nullable: 0

=head2 content

  data_type: 'text'
  is_nullable: 0

=head2 created

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "calltime",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "pjtname",
  { data_type => "char", is_nullable => 0, size => 30 },
  "callername",
  { data_type => "char", is_nullable => 0, size => 30 },
  "anscall",
  { data_type => "char", is_nullable => 0, size => 30 },
  "product",
  { data_type => "char", is_nullable => 0, size => 50 },
  "appname",
  { data_type => "char", is_nullable => 0, size => 30 },
  "remark",
  { data_type => "text", is_nullable => 0 },
  "process",
  { data_type => "integer", is_nullable => 0 },
  "content",
  { data_type => "text", is_nullable => 0 },
  "created",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-03 22:50:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:U3MUg8PuYvRSXxHVCBKfUw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
