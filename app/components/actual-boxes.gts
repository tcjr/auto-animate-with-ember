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

const percentageToColor = (percentage: number, maxHue = 255, minHue = 0) => {
  const hue = percentage * (maxHue - minHue) + minHue;
  return `hsl(${hue}, 100%, 50%)`;
};

const colorFor = (number: number) => {
  const percentage = number / 50;
  return percentageToColor(percentage);
};

export default class ActualBoxesComponent extends Component {
  @tracked numbers = new Array(50).fill('').map((_, i) => i);
  randomize = () => {
    this.numbers = this.numbers.sort(() => (Math.random() > 0.5 ? 1 : -1));
  };
  sort = () => {
    this.numbers = this.numbers.sort((a, b) => a - b);
  };

  <template>
    <div class='example boxes-example'>
      <div class='boxes' {{autoAnimate duration=300}}>
        {{#each this.numbers as |number|}}
          <div
            class='box'
            style='background-color: {{colorFor number}}'
          >{{number}}</div>
        {{/each}}
      </div>
      <button
        class='button button--alt'
        type='button'
        {{on 'click' this.randomize}}
      >
        Randomize
      </button>
      <button class='button button--alt' type='button' {{on 'click' this.sort}}>
        Sort
      </button>
    </div>
  </template>
}
