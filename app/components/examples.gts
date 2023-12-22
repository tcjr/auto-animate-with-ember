import ExampleJuggle from 'ember-auto-animate/components/example-juggle';
import ActualAccordion from 'ember-auto-animate/components/actual-accordion';
import ExampleSort from 'ember-auto-animate/components/example-sort';
import ActualCards from 'ember-auto-animate/components/actual-cards';
import ActualList from 'ember-auto-animate/components/actual-list';
import ActualBoxes from 'ember-auto-animate/components/actual-boxes';

import Component from '@glimmer/component';

// eslint-disable-next-line ember/no-empty-glimmer-component-classes
export default class Examples extends Component {
  <template>
    <section><ActualBoxes /></section>
    <section><ActualList /></section>
    <section><ActualCards /></section>
    <section><ExampleSort /></section>
    <section><ActualAccordion /></section>
    <section><ExampleJuggle /></section>
  </template>
}

// Loose mode declaration for this component
declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Examples: typeof Examples;
  }
}
