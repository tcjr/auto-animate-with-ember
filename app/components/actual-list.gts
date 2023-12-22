import Component from '@glimmer/component';
import { on } from '@ember/modifier';
import { fn } from '@ember/helper';
import formkitAutoAnimate, {
  type AutoAnimateOptions,
} from '@formkit/auto-animate';
import { modifier } from 'ember-modifier';
import './actual-list.css';
import { TrackedArray } from 'tracked-built-ins';
import IconRemove from './icon-remove';

const autoAnimate = modifier(
  (elem: HTMLElement, _, opts: Partial<AutoAnimateOptions>) => {
    formkitAutoAnimate(elem, opts);
  },
);

export default class ActualListComponent extends Component {
  fruitBasket = [
    '🍓 Strawberry',
    '🥥 Coconut',
    '🥝 Kiwi',
    '🍇 Grape',
    '🍉 Watermelon',
    '🍍 Pineapple',
    '🍐 Pear',
    '🍑 Peach',
    '🫐 Blueberry',
    '🍊 Orange',
    '🥭 Mango',
  ];
  items = new TrackedArray(['🍎 Apple', '🍌 Banana', '🍒 Cherry']);

  randomize = () => this.items.sort(() => (Math.random() > 0.5 ? 1 : -1));

  remove = (item: string) => {
    const index = this.items.indexOf(item);
    if (index > -1) {
      this.items.splice(index, 1);
      this.fruitBasket.push(item);
    }
  };

  add = () => {
    if (this.fruitBasket.length > 0) {
      this.items.splice(
        Math.round(Math.random() * this.items.length - 1),
        0,
        this.fruitBasket.shift() || '',
      );
    } else {
      alert('Out of fruit!');
    }
  };

  <template>
    <div class='example list-example'>
      <ul {{autoAnimate}}>
        {{#each this.items as |item|}}
          <li>
            <span>{{item}}</span>
            <button
              aria-label='Remove Fruit' type="button" {{on 'click' (fn this.remove item)}}
            >
              <IconRemove />
            </button>
          </li>
        {{/each}}

      </ul>

      <button class='button button--add button--alt' type="button" {{on 'click' this.add}}>+
        Add Fruit</button>
      <button
        class='button button--random button--alt' type="button" {{on 'click' this.randomize}}
      >Randomize</button>
    </div>
  </template>
}
