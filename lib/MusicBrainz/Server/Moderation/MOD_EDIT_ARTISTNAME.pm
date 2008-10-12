#!/usr/bin/perl -w
# vi: set ts=4 sw=4 :
#____________________________________________________________________________
#
#   MusicBrainz -- the open internet music database
#
#   Copyright (C) 2000 Robert Kaye
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
#   $Id$
#____________________________________________________________________________

package MusicBrainz::Server::Moderation::MOD_EDIT_ARTISTNAME;

use strict;
use warnings;

use base 'Moderation';

use ModDefs qw( :modstatus :artistid MODBOT_MODERATOR MOD_MERGE_ARTIST );

sub Name { "Edit Artist Name" }
sub moderation_id   { 1 }

sub edit_conditions
{
    return {
        ModDefs::QUALITY_LOW => {
            duration     => 4,
            votes        => 1,
            expireaction => ModDefs::EXPIRE_ACCEPT,
            autoedit     => 1,
            name         => $_[0]->Name,
        },  
        ModDefs::QUALITY_NORMAL => {
            duration     => 14,
            votes        => 3,
            expireaction => ModDefs::EXPIRE_ACCEPT,
            autoedit     => 1,
            name         => $_[0]->Name,
        },
        ModDefs::QUALITY_HIGH => {
            duration     => 14,
            votes        => 4,
            expireaction => ModDefs::EXPIRE_REJECT,
            autoedit     => 0,
            name         => $_[0]->Name,
        },
    }
}

sub PreInsert
{
	my ($self, %opts) = @_;

	my $ar = $opts{'artist'} or die;
	my $newname = $opts{'newname'};
	$newname =~ /\S/ or die;

	die if $ar->id == VARTIST_ID;
	die if $ar->id == DARTIST_ID;

	$self->artist($ar->id);
	$self->SetPrev($ar->name);
	$self->SetNew($newname);
	$self->table("artist");
	$self->SetColumn("name");
	$self->row_id($ar->id);

    # We used to perform a duplicate artist check here, but that has been removed.
}

sub DetermineQuality
{
	my $self = shift;

	my $ar = MusicBrainz::Server::Artist->new($self->{DBH});
	$ar->id($self->{rowid});
	if ($ar->LoadFromId())
	{
        return $ar->quality;        
    }
    return &ModDefs::QUALITY_NORMAL;
}

sub IsAutoEdit
{
	my $this = shift;
	my ($old, $new) = $this->_normalise_strings($this->GetPrev, $this->GetNew);
	$old eq $new;
}

sub CheckPrerequisites
{
	my $self = shift;

	my $rowid = $self->row_id;

	if ($rowid == VARTIST_ID or $rowid == DARTIST_ID)
	{
		$self->InsertNote(MODBOT_MODERATOR, "You can't rename this artist!");
		return STATUS_ERROR;
	}

	# Load the artist by ID
	require MusicBrainz::Server::Artist;
	my $ar = MusicBrainz::Server::Artist->new($self->{DBH});
	$ar->id($rowid);
	unless ($ar->LoadFromId)
	{
		$self->InsertNote(MODBOT_MODERATOR, "This artist has been deleted");
		return STATUS_FAILEDDEP;
	}

	# Check that its name has not changed
	if ($ar->name ne $self->GetPrev)
	{
		$self->InsertNote(MODBOT_MODERATOR, "This artist has already been renamed");
		return STATUS_FAILEDPREREQ;
	}

	# Save for ApprovedAction
	$self->{_artist} = $ar;

	undef;
}

sub ApprovedAction
{
	my $this = shift;

	my $status = $this->CheckPrerequisites;
	return $status if $status;

	my $artist = $this->{_artist};
	$artist->UpdateName($this->GetNew)
		or die "Failed to update artist in MOD_EDIT_ARTISTNAME";

	STATUS_APPLIED;
}

1;
# eof MOD_EDIT_ARTISTNAME.pm
