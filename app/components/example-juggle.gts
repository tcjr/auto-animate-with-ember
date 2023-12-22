import { on } from '@ember/modifier';
import formkitAutoAnimate, {
  type AnimationController,
  type AutoAnimateOptions,
} from '@formkit/auto-animate';
import { modifier } from 'ember-modifier';
import { TrackedArray, TrackedObject } from 'tracked-built-ins';
import './example-juggle.css';

const balls = new TrackedArray(['red', 'green', 'blue']);
const juggler = new TrackedObject({ isEnabled: true });

let ac: AnimationController;
const autoAnimate = modifier(
  (elem: HTMLElement, _, opts: Partial<AutoAnimateOptions>) => {
    ac = formkitAutoAnimate(elem, opts);
  },
);

function toggle() {
  if (juggler.isEnabled) {
    ac.disable();
  } else {
    ac.enable();
  }
  juggler.isEnabled = !juggler.isEnabled;
}
setInterval(() => {
  balls.push(balls.shift()!);
}, 600);

<template>
  <div class='juggle-example'>
    <ul class='balls' {{autoAnimate duration=500}}>
      {{#each balls as |color|}}
        <li class={{color}}>{{color}}</li>
      {{/each}}
    </ul>
    <div>
      <button class='button button--alt' type='button' {{on 'click' toggle}}>
        {{if juggler.isEnabled '🚫 Disable' '✅ Enable'}}
        animations
      </button>
    </div>
  </div>
</template>
