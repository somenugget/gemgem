require 'test_helper'

class ThingCrudTest < ActiveSupport::TestCase
  test 'persist valid' do
    thing = Thing::Create.(thing: { name: 'Rails', description: 'Cool' })
byebug
    assert thing.model.persisted?
    assert_equal thing.model.name, 'Rails'
    assert_equal thing.model.description, 'Cool'
  end
end
