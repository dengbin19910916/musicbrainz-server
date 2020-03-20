/*
 * @flow
 * Copyright (C) 2020 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import * as React from 'react';
import sortBy from 'lodash/sortBy';

import EnterEdit from '../components/EnterEdit';
import EnterEditNote from '../components/EnterEditNote';
import FieldErrors from '../components/FieldErrors';
import InstrumentList from '../components/list/InstrumentList';
import {withCatalystContext} from '../context';
import Layout from '../layout';

type Props = {
  +$c: CatalystContextT,
  +form: MergeFormT,
  +toMerge: $ReadOnlyArray<InstrumentT>,
};

const InstrumentMerge = ({$c, form, toMerge}: Props) => (
  <Layout fullWidth title={l('Merge instruments')}>
    <div id="content">
      <h1>{l('Merge instruments')}</h1>
      <p>
        {l(`You are about to merge the following instruments into a single
            instrument. Please select the instrument which you would like
            other instruments to be merged into:`)}
      </p>
      <form action={$c.req.uri} method="post">
        <InstrumentList
          instruments={sortBy(toMerge, 'name')}
          mergeForm={form}
          showArtists
          showLocation
          showType
        />
        <FieldErrors field={form.field.target} />

        <EnterEditNote field={form.field.edit_note} />

        <EnterEdit form={form}>
          <button
            className="negative"
            name="submit"
            type="submit"
            value="cancel"
          >
            {l('Cancel')}
          </button>
        </EnterEdit>
      </form>
    </div>
  </Layout>
);

export default withCatalystContext(InstrumentMerge);
