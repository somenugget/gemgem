require 'test_helper'

class ThingCrudTest < ActiveSupport::TestCase
  test 'thing creation' do
    result = Thing::Create.(params: { thing: { name: 'Rails', description: 'Cool' } })

    assert result.success?
    assert result[:model].persisted?
    assert_equal result[:model].name, 'Rails'
    assert_equal result[:model].description, 'Cool'
  end

  test 'thing updating' do
    thing = Thing::Create.(params: { thing: { name: 'Rails', description: 'Cool' } })[:model]

    result = Thing::Update.(params: { id: thing.id, thing: { description: 'Very cool!' } })
    assert result.success?
    assert result[:model].persisted?
    assert_equal result[:model].name, 'Rails'
    assert_equal result[:model].description, 'Very cool!'
  end

  test 'thing deleting' do
    thing = Thing::Create.(params: { thing: { name: 'Rails', description: 'Cool' } })[:model]

    result = Thing::Delete.(params: { id: thing.id })
    assert result.success?
    assert_nil Thing.find_by id: thing.id
  end

  test 'retrieves all things' do
    Thing::Create.(params: { thing: { name: 'Rails', description: 'Cool' } })
    Thing::Create.(params: { thing: { name: 'Rails', description: 'Cool' } })

    result = Thing::Index.()
    assert_equal result[:models].size, 2
  end
end
