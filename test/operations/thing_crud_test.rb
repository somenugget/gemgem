require 'test_helper'

class ThingCrudTest < ActiveSupport::TestCase
  test 'persist valid' do
    thing = Thing::Create.(params: { thing: { name: 'Rails', description: 'Cool' } })

    assert thing.success?
    assert thing[:model].persisted?
    assert_equal thing[:model].name, 'Rails'
    assert_equal thing[:model].description, 'Cool'
  end
end
