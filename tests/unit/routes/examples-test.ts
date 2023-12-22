import { module, test } from 'qunit';
import { setupTest } from 'auto-animate-with-ember/tests/helpers';

module('Unit | Route | examples', function (hooks) {
  setupTest(hooks);

  test('it exists', function (assert) {
    const route = this.owner.lookup('route:examples');
    assert.ok(route);
  });
});
