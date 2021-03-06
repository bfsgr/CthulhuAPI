require 'test_helper'

class GameSetTest < ActiveSupport::TestCase
  def setup
    @gs = GameSet.new(name: 'Default2', user: users(:first))
  end

  test 'game set should not save without name' do
    @gs.name = nil
    assert_not @gs.save
  end

  test 'game set should not save without user association' do
    @gs.user = nil
    assert_not @gs.save
  end

  test 'game set should not save with name less than 3 characters' do
    @gs.name = 'an'
    assert_not @gs.save
  end

  test 'game set should not save with name more than 25 characters' do
    @gs.name = 'ANonfugaexpeditaautMoleaef'
    assert_not @gs.save
  end

  test 'game set name should be unique in a user scope' do
    assert @gs.save
    game2 = GameSet.new(name: 'Default', user: users(:first))
    assert_not game2.save
  end
end
