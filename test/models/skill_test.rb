require 'test_helper'

class SkillTest < ActiveSupport::TestCase

  test "skill saves correctly" do
    skill = Skill.new(name: "Medicina", baseValue: 5)
    assert skill.save
  end

  test "skill should not save without a name" do
    skill = Skill.new(baseValue: 10)
    assert_not skill.save
  end

  test "skill should not save with name less than 4 characters" do
    skill = Skill.new(name: "ana", baseValue: 10)
    assert_not skill.save
  end

  test "skill should not save with name more than 50 characters" do
    skill = Skill.new(
      name: 'ANonfugaexpeditaautMole'\
      'rumperspiciatisvoluptatemfug',
      baseValue: 10)
    assert_not skill.save
  end

  test "skill should not save without a base value" do
    skill = Skill.new(name: "")
    assert_not skill.save
  end

  test "skill should not save with a negative base value" do
    skill = Skill.new(name: "Medicina", baseValue: -1)
    assert_not skill.save
  end

  test "skill should not save with a base value greater than 99" do
    skill = Skill.new(name: "Medicina", baseValue: 100)
    assert_not skill.save
  end

  test "skill should not save with a base value that is not an integer" do
    skill = Skill.new(name: "Medicina", baseValue: 4.12)
    assert_not skill.save
  end
  
end
