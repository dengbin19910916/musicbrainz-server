package MusicBrainz::Server::Data::Label;

use Moose;
use MusicBrainz::Server::Data::Edit;
use MusicBrainz::Server::Data::ReleaseLabel;
use MusicBrainz::Server::Entity::Label;
use MusicBrainz::Server::Data::Utils qw(
    defined_hash
    generate_gid
    partial_date_from_row
    placeholders
    load_subobjects
    query_to_list_limited
);

extends 'MusicBrainz::Server::Data::CoreEntity';
with 'MusicBrainz::Server::Data::AnnotationRole' => { type => 'label' };
with 'MusicBrainz::Server::Data::AliasRole' => { type => 'label' };
with 'MusicBrainz::Server::Data::Role::Name' => { name_table => 'label_name' };
with 'MusicBrainz::Server::Data::CoreEntityCache' => { prefix => 'label' };
with 'MusicBrainz::Server::Data::Editable' => { table => 'label' };
with 'MusicBrainz::Server::Data::RatingRole' => { type => 'label' };
with 'MusicBrainz::Server::Data::TagRole' => { type => 'label' };
with 'MusicBrainz::Server::Data::SubscriptionRole' => {
    table => 'editor_subscribe_label',
    column => 'label'
};
with 'MusicBrainz::Server::Data::BrowseRole';

sub _table
{
    return 'label ' .
           'JOIN label_name name ON label.name=name.id ' .
           'JOIN label_name sortname ON label.sortname=sortname.id';
}

sub _columns
{
    return 'label.id, gid, name.name, sortname.name AS sortname, ' .
           'type, country, editpending, labelcode, ' .
           'begindate_year, begindate_month, begindate_day, ' .
           'enddate_year, enddate_month, enddate_day, comment';
}

sub _id_column
{
    return 'label.id';
}

sub _gid_redirect_table
{
    return 'label_gid_redirect';
}

sub _column_mapping
{
    return {
        id => 'id',
        gid => 'gid',
        name => 'name',
        sort_name => 'sortname',
        type_id => 'type',
        country_id => 'country',
        label_code => 'labelcode',
        begin_date => sub { partial_date_from_row(shift, shift() . 'begindate_') },
        end_date => sub { partial_date_from_row(shift, shift() . 'enddate_') },
        edits_pending => 'editpending',
        comment => 'comment',
    };
}

sub _entity_class
{
    return 'MusicBrainz::Server::Entity::Label';
}

sub find_by_subscribed_editor
{
    my ($self, $editor_id, $limit, $offset) = @_;
    my $query = "SELECT " . $self->_columns . "
                 FROM " . $self->_table . "
                    JOIN editor_subscribe_label s ON label.id = s.label
                 WHERE s.editor = ?
                 ORDER BY name.name, label.id
                 OFFSET ?";
    return query_to_list_limited(
        $self->c->dbh, $offset, $limit, sub { $self->_new_from_row(@_) },
        $query, $editor_id, $offset || 0);
}

sub load
{
    my ($self, @objs) = @_;
    load_subobjects($self, 'label', @objs);
}

sub insert
{
    my ($self, @labels) = @_;
    my $sql = Sql->new($self->c->mb->dbh);
    my %names = $self->find_or_insert_names(map { $_->{name}, $_->{sort_name } } @labels);
    my $class = $self->_entity_class;
    my @created;
    for my $label (@labels)
    {
        my $row = $self->_hash_to_row($label, \%names);
        $row->{gid} = $label->{gid} || generate_gid();
        push @created, $class->new(
            id => $sql->InsertRow('label', $row, 'id'),
            gid => $row->{gid}
        );
    }
    return @labels > 1 ? @created : $created[0];
}

sub update
{
    my ($self, $label_id, $update) = @_;
    my $sql = Sql->new($self->c->mb->dbh);
    my %names = $self->find_or_insert_names($update->{name}, $update->{sort_name});
    my $row = $self->_hash_to_row($update, \%names);
    $sql->Update('label', $row, { id => $label_id });
    return 1;
}

sub delete
{
    my ($self, @label_ids) = @_;
    my $can_delete = 1;
    # XXX Checks to see if label is in use
    return unless $can_delete;

    $self->c->model('Relationship')->delete('label', @label_ids);
    $self->annotation->delete(@label_ids);
    $self->alias->delete(@label_ids);
    $self->tags->delete(@label_ids);
    $self->rating->delete(@label_ids);
    $self->subscription->delete(@label_ids);
    $self->remove_gid_redirects(@label_ids);
    my $sql = Sql->new($self->c->mb->dbh);
    $sql->Do('DELETE FROM label WHERE id IN (' . placeholders(@label_ids) . ')', @label_ids);
    return 1;
}

sub merge
{
    my ($self, $new_id, @old_ids) = @_;

    $self->alias->merge($new_id, @old_ids);
    $self->tags->merge($new_id, @old_ids);
    $self->rating->merge($new_id, @old_ids);
    $self->subscription->merge($new_id, @old_ids);
    $self->annotation->merge($new_id, @old_ids);
    $self->c->model('ReleaseLabel')->merge_labels($new_id, @old_ids);
    $self->c->model('Edit')->merge_entities('label', $new_id, @old_ids);
    $self->c->model('Relationship')->merge('label', $new_id, @old_ids);

    $self->_delete_and_redirect_gids('label', $new_id, @old_ids);
    return 1;
}

sub _hash_to_row
{
    my ($self, $label, $names) = @_;
    my %row = (
        begindate_year => $label->{begin_date}->{year},
        begindate_month => $label->{begin_date}->{month},
        begindate_day => $label->{begin_date}->{day},
        enddate_year => $label->{end_date}->{year},
        enddate_month => $label->{end_date}->{month},
        enddate_day => $label->{end_date}->{day},
        comment => $label->{comment},
        country => $label->{country_id},
        type => $label->{type_id},
        labelcode => $label->{label_code},
    );

    if ($label->{name}) {
        $row{name} = $names->{$label->{name}};
    }

    if ($label->{sort_name}) {
        $row{sortname} = $names->{$label->{sort_name}};
    }

    return { defined_hash(%row) };
}

sub load_meta
{
    my $self = shift;
    MusicBrainz::Server::Data::Utils::load_meta($self->c, "label_meta", sub {
        my ($obj, $row) = @_;
        $obj->rating($row->{rating}) if defined $row->{rating};
        $obj->rating_count($row->{ratingcount}) if defined $row->{ratingcount};
        $obj->last_update_date($row->{lastupdate}) if defined $row->{lastupdate};
    }, @_);
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;

=head1 COPYRIGHT

Copyright (C) 2009 Lukas Lalinsky

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

=cut
