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

package MusicBrainz::Server::Moderation::MOD_REMOVE_ARTIST;

use strict;
use warnings;

use base 'Moderation';

use ModDefs qw( :modstatus :artistid MODBOT_MODERATOR );

sub Name { "Remove Artist" }
sub moderation_id   { 19 }

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
	die if $ar->id == VARTIST_ID;
	die if $ar->id == DARTIST_ID;

	$self->artist($ar->id);
	$self->SetPrev($ar->name);
	$self->table("artist");
	$self->SetColumn("name");
	$self->row_id($ar->id);
}

sub DetermineQuality
{
    my $self = shift;

    my $ar = MusicBrainz::Server::Artist->new($self->{DBH});
    $ar->id($self->{artist});
    if ($ar->LoadFromId())
    {
        return $ar->quality;        
    }
    return &ModDefs::QUALITY_NORMAL;
}

sub ApprovedAction
{
	my $this = shift;

	my $rowid = $this->row_id;

	if ($rowid == VARTIST_ID or $rowid == DARTIST_ID)
	{
		$this->InsertNote(MODBOT_MODERATOR, "This artist cannot be deleted");
		return STATUS_ERROR;
	}
   
	# Now remove the Artist. The Artist will only be removed
	# if there are not more references to it.
	require MusicBrainz::Server::Artist;
	my $ar = MusicBrainz::Server::Artist->new($this->{DBH});
	$ar->id($rowid);

	require UserSubscription;
	my $subs = UserSubscription->new($this->{DBH});
	$subs->ArtistBeingDeleted($ar, $this);

	unless (defined $ar->Remove)
	{
		$this->InsertNote(MODBOT_MODERATOR, "This artist could not be removed");
		return STATUS_FAILEDDEP;
	}

	STATUS_APPLIED;
}

1;
# eof MOD_REMOVE_ARTIST.pm
