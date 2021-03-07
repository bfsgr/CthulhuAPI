require 'test_helper'

class GameSetTest < ActiveSupport::TestCase
  test 'game set should not save without name' do
    gs = GameSet.new(user: users(:first))
    assert_not gs.save
  end

  test 'game set should not save without user association' do
    gs = GameSet.new(name: 'Default')
    assert_not gs.save
  end

  test 'game set should not save with name less than 5 characters' do
    gs = GameSet.new(name: 'H', user: users(:first))
    assert_not gs.save
  end

  test 'game set should not save with name more than 25 characters' do
    gs = GameSet.new(name: 'ANonfugaexpeditaautMoleaef', user: users(:first))
    assert_not gs.save
  end
end
