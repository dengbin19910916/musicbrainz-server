/*
 * @flow strict-local
 * Copyright (C) 2019 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import {bracketedText} from '../../utility/bracketed';

import {
  NOOP,
  SEARCH_AGAIN,
  SHOW_MORE_RESULTS,
  TOGGLE_INDEXED_SEARCH,
} from './actions';
import type {
  ActionItem,
  SearchableType,
} from './types';

export const ARIA_LIVE_STYLE: {
  +height: string,
  +left: string,
  +overflow: string,
  +position: string,
  +top: string,
  +width: string,
} = Object.seal({
  height: '1px',
  left: '-1px',
  overflow: 'hidden',
  position: 'absolute',
  top: '-1px',
  width: '1px',
});

export const DISPLAY_NONE_STYLE = {display: 'none'};

export const EMPTY_ARRAY: $ReadOnlyArray<empty> = Object.freeze([]);

export const MENU_ITEMS: {+[name: string]: ActionItem<empty>, ...} = {
  ERROR_TRY_AGAIN_DIRECT: {
    action: TOGGLE_INDEXED_SEARCH,
    id: 'error-try-again-direct',
    name: N_l('Try again with direct search.'),
  },
  ERROR_TRY_AGAIN_INDEXED: {
    action: TOGGLE_INDEXED_SEARCH,
    id: 'error-try-again-indexed',
    name: N_l('Try again with indexed search.'),
  },
  LOOKUP_ERROR: {
    action: NOOP,
    id: 'lookup-error',
    name: N_l('An error occurred while looking up the MBID you entered.'),
  },
  LOOKUP_TYPE_ERROR: {
    action: NOOP,
    id: 'lookup-type-error',
    name: N_l('The type of entity you pasted isn’t supported here.'),
  },
  NO_RESULTS: {
    action: NOOP,
    id: 'no-results',
    name: () => bracketedText(l('No results')),
  },
  SEARCH_ERROR: {
    action: SEARCH_AGAIN,
    id: 'try-again',
    name: N_l('An error occurred while searching. Click here to try again.'),
    separator: true,
  },
  SHOW_MORE: {
    action: SHOW_MORE_RESULTS,
    id: 'show-more',
    name: N_l('Show more...'),
    separator: true,
  },
  TRY_AGAIN_DIRECT: {
    action: TOGGLE_INDEXED_SEARCH,
    id: 'try-again-direct',
    name: N_l('Not found? Try again with direct search.'),
    separator: true,
  },
  TRY_AGAIN_INDEXED: {
    action: TOGGLE_INDEXED_SEARCH,
    id: 'try-again-indexed',
    name: N_l('Slow? Switch back to indexed search.'),
    separator: true,
  },
};

export const SEARCH_PLACEHOLDERS: {
  +[type: SearchableType]: () => string,
  ...
} = {
  area: N_l('Search for an area'),
  artist: N_l('Search for an artist'),
  editor: N_l('Search for an editor'),
  event: N_l('Search for an event'),
  instrument: N_l('Search for an instrument'),
  label: N_l('Search for a label'),
  place: N_l('Search for a place'),
  recording: N_l('Search for a recording'),
  release: N_l('Search for a release'),
  release_group: N_l('Search for a release group'),
  series: N_l('Search for a series'),
  work: N_l('Search for a work'),
};
