require 'test_helper'

class ThingCrudTest < ActiveSupport::TestCase
  test 'persist valid' do
    result = Thing::Create.(params: { thing: { name: 'Rails', description: 'Cool' } })

    assert result.success?
    assert result[:model].persisted?
    assert_equal result[:model].name, 'Rails'
    assert_equal result[:model].description, 'Cool'
  end
end
