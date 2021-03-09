require 'test_helper'

class GameSetTest < ActiveSupport::TestCase
  def setup
    @gs = GameSet.new(name: 'Default', user: users(:first))
  end

  test 'game set should not save without name' do
    @gs.name = nil
    assert_not @gs.save
  end

  test 'game set should not save without user association' do
    @gs.user = nil
    assert_not @gs.save
  end

  test 'game set should not save with name less than 5 characters' do
    @gs.name = 'ana'
    assert_not @gs.save
  end

  test 'game set should not save with name more than 25 characters' do
    @gs.name = 'ANonfugaexpeditaautMoleaef'
    assert_not @gs.save
  end
end
