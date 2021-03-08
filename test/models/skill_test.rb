require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  def setup
    @skill = Skill.new(name: 'Medicina', base_value: 5, game_set: game_sets(:default))
  end

  test 'skill saves correctly' do
    assert @skill.save
  end

  test 'skill should not save without a name' do
    @skill.name = nil
    assert_not @skill.save
  end

  test 'skill should not save without a game set association' do
    @skill.game_set = nil
    assert_not @skill.save
  end

  test 'skill should not save with name less than 4 characters' do
    @skill.name = 'ana'
    assert_not @skill.save
  end

  test 'skill should not save with name more than 50 characters' do
    @skill.name = 'ANonfugaexpeditaautMolerumperspiciatisvoluptatemfug'
    assert_not @skill.save
  end

  test 'skill should not save without a base value' do
    @skill.base_value = nil
    assert_not @skill.save
  end

  test 'skill should not save with a negative base value' do
    @skill.base_value = -1
    assert_not @skill.save
  end

  test 'skill should not save with a base value greater than 99' do
    @skill.base_value = 100
    assert_not @skill.save
  end

  test 'skill should not save with a base value that is not an integer' do
    @skill.base_value = 4.14
    assert_not @skill.save
  end

  test 'two skills should not save with the same name in the same game set' do
    assert @skill.save

    skill2 = Skill.new(name: @skill.name, base_value: 5, game_set: game_sets(:default))

    assert_not skill2.save
  end

  test 'two skills should save with the same name in different game sets' do
    assert @skill.save

    skill2 = Skill.new(name: @skill.name, base_value: 5, game_set: game_sets(:modern))

    assert skill2.save
  end
end
