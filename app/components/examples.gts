import ExampleJuggle from 'auto-animate-with-ember/components/example-juggle';
import ActualAccordion from 'auto-animate-with-ember/components/actual-accordion';
import ExampleSort from 'auto-animate-with-ember/components/example-sort';
import ActualCards from 'auto-animate-with-ember/components/actual-cards';
import ActualList from 'auto-animate-with-ember/components/actual-list';
import ActualBoxes from 'auto-animate-with-ember/components/actual-boxes';

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
