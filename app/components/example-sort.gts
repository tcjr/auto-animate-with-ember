import { on } from '@ember/modifier';
import formkitAutoAnimate, {
  type AutoAnimateOptions,
} from '@formkit/auto-animate';
import { modifier } from 'ember-modifier';
import { TrackedArray } from 'tracked-built-ins';

const autoAnimate = modifier(
  (elem: HTMLElement, _, opts: Partial<AutoAnimateOptions>) => {
    formkitAutoAnimate(elem, opts);
  },
);

const items = new TrackedArray(['React', 'Vue', 'Svelte', 'Angular', 'Ember']);

function sortAsc() {
  items.sort();
}
function sortDesc() {
  items.sort().reverse();
}

<template>
  <div>
    <button {{on 'click' sortAsc}}>Sort A-Z ↑</button>
    <button {{on 'click' sortDesc}}>Sort Z-A ↓</button>
  </div>
  <ul {{autoAnimate duration=2000}}>
    {{#each items as |item|}}
      <li>{{item}}</li>
    {{/each}}
  </ul>
</template>
