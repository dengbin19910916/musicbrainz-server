package t::MusicBrainz::Server::Edit::Medium::Edit;
use Test::Routine;
use Test::More;
use Test::Fatal;
use Test::Deep qw( cmp_set );

with 't::Edit';
with 't::Context';

use MusicBrainz::Server::Constants qw( $EDIT_MEDIUM_EDIT );
use MusicBrainz::Server::Types ':edit_status';
use MusicBrainz::Server::Test qw( accept_edit reject_edit );
use MusicBrainz::Server::Data::Utils qw( artist_credit_to_ref );
use MusicBrainz::Server::Edit::Medium::Util qw( tracks_to_hash );

BEGIN { use MusicBrainz::Server::Edit::Medium::Edit }

use aliased 'MusicBrainz::Server::Entity::Artist';
use aliased 'MusicBrainz::Server::Entity::ArtistCredit';
use aliased 'MusicBrainz::Server::Entity::ArtistCreditName';
use aliased 'MusicBrainz::Server::Entity::Track';

test all => sub {

my $test = shift;
my $c = $test->c;

MusicBrainz::Server::Test->prepare_test_database($c, '+edit_medium');

my $medium = $c->model('Medium')->get_by_id(1);
is_unchanged($medium);

my $edit = create_edit($c, $medium);
isa_ok($edit, 'MusicBrainz::Server::Edit::Medium::Edit');

cmp_set($edit->related_entities->{artist}, [ 1, 2 ]);
cmp_set($edit->related_entities->{release}, [ 1 ]);
cmp_set($edit->related_entities->{release_group}, [ 1 ]);
cmp_set($edit->related_entities->{recording}, [ 1 ]);

$edit = $c->model('Edit')->get_by_id($edit->id);
$medium = $c->model('Medium')->get_by_id(1);
is_unchanged($medium);
is($medium->edits_pending, 1);

my $release = $c->model('Release')->get_by_id(1);
is($release->edits_pending, 1);

reject_edit($c, $edit);
$medium = $medium = $c->model('Medium')->get_by_id(1);
is($medium->edits_pending, 0);
$release = $c->model('Release')->get_by_id(1);
is($release->edits_pending, 0);

$edit = create_edit($c, $medium);
accept_edit($c, $edit);

$medium = $medium = $c->model('Medium')->get_by_id(1);
$c->model('Track')->load_for_tracklists($medium->tracklist);
is($medium->tracklist->tracks->[0]->name => 'Fluffles');
is($medium->format_id, 1);
is($medium->release_id, 1);
is($medium->position, 2);
is($medium->edits_pending, 0);
$release = $c->model('Release')->get_by_id(1);
is($release->edits_pending, 0);

};

test 'Edits are rejected if they conflict' => sub {
    my $test = shift;
    my $c = $test->c;
    MusicBrainz::Server::Test->prepare_test_database($c, '+edit_medium');

    my $medium = $c->model('Medium')->get_by_id(1);
    my $edit1 = create_edit($c, $medium, [
        Track->new(
            name => 'Fluffles',
            artist_credit => ArtistCredit->new(
                names => [
                    ArtistCreditName->new(
                        name => 'Warp Industries',
                        artist => Artist->new(
                            id => 2,
                            name => 'Artist',
                        )
                    )]),
            recording_id => 1,
            position => 1
        )
    ]);
    my $edit2 = create_edit($c, $medium, [
        Track->new(
            name => 'Waffles',
            artist_credit => ArtistCredit->new(
                names => [
                    ArtistCreditName->new(
                        name => 'Warp Industries',
                        artist => Artist->new(
                            id => 2,
                            name => 'Artist',
                        )
                    )]),
            recording_id => 1,
            position => 1
        )
    ]);

    accept_edit($c, $edit1);
    accept_edit($c, $edit2);

    $edit1 = $c->model('Edit')->get_by_id($edit1->id);
    $edit2 = $c->model('Edit')->get_by_id($edit2->id);

    is($edit1->status, $STATUS_APPLIED, 'edit 1 applied');
    is($edit2->status, $STATUS_FAILEDDEP, 'edit 2 has a failed dependency error');
};

test 'Ignore edits that dont change the tracklist' => sub {
    my $test = shift;
    my $c = $test->c;
    MusicBrainz::Server::Test->prepare_test_database($c, '+edit_medium');

    {
        my $medium = $c->model('Medium')->get_by_id(1);
        my $edit1 = create_edit($c, $medium);
        accept_edit($c, $edit1);
    }

    {
        my $medium = $c->model('Medium')->get_by_id(1);
        isa_ok exception { create_edit($c, $medium) }, 'MusicBrainz::Server::Edit::Exceptions::NoChanges';
    }
};

test 'Accept/failure conditions regarding links' => sub {
    my $test = shift;
    my $c    = $test->c;
    MusicBrainz::Server::Test->prepare_test_database($c, '+edit_medium');

    my $medium;

    subtest 'Adding a new recording is successful' => sub {
        $medium = $c->model('Medium')->get_by_id(1);
        $c->model('Track')->load_for_tracklists($medium->tracklist);
        $c->model('ArtistCredit')->load($medium->tracklist->all_tracks);

        my $edit = $c->model('Edit')->create(
            editor_id => 1,
            edit_type => $EDIT_MEDIUM_EDIT,
            to_edit   => $medium,
            tracklist => [
                Track->new(
                    name => 'New track 1',
                    artist_credit => ArtistCredit->new(
                        names => [
                            ArtistCreditName->new(
                                name => 'Warp Industries',
                                artist => Artist->new(
                                    id => 2,
                                    name => 'Artist',
                                )
                            )]),
                    position => 1,
                    length => undef
                )
            ]
        );

        ok !exception { $edit->accept };

        $c->model('Edit')->load_all($edit);
        is(@{ $edit->display_data->{tracklist_changes} }, 1, '1 tracklist change');
        is($edit->display_data->{tracklist_changes}->[0][0], '+', 'tracklist change is an addition');

        is(@{ $edit->display_data->{artist_credit_changes} }, 1, '1 artist credit change');
        is($edit->display_data->{artist_credit_changes}->[0][0], '+', 'artist credit change is an addition');
    };

    subtest 'Can change the recording to another existing recording' => sub {
        $medium = $c->model('Medium')->get_by_id(1);
        $c->model('Track')->load_for_tracklists($medium->tracklist);
        $c->model('ArtistCredit')->load($medium->tracklist->all_tracks);

        my $track = $medium->tracklist->tracks->[0];
        my $edit = $c->model('Edit')->create(
            editor_id => 1,
            edit_type => $EDIT_MEDIUM_EDIT,
            to_edit   => $medium,
            tracklist => [
                $track->meta->clone_object($track,
                    recording_id => 1
                )
            ]
        );

        ok !exception { $edit->accept };

        $c->model('Edit')->load_all($edit);
        is(@{ $edit->display_data->{tracklist_changes} }, 0, '0 tracklist changes');
        is(@{ $edit->display_data->{artist_credit_changes} }, 0, '0 artist credit changes');
        is(@{ $edit->display_data->{recording_changes} }, 1, '1 recording change');

        is($edit->display_data->{recording_changes}[0][1]->recording->id, 100, 'was recording 100');
        is($edit->display_data->{recording_changes}[0][2]->recording->id, 1, 'now recording 1');
    };

    # XXX TODO You should be able to do this!
    subtest 'Cannot change to a recording if its merged away (yet)' => sub {
        $medium = $c->model('Medium')->get_by_id(1);
        $c->model('Track')->load_for_tracklists($medium->tracklist);
        $c->model('ArtistCredit')->load($medium->tracklist->all_tracks);

        my $track = $medium->tracklist->tracks->[0];
        my $edit = $c->model('Edit')->create(
            editor_id => 1,
            edit_type => $EDIT_MEDIUM_EDIT,
            to_edit   => $medium,
            tracklist => [
                $track->meta->clone_object($track,
                    recording_id => 100
                )
            ]
        );

        $c->model('Recording')->merge(1, 100);

        isa_ok exception { $edit->accept }, 'MusicBrainz::Server::Edit::Exceptions::FailedDependency';
    };

    subtest 'Adding a new recording with an existing ID is successful' => sub {
        $medium = $c->model('Medium')->get_by_id(1);
        $c->model('Track')->load_for_tracklists($medium->tracklist);
        $c->model('ArtistCredit')->load($medium->tracklist->all_tracks);

        my $edit = $c->model('Edit')->create(
            editor_id => 1,
            edit_type => $EDIT_MEDIUM_EDIT,
            to_edit   => $medium,
            tracklist => [
                $medium->tracklist->all_tracks,
                Track->new(
                    name => 'New track 2',
                    artist_credit => ArtistCredit->new(
                        names => [
                            ArtistCreditName->new(
                                name => 'Warp Industries',
                                artist => Artist->new(
                                    id => 2,
                                    name => 'Artist',
                                )
                            )]),
                    position => 2,
                    recording_id => 1,
                    length => undef
                )
            ]
        );

        $edit->accept;

        $c->model('Edit')->load_all($edit);
        is(@{ $edit->display_data->{tracklist_changes} }, 1, '1 tracklist change');
        is($edit->display_data->{tracklist_changes}->[0][0], '+', 'tracklist change is an addition');

        is(@{ $edit->display_data->{artist_credit_changes} }, 1, '1 artist credit change');
        is($edit->display_data->{artist_credit_changes}->[0][0], '+', 'artist credit change is an addition');
    };

    subtest 'Changes that dont touch recording IDs can pass merges' => sub {
        $medium = $c->model('Medium')->get_by_id(1);
        $c->model('Track')->load_for_tracklists($medium->tracklist);
        $c->model('ArtistCredit')->load($medium->tracklist->all_tracks);

        my $edit = $c->model('Edit')->create(
            editor_id => 1,
            edit_type => $EDIT_MEDIUM_EDIT,
            to_edit   => $medium,
            tracklist => [
                map {
                    Track->meta->clone_object($_, name => 'Renamed track')
                } $medium->tracklist->all_tracks,
            ]
        );

        my $recording = $c->model('Recording')->insert({
            artist_credit => 1,
            name => 'New recording'
        });

        $c->model('Recording')->merge($recording->id, 1);

        $edit->accept;

        $c->model('Edit')->load_all($edit);
        is(@{ $edit->display_data->{tracklist_changes} }, 2, '2 tracklist changes');
        is($edit->display_data->{tracklist_changes}->[0][0], 'c', 'tracklist change 1 is a change');
        is($edit->display_data->{tracklist_changes}->[1][0], 'c', 'tracklist change 2 is a change');

        is(@{ $edit->display_data->{artist_credit_changes} }, 0, '0 artist credit changes');
    };
};

sub create_edit {
    my ($c, $medium, $tracklist) = @_;

    $tracklist //= [
        Track->new(
            name => 'Fluffles',
            artist_credit => ArtistCredit->new(
                names => [
                    ArtistCreditName->new(
                        name => 'Warp Industries',
                        artist => Artist->new(
                            id => 2,
                            name => 'Artist',
                        )
                    )]),
            recording_id => 1,
            position => 1
        )
    ];

    return $c->model('Edit')->create(
        editor_id => 1,
        edit_type => $EDIT_MEDIUM_EDIT,
        to_edit => $medium,
        format_id => 1,
        name => 'Edited name',
        tracklist => $tracklist,
        separate_tracklists => 1,
        position => 2,
    );
}

sub is_unchanged {
    my $medium = shift;
    is($medium->tracklist_id, 1);
    is($medium->format_id, undef);
    is($medium->release_id, 1);
    is($medium->position, 1);
}

1;
