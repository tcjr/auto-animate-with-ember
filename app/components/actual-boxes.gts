import Component from '@glimmer/component';
import { on } from '@ember/modifier';
import { tracked } from '@glimmer/tracking';
import formkitAutoAnimate, {
  type AutoAnimateOptions,
} from '@formkit/auto-animate';
import { modifier } from 'ember-modifier';
import './actual-boxes.css';

const autoAnimate = modifier(
  (elem: HTMLElement, _, opts: Partial<AutoAnimateOptions>) => {
    formkitAutoAnimate(elem, opts);
  },
);

export default class ActualBoxesComponent extends Component {
  @tracked numbers = new Array(50).fill('').map((_, i) => i);
  randomize = () => {
    this.numbers = this.numbers.sort(() => (Math.random() > 0.5 ? 1 : -1));
  };

  <template>
    <div class='example boxes-example'>
      <div class='boxes' {{autoAnimate duration=500}}>
        {{#each this.numbers as |number|}}
          <div class='box'>{{number}}</div>
        {{/each}}
      </div>
      <button
        class='button button--alt'
        type='button'
        {{on 'click' this.randomize}}
      >Randomize</button>
    </div>
  </template>
}
