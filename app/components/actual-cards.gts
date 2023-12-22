import Component from '@glimmer/component';
import { on } from '@ember/modifier';
import formkitAutoAnimate, {
  type AutoAnimateOptions,
} from '@formkit/auto-animate';
import { modifier } from 'ember-modifier';
import './actual-cards.css';
import { TrackedArray } from 'tracked-built-ins';
import { tracked } from '@glimmer/tracking';

const autoAnimate = modifier(
  (elem: HTMLElement, _, opts: Partial<AutoAnimateOptions>) => {
    formkitAutoAnimate(elem, opts);
  },
);

export default class ActualCardsComponent extends Component {
  @tracked showForm = false;
  cards = new TrackedArray([
    {
      id: Math.random(),
      title: 'Employee Lunch',
      date: 'March 31st',
      description: 'Join us for an all hands meeting.',
    },
    {
      id: Math.random(),
      title: 'Engineering scrum',
      date: 'April 10th',
      description: 'Engineering team is playing rugby.',
    },
  ]);

  createCard = () => {
    this.cards.unshift({
      id: Math.random(),
      title: 'New years party',
      date: 'January 1st',
      description: "We'll all sing yuletide carols.",
    });
    setTimeout(() => {
      this.showForm = false;
    }, 300);
  };

  toggleForm = () => {
    this.showForm = !this.showForm;
  };

  <template>
    <div class='example card-example' {{autoAnimate}}>
      {{#if this.showForm}}

        <div class='form' v-if='showForm'>
          (Not demonstrating Formkit, so skipping this part)
          <br />
          (form here)
          <br />
          (form here)
          <br />
          (form here)
          <br />
          <button type="button" {{on 'click' this.createCard}}>Create card</button>

        </div>

      {{else}}
        <button class='button button--alt' type="button" {{on 'click' this.toggleForm}}>
          + Add Event
        </button>
      {{/if}}

      <ul class='cards' {{autoAnimate}}>
        {{#each this.cards as |card|}}
          <li class='card'>
            <h4 class='title'>{{card.title}}</h4>
            <div class='date'>{{card.date}}</div>
            <div class='description'>{{card.description}}</div>
          </li>
        {{/each}}
      </ul>
    </div>
  </template>
}
