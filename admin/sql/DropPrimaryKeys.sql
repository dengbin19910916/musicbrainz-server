-- Automatically generated, do not edit.
\unset ON_ERROR_STOP

ALTER TABLE alternative_medium DROP CONSTRAINT IF EXISTS alternative_medium_pkey;
ALTER TABLE alternative_medium_track DROP CONSTRAINT IF EXISTS alternative_medium_track_pkey;
ALTER TABLE alternative_release DROP CONSTRAINT IF EXISTS alternative_release_pkey;
ALTER TABLE alternative_release_type DROP CONSTRAINT IF EXISTS alternative_release_type_pkey;
ALTER TABLE alternative_track DROP CONSTRAINT IF EXISTS alternative_track_pkey;
ALTER TABLE annotation DROP CONSTRAINT IF EXISTS annotation_pkey;
ALTER TABLE application DROP CONSTRAINT IF EXISTS application_pkey;
ALTER TABLE area DROP CONSTRAINT IF EXISTS area_pkey;
ALTER TABLE area_alias DROP CONSTRAINT IF EXISTS area_alias_pkey;
ALTER TABLE area_alias_type DROP CONSTRAINT IF EXISTS area_alias_type_pkey;
ALTER TABLE area_annotation DROP CONSTRAINT IF EXISTS area_annotation_pkey;
ALTER TABLE area_gid_redirect DROP CONSTRAINT IF EXISTS area_gid_redirect_pkey;
ALTER TABLE area_tag DROP CONSTRAINT IF EXISTS area_tag_pkey;
ALTER TABLE area_tag_raw DROP CONSTRAINT IF EXISTS area_tag_raw_pkey;
ALTER TABLE area_type DROP CONSTRAINT IF EXISTS area_type_pkey;
ALTER TABLE artist DROP CONSTRAINT IF EXISTS artist_pkey;
ALTER TABLE artist_alias DROP CONSTRAINT IF EXISTS artist_alias_pkey;
ALTER TABLE artist_alias_type DROP CONSTRAINT IF EXISTS artist_alias_type_pkey;
ALTER TABLE artist_annotation DROP CONSTRAINT IF EXISTS artist_annotation_pkey;
ALTER TABLE artist_credit DROP CONSTRAINT IF EXISTS artist_credit_pkey;
ALTER TABLE artist_credit_name DROP CONSTRAINT IF EXISTS artist_credit_name_pkey;
ALTER TABLE artist_gid_redirect DROP CONSTRAINT IF EXISTS artist_gid_redirect_pkey;
ALTER TABLE artist_ipi DROP CONSTRAINT IF EXISTS artist_ipi_pkey;
ALTER TABLE artist_isni DROP CONSTRAINT IF EXISTS artist_isni_pkey;
ALTER TABLE artist_meta DROP CONSTRAINT IF EXISTS artist_meta_pkey;
ALTER TABLE artist_rating_raw DROP CONSTRAINT IF EXISTS artist_rating_raw_pkey;
ALTER TABLE artist_tag DROP CONSTRAINT IF EXISTS artist_tag_pkey;
ALTER TABLE artist_tag_raw DROP CONSTRAINT IF EXISTS artist_tag_raw_pkey;
ALTER TABLE artist_type DROP CONSTRAINT IF EXISTS artist_type_pkey;
ALTER TABLE autoeditor_election DROP CONSTRAINT IF EXISTS autoeditor_election_pkey;
ALTER TABLE autoeditor_election_vote DROP CONSTRAINT IF EXISTS autoeditor_election_vote_pkey;
ALTER TABLE cdtoc DROP CONSTRAINT IF EXISTS cdtoc_pkey;
ALTER TABLE cdtoc_raw DROP CONSTRAINT IF EXISTS cdtoc_raw_pkey;
ALTER TABLE country_area DROP CONSTRAINT IF EXISTS country_area_pkey;
ALTER TABLE deleted_entity DROP CONSTRAINT IF EXISTS deleted_entity_pkey;
ALTER TABLE edit DROP CONSTRAINT IF EXISTS edit_pkey;
ALTER TABLE edit_area DROP CONSTRAINT IF EXISTS edit_area_pkey;
ALTER TABLE edit_artist DROP CONSTRAINT IF EXISTS edit_artist_pkey;
ALTER TABLE edit_data DROP CONSTRAINT IF EXISTS edit_data_pkey;
ALTER TABLE edit_event DROP CONSTRAINT IF EXISTS edit_event_pkey;
ALTER TABLE edit_instrument DROP CONSTRAINT IF EXISTS edit_instrument_pkey;
ALTER TABLE edit_label DROP CONSTRAINT IF EXISTS edit_label_pkey;
ALTER TABLE edit_note DROP CONSTRAINT IF EXISTS edit_note_pkey;
ALTER TABLE edit_note_recipient DROP CONSTRAINT IF EXISTS edit_note_recipient_pkey;
ALTER TABLE edit_place DROP CONSTRAINT IF EXISTS edit_place_pkey;
ALTER TABLE edit_recording DROP CONSTRAINT IF EXISTS edit_recording_pkey;
ALTER TABLE edit_release DROP CONSTRAINT IF EXISTS edit_release_pkey;
ALTER TABLE edit_release_group DROP CONSTRAINT IF EXISTS edit_release_group_pkey;
ALTER TABLE edit_series DROP CONSTRAINT IF EXISTS edit_series_pkey;
ALTER TABLE edit_url DROP CONSTRAINT IF EXISTS edit_url_pkey;
ALTER TABLE edit_work DROP CONSTRAINT IF EXISTS edit_work_pkey;
ALTER TABLE editor DROP CONSTRAINT IF EXISTS editor_pkey;
ALTER TABLE editor_collection DROP CONSTRAINT IF EXISTS editor_collection_pkey;
ALTER TABLE editor_collection_area DROP CONSTRAINT IF EXISTS editor_collection_area_pkey;
ALTER TABLE editor_collection_artist DROP CONSTRAINT IF EXISTS editor_collection_artist_pkey;
ALTER TABLE editor_collection_deleted_entity DROP CONSTRAINT IF EXISTS editor_collection_deleted_entity_pkey;
ALTER TABLE editor_collection_event DROP CONSTRAINT IF EXISTS editor_collection_event_pkey;
ALTER TABLE editor_collection_instrument DROP CONSTRAINT IF EXISTS editor_collection_instrument_pkey;
ALTER TABLE editor_collection_label DROP CONSTRAINT IF EXISTS editor_collection_label_pkey;
ALTER TABLE editor_collection_place DROP CONSTRAINT IF EXISTS editor_collection_place_pkey;
ALTER TABLE editor_collection_recording DROP CONSTRAINT IF EXISTS editor_collection_recording_pkey;
ALTER TABLE editor_collection_release DROP CONSTRAINT IF EXISTS editor_collection_release_pkey;
ALTER TABLE editor_collection_release_group DROP CONSTRAINT IF EXISTS editor_collection_release_group_pkey;
ALTER TABLE editor_collection_series DROP CONSTRAINT IF EXISTS editor_collection_series_pkey;
ALTER TABLE editor_collection_type DROP CONSTRAINT IF EXISTS editor_collection_type_pkey;
ALTER TABLE editor_collection_work DROP CONSTRAINT IF EXISTS editor_collection_work_pkey;
ALTER TABLE editor_language DROP CONSTRAINT IF EXISTS editor_language_pkey;
ALTER TABLE editor_oauth_token DROP CONSTRAINT IF EXISTS editor_oauth_token_pkey;
ALTER TABLE editor_preference DROP CONSTRAINT IF EXISTS editor_preference_pkey;
ALTER TABLE editor_subscribe_artist DROP CONSTRAINT IF EXISTS editor_subscribe_artist_pkey;
ALTER TABLE editor_subscribe_artist_deleted DROP CONSTRAINT IF EXISTS editor_subscribe_artist_deleted_pkey;
ALTER TABLE editor_subscribe_collection DROP CONSTRAINT IF EXISTS editor_subscribe_collection_pkey;
ALTER TABLE editor_subscribe_editor DROP CONSTRAINT IF EXISTS editor_subscribe_editor_pkey;
ALTER TABLE editor_subscribe_label DROP CONSTRAINT IF EXISTS editor_subscribe_label_pkey;
ALTER TABLE editor_subscribe_label_deleted DROP CONSTRAINT IF EXISTS editor_subscribe_label_deleted_pkey;
ALTER TABLE editor_subscribe_series DROP CONSTRAINT IF EXISTS editor_subscribe_series_pkey;
ALTER TABLE editor_subscribe_series_deleted DROP CONSTRAINT IF EXISTS editor_subscribe_series_deleted_pkey;
ALTER TABLE editor_watch_artist DROP CONSTRAINT IF EXISTS editor_watch_artist_pkey;
ALTER TABLE editor_watch_preferences DROP CONSTRAINT IF EXISTS editor_watch_preferences_pkey;
ALTER TABLE editor_watch_release_group_type DROP CONSTRAINT IF EXISTS editor_watch_release_group_type_pkey;
ALTER TABLE editor_watch_release_status DROP CONSTRAINT IF EXISTS editor_watch_release_status_pkey;
ALTER TABLE event DROP CONSTRAINT IF EXISTS event_pkey;
ALTER TABLE event_alias DROP CONSTRAINT IF EXISTS event_alias_pkey;
ALTER TABLE event_alias_type DROP CONSTRAINT IF EXISTS event_alias_type_pkey;
ALTER TABLE event_annotation DROP CONSTRAINT IF EXISTS event_annotation_pkey;
ALTER TABLE event_gid_redirect DROP CONSTRAINT IF EXISTS event_gid_redirect_pkey;
ALTER TABLE event_meta DROP CONSTRAINT IF EXISTS event_meta_pkey;
ALTER TABLE event_rating_raw DROP CONSTRAINT IF EXISTS event_rating_raw_pkey;
ALTER TABLE event_tag DROP CONSTRAINT IF EXISTS event_tag_pkey;
ALTER TABLE event_tag_raw DROP CONSTRAINT IF EXISTS event_tag_raw_pkey;
ALTER TABLE event_type DROP CONSTRAINT IF EXISTS event_type_pkey;
ALTER TABLE gender DROP CONSTRAINT IF EXISTS gender_pkey;
ALTER TABLE instrument DROP CONSTRAINT IF EXISTS instrument_pkey;
ALTER TABLE instrument_alias DROP CONSTRAINT IF EXISTS instrument_alias_pkey;
ALTER TABLE instrument_alias_type DROP CONSTRAINT IF EXISTS instrument_alias_type_pkey;
ALTER TABLE instrument_annotation DROP CONSTRAINT IF EXISTS instrument_annotation_pkey;
ALTER TABLE instrument_gid_redirect DROP CONSTRAINT IF EXISTS instrument_gid_redirect_pkey;
ALTER TABLE instrument_tag DROP CONSTRAINT IF EXISTS instrument_tag_pkey;
ALTER TABLE instrument_tag_raw DROP CONSTRAINT IF EXISTS instrument_tag_raw_pkey;
ALTER TABLE instrument_type DROP CONSTRAINT IF EXISTS instrument_type_pkey;
ALTER TABLE iso_3166_1 DROP CONSTRAINT IF EXISTS iso_3166_1_pkey;
ALTER TABLE iso_3166_2 DROP CONSTRAINT IF EXISTS iso_3166_2_pkey;
ALTER TABLE iso_3166_3 DROP CONSTRAINT IF EXISTS iso_3166_3_pkey;
ALTER TABLE isrc DROP CONSTRAINT IF EXISTS isrc_pkey;
ALTER TABLE iswc DROP CONSTRAINT IF EXISTS iswc_pkey;
ALTER TABLE l_area_area DROP CONSTRAINT IF EXISTS l_area_area_pkey;
ALTER TABLE l_area_artist DROP CONSTRAINT IF EXISTS l_area_artist_pkey;
ALTER TABLE l_area_event DROP CONSTRAINT IF EXISTS l_area_event_pkey;
ALTER TABLE l_area_instrument DROP CONSTRAINT IF EXISTS l_area_instrument_pkey;
ALTER TABLE l_area_label DROP CONSTRAINT IF EXISTS l_area_label_pkey;
ALTER TABLE l_area_place DROP CONSTRAINT IF EXISTS l_area_place_pkey;
ALTER TABLE l_area_recording DROP CONSTRAINT IF EXISTS l_area_recording_pkey;
ALTER TABLE l_area_release DROP CONSTRAINT IF EXISTS l_area_release_pkey;
ALTER TABLE l_area_release_group DROP CONSTRAINT IF EXISTS l_area_release_group_pkey;
ALTER TABLE l_area_series DROP CONSTRAINT IF EXISTS l_area_series_pkey;
ALTER TABLE l_area_url DROP CONSTRAINT IF EXISTS l_area_url_pkey;
ALTER TABLE l_area_work DROP CONSTRAINT IF EXISTS l_area_work_pkey;
ALTER TABLE l_artist_artist DROP CONSTRAINT IF EXISTS l_artist_artist_pkey;
ALTER TABLE l_artist_event DROP CONSTRAINT IF EXISTS l_artist_event_pkey;
ALTER TABLE l_artist_instrument DROP CONSTRAINT IF EXISTS l_artist_instrument_pkey;
ALTER TABLE l_artist_label DROP CONSTRAINT IF EXISTS l_artist_label_pkey;
ALTER TABLE l_artist_place DROP CONSTRAINT IF EXISTS l_artist_place_pkey;
ALTER TABLE l_artist_recording DROP CONSTRAINT IF EXISTS l_artist_recording_pkey;
ALTER TABLE l_artist_release DROP CONSTRAINT IF EXISTS l_artist_release_pkey;
ALTER TABLE l_artist_release_group DROP CONSTRAINT IF EXISTS l_artist_release_group_pkey;
ALTER TABLE l_artist_series DROP CONSTRAINT IF EXISTS l_artist_series_pkey;
ALTER TABLE l_artist_url DROP CONSTRAINT IF EXISTS l_artist_url_pkey;
ALTER TABLE l_artist_work DROP CONSTRAINT IF EXISTS l_artist_work_pkey;
ALTER TABLE l_event_event DROP CONSTRAINT IF EXISTS l_event_event_pkey;
ALTER TABLE l_event_instrument DROP CONSTRAINT IF EXISTS l_event_instrument_pkey;
ALTER TABLE l_event_label DROP CONSTRAINT IF EXISTS l_event_label_pkey;
ALTER TABLE l_event_place DROP CONSTRAINT IF EXISTS l_event_place_pkey;
ALTER TABLE l_event_recording DROP CONSTRAINT IF EXISTS l_event_recording_pkey;
ALTER TABLE l_event_release DROP CONSTRAINT IF EXISTS l_event_release_pkey;
ALTER TABLE l_event_release_group DROP CONSTRAINT IF EXISTS l_event_release_group_pkey;
ALTER TABLE l_event_series DROP CONSTRAINT IF EXISTS l_event_series_pkey;
ALTER TABLE l_event_url DROP CONSTRAINT IF EXISTS l_event_url_pkey;
ALTER TABLE l_event_work DROP CONSTRAINT IF EXISTS l_event_work_pkey;
ALTER TABLE l_instrument_instrument DROP CONSTRAINT IF EXISTS l_instrument_instrument_pkey;
ALTER TABLE l_instrument_label DROP CONSTRAINT IF EXISTS l_instrument_label_pkey;
ALTER TABLE l_instrument_place DROP CONSTRAINT IF EXISTS l_instrument_place_pkey;
ALTER TABLE l_instrument_recording DROP CONSTRAINT IF EXISTS l_instrument_recording_pkey;
ALTER TABLE l_instrument_release DROP CONSTRAINT IF EXISTS l_instrument_release_pkey;
ALTER TABLE l_instrument_release_group DROP CONSTRAINT IF EXISTS l_instrument_release_group_pkey;
ALTER TABLE l_instrument_series DROP CONSTRAINT IF EXISTS l_instrument_series_pkey;
ALTER TABLE l_instrument_url DROP CONSTRAINT IF EXISTS l_instrument_url_pkey;
ALTER TABLE l_instrument_work DROP CONSTRAINT IF EXISTS l_instrument_work_pkey;
ALTER TABLE l_label_label DROP CONSTRAINT IF EXISTS l_label_label_pkey;
ALTER TABLE l_label_place DROP CONSTRAINT IF EXISTS l_label_place_pkey;
ALTER TABLE l_label_recording DROP CONSTRAINT IF EXISTS l_label_recording_pkey;
ALTER TABLE l_label_release DROP CONSTRAINT IF EXISTS l_label_release_pkey;
ALTER TABLE l_label_release_group DROP CONSTRAINT IF EXISTS l_label_release_group_pkey;
ALTER TABLE l_label_series DROP CONSTRAINT IF EXISTS l_label_series_pkey;
ALTER TABLE l_label_url DROP CONSTRAINT IF EXISTS l_label_url_pkey;
ALTER TABLE l_label_work DROP CONSTRAINT IF EXISTS l_label_work_pkey;
ALTER TABLE l_place_place DROP CONSTRAINT IF EXISTS l_place_place_pkey;
ALTER TABLE l_place_recording DROP CONSTRAINT IF EXISTS l_place_recording_pkey;
ALTER TABLE l_place_release DROP CONSTRAINT IF EXISTS l_place_release_pkey;
ALTER TABLE l_place_release_group DROP CONSTRAINT IF EXISTS l_place_release_group_pkey;
ALTER TABLE l_place_series DROP CONSTRAINT IF EXISTS l_place_series_pkey;
ALTER TABLE l_place_url DROP CONSTRAINT IF EXISTS l_place_url_pkey;
ALTER TABLE l_place_work DROP CONSTRAINT IF EXISTS l_place_work_pkey;
ALTER TABLE l_recording_recording DROP CONSTRAINT IF EXISTS l_recording_recording_pkey;
ALTER TABLE l_recording_release DROP CONSTRAINT IF EXISTS l_recording_release_pkey;
ALTER TABLE l_recording_release_group DROP CONSTRAINT IF EXISTS l_recording_release_group_pkey;
ALTER TABLE l_recording_series DROP CONSTRAINT IF EXISTS l_recording_series_pkey;
ALTER TABLE l_recording_url DROP CONSTRAINT IF EXISTS l_recording_url_pkey;
ALTER TABLE l_recording_work DROP CONSTRAINT IF EXISTS l_recording_work_pkey;
ALTER TABLE l_release_group_release_group DROP CONSTRAINT IF EXISTS l_release_group_release_group_pkey;
ALTER TABLE l_release_group_series DROP CONSTRAINT IF EXISTS l_release_group_series_pkey;
ALTER TABLE l_release_group_url DROP CONSTRAINT IF EXISTS l_release_group_url_pkey;
ALTER TABLE l_release_group_work DROP CONSTRAINT IF EXISTS l_release_group_work_pkey;
ALTER TABLE l_release_release DROP CONSTRAINT IF EXISTS l_release_release_pkey;
ALTER TABLE l_release_release_group DROP CONSTRAINT IF EXISTS l_release_release_group_pkey;
ALTER TABLE l_release_series DROP CONSTRAINT IF EXISTS l_release_series_pkey;
ALTER TABLE l_release_url DROP CONSTRAINT IF EXISTS l_release_url_pkey;
ALTER TABLE l_release_work DROP CONSTRAINT IF EXISTS l_release_work_pkey;
ALTER TABLE l_series_series DROP CONSTRAINT IF EXISTS l_series_series_pkey;
ALTER TABLE l_series_url DROP CONSTRAINT IF EXISTS l_series_url_pkey;
ALTER TABLE l_series_work DROP CONSTRAINT IF EXISTS l_series_work_pkey;
ALTER TABLE l_url_url DROP CONSTRAINT IF EXISTS l_url_url_pkey;
ALTER TABLE l_url_work DROP CONSTRAINT IF EXISTS l_url_work_pkey;
ALTER TABLE l_work_work DROP CONSTRAINT IF EXISTS l_work_work_pkey;
ALTER TABLE label DROP CONSTRAINT IF EXISTS label_pkey;
ALTER TABLE label_alias DROP CONSTRAINT IF EXISTS label_alias_pkey;
ALTER TABLE label_alias_type DROP CONSTRAINT IF EXISTS label_alias_type_pkey;
ALTER TABLE label_annotation DROP CONSTRAINT IF EXISTS label_annotation_pkey;
ALTER TABLE label_gid_redirect DROP CONSTRAINT IF EXISTS label_gid_redirect_pkey;
ALTER TABLE label_ipi DROP CONSTRAINT IF EXISTS label_ipi_pkey;
ALTER TABLE label_isni DROP CONSTRAINT IF EXISTS label_isni_pkey;
ALTER TABLE label_meta DROP CONSTRAINT IF EXISTS label_meta_pkey;
ALTER TABLE label_rating_raw DROP CONSTRAINT IF EXISTS label_rating_raw_pkey;
ALTER TABLE label_tag DROP CONSTRAINT IF EXISTS label_tag_pkey;
ALTER TABLE label_tag_raw DROP CONSTRAINT IF EXISTS label_tag_raw_pkey;
ALTER TABLE label_type DROP CONSTRAINT IF EXISTS label_type_pkey;
ALTER TABLE language DROP CONSTRAINT IF EXISTS language_pkey;
ALTER TABLE link DROP CONSTRAINT IF EXISTS link_pkey;
ALTER TABLE link_attribute DROP CONSTRAINT IF EXISTS link_attribute_pkey;
ALTER TABLE link_attribute_credit DROP CONSTRAINT IF EXISTS link_attribute_credit_pkey;
ALTER TABLE link_attribute_text_value DROP CONSTRAINT IF EXISTS link_attribute_text_value_pkey;
ALTER TABLE link_attribute_type DROP CONSTRAINT IF EXISTS link_attribute_type_pkey;
ALTER TABLE link_creditable_attribute_type DROP CONSTRAINT IF EXISTS link_creditable_attribute_type_pkey;
ALTER TABLE link_text_attribute_type DROP CONSTRAINT IF EXISTS link_text_attribute_type_pkey;
ALTER TABLE link_type DROP CONSTRAINT IF EXISTS link_type_pkey;
ALTER TABLE link_type_attribute_type DROP CONSTRAINT IF EXISTS link_type_attribute_type_pkey;
ALTER TABLE medium DROP CONSTRAINT IF EXISTS medium_pkey;
ALTER TABLE medium_cdtoc DROP CONSTRAINT IF EXISTS medium_cdtoc_pkey;
ALTER TABLE medium_format DROP CONSTRAINT IF EXISTS medium_format_pkey;
ALTER TABLE medium_index DROP CONSTRAINT IF EXISTS medium_index_pkey;
ALTER TABLE orderable_link_type DROP CONSTRAINT IF EXISTS orderable_link_type_pkey;
ALTER TABLE place DROP CONSTRAINT IF EXISTS place_pkey;
ALTER TABLE place_alias DROP CONSTRAINT IF EXISTS place_alias_pkey;
ALTER TABLE place_alias_type DROP CONSTRAINT IF EXISTS place_alias_type_pkey;
ALTER TABLE place_annotation DROP CONSTRAINT IF EXISTS place_annotation_pkey;
ALTER TABLE place_gid_redirect DROP CONSTRAINT IF EXISTS place_gid_redirect_pkey;
ALTER TABLE place_tag DROP CONSTRAINT IF EXISTS place_tag_pkey;
ALTER TABLE place_tag_raw DROP CONSTRAINT IF EXISTS place_tag_raw_pkey;
ALTER TABLE place_type DROP CONSTRAINT IF EXISTS place_type_pkey;
ALTER TABLE recording DROP CONSTRAINT IF EXISTS recording_pkey;
ALTER TABLE recording_alias DROP CONSTRAINT IF EXISTS recording_alias_pkey;
ALTER TABLE recording_alias_type DROP CONSTRAINT IF EXISTS recording_alias_type_pkey;
ALTER TABLE recording_annotation DROP CONSTRAINT IF EXISTS recording_annotation_pkey;
ALTER TABLE recording_gid_redirect DROP CONSTRAINT IF EXISTS recording_gid_redirect_pkey;
ALTER TABLE recording_meta DROP CONSTRAINT IF EXISTS recording_meta_pkey;
ALTER TABLE recording_rating_raw DROP CONSTRAINT IF EXISTS recording_rating_raw_pkey;
ALTER TABLE recording_tag DROP CONSTRAINT IF EXISTS recording_tag_pkey;
ALTER TABLE recording_tag_raw DROP CONSTRAINT IF EXISTS recording_tag_raw_pkey;
ALTER TABLE release DROP CONSTRAINT IF EXISTS release_pkey;
ALTER TABLE release_alias DROP CONSTRAINT IF EXISTS release_alias_pkey;
ALTER TABLE release_alias_type DROP CONSTRAINT IF EXISTS release_alias_type_pkey;
ALTER TABLE release_annotation DROP CONSTRAINT IF EXISTS release_annotation_pkey;
ALTER TABLE release_country DROP CONSTRAINT IF EXISTS release_country_pkey;
ALTER TABLE release_coverart DROP CONSTRAINT IF EXISTS release_coverart_pkey;
ALTER TABLE release_gid_redirect DROP CONSTRAINT IF EXISTS release_gid_redirect_pkey;
ALTER TABLE release_group DROP CONSTRAINT IF EXISTS release_group_pkey;
ALTER TABLE release_group_alias DROP CONSTRAINT IF EXISTS release_group_alias_pkey;
ALTER TABLE release_group_alias_type DROP CONSTRAINT IF EXISTS release_group_alias_type_pkey;
ALTER TABLE release_group_annotation DROP CONSTRAINT IF EXISTS release_group_annotation_pkey;
ALTER TABLE release_group_gid_redirect DROP CONSTRAINT IF EXISTS release_group_gid_redirect_pkey;
ALTER TABLE release_group_meta DROP CONSTRAINT IF EXISTS release_group_meta_pkey;
ALTER TABLE release_group_primary_type DROP CONSTRAINT IF EXISTS release_group_primary_type_pkey;
ALTER TABLE release_group_rating_raw DROP CONSTRAINT IF EXISTS release_group_rating_raw_pkey;
ALTER TABLE release_group_secondary_type DROP CONSTRAINT IF EXISTS release_group_secondary_type_pkey;
ALTER TABLE release_group_secondary_type_join DROP CONSTRAINT IF EXISTS release_group_secondary_type_join_pkey;
ALTER TABLE release_group_tag DROP CONSTRAINT IF EXISTS release_group_tag_pkey;
ALTER TABLE release_group_tag_raw DROP CONSTRAINT IF EXISTS release_group_tag_raw_pkey;
ALTER TABLE release_label DROP CONSTRAINT IF EXISTS release_label_pkey;
ALTER TABLE release_meta DROP CONSTRAINT IF EXISTS release_meta_pkey;
ALTER TABLE release_packaging DROP CONSTRAINT IF EXISTS release_packaging_pkey;
ALTER TABLE release_raw DROP CONSTRAINT IF EXISTS release_raw_pkey;
ALTER TABLE release_status DROP CONSTRAINT IF EXISTS release_status_pkey;
ALTER TABLE release_tag DROP CONSTRAINT IF EXISTS release_tag_pkey;
ALTER TABLE release_tag_raw DROP CONSTRAINT IF EXISTS release_tag_raw_pkey;
ALTER TABLE release_unknown_country DROP CONSTRAINT IF EXISTS release_unknown_country_pkey;
ALTER TABLE replication_control DROP CONSTRAINT IF EXISTS replication_control_pkey;
ALTER TABLE script DROP CONSTRAINT IF EXISTS script_pkey;
ALTER TABLE series DROP CONSTRAINT IF EXISTS series_pkey;
ALTER TABLE series_alias DROP CONSTRAINT IF EXISTS series_alias_pkey;
ALTER TABLE series_alias_type DROP CONSTRAINT IF EXISTS series_alias_type_pkey;
ALTER TABLE series_annotation DROP CONSTRAINT IF EXISTS series_annotation_pkey;
ALTER TABLE series_gid_redirect DROP CONSTRAINT IF EXISTS series_gid_redirect_pkey;
ALTER TABLE series_ordering_type DROP CONSTRAINT IF EXISTS series_ordering_type_pkey;
ALTER TABLE series_tag DROP CONSTRAINT IF EXISTS series_tag_pkey;
ALTER TABLE series_tag_raw DROP CONSTRAINT IF EXISTS series_tag_raw_pkey;
ALTER TABLE series_type DROP CONSTRAINT IF EXISTS series_type_pkey;
ALTER TABLE tag DROP CONSTRAINT IF EXISTS tag_pkey;
ALTER TABLE tag_relation DROP CONSTRAINT IF EXISTS tag_relation_pkey;
ALTER TABLE track DROP CONSTRAINT IF EXISTS track_pkey;
ALTER TABLE track_gid_redirect DROP CONSTRAINT IF EXISTS track_gid_redirect_pkey;
ALTER TABLE track_raw DROP CONSTRAINT IF EXISTS track_raw_pkey;
ALTER TABLE url DROP CONSTRAINT IF EXISTS url_pkey;
ALTER TABLE url_gid_redirect DROP CONSTRAINT IF EXISTS url_gid_redirect_pkey;
ALTER TABLE vote DROP CONSTRAINT IF EXISTS vote_pkey;
ALTER TABLE work DROP CONSTRAINT IF EXISTS work_pkey;
ALTER TABLE work_alias DROP CONSTRAINT IF EXISTS work_alias_pkey;
ALTER TABLE work_alias_type DROP CONSTRAINT IF EXISTS work_alias_type_pkey;
ALTER TABLE work_annotation DROP CONSTRAINT IF EXISTS work_annotation_pkey;
ALTER TABLE work_attribute DROP CONSTRAINT IF EXISTS work_attribute_pkey;
ALTER TABLE work_attribute_type DROP CONSTRAINT IF EXISTS work_attribute_type_pkey;
ALTER TABLE work_attribute_type_allowed_value DROP CONSTRAINT IF EXISTS work_attribute_type_allowed_value_pkey;
ALTER TABLE work_gid_redirect DROP CONSTRAINT IF EXISTS work_gid_redirect_pkey;
ALTER TABLE work_language DROP CONSTRAINT IF EXISTS work_language_pkey;
ALTER TABLE work_meta DROP CONSTRAINT IF EXISTS work_meta_pkey;
ALTER TABLE work_rating_raw DROP CONSTRAINT IF EXISTS work_rating_raw_pkey;
ALTER TABLE work_tag DROP CONSTRAINT IF EXISTS work_tag_pkey;
ALTER TABLE work_tag_raw DROP CONSTRAINT IF EXISTS work_tag_raw_pkey;
ALTER TABLE work_type DROP CONSTRAINT IF EXISTS work_type_pkey;
