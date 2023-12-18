import { on } from '@ember/modifier';
import { fn } from '@ember/helper';
import formkitAutoAnimate, {
  type AutoAnimateOptions,
} from '@formkit/auto-animate';
import { modifier } from 'ember-modifier';
import './actual-accordion.css';
import { TrackedObject } from 'tracked-built-ins';

const autoAnimate = modifier(
  (elem: HTMLElement, _, opts: Partial<AutoAnimateOptions>) => {
    formkitAutoAnimate(elem, opts);
  },
);

const faq = [
  {
    id: 'why',
    question: 'Why did you create it?',
    answer: `We needed a way to animate DOM elements without adding to the
    virtual DOM in Vue and React. And it turned out our solution was gonna work
    great for lots of other use cases as well.`,
  },
  {
    id: 'license',
    question: 'Is it open source?',
    answer: `It sure is! AutoAnimate is MIT licensed, which basically means you
    are free to take it and do whatever you want with it. If you find it useful
    consider <a href="https://github.com/sponsors/formkit">supporting our open source efforts</a>.`,
  },
  {
    id: 'who',
    question: 'Who made this?',
    answer: `AutoAnimate is a team effort 💪 . Most of the code was written by
      <a href='https://twitter.com/jpschroeder'>Justin Schroeder</a>,
      <a href='https://twitter.com/0xBOYD'>Andrew Boyd</a> played a key
      role on the docs, and the rest of the <a href='https://formkit.com'>FormKit</a>
      team held down the fort.`,
  },
];

const current = new TrackedObject({ id: faq[0]?.id || '' });
const updateCurrent = (id: string) => {
  current.id = id;
};
const isCurrent = (id: string) => current.id === id;

<template>
  <div class='example accordion-example'>
    <ul class='accordion'>
      {{#each faq as |q|}}
        <li class='accordion-item' {{autoAnimate}}>
          <div class='question' {{on 'click' (fn updateCurrent q.id)}}>
            {{q.question}}
          </div>
          {{#if (isCurrent q.id)}}
            <p class='answer'>{{{q.answer}}}</p>
          {{/if}}
        </li>
      {{/each}}
    </ul>
  </div>
</template>
