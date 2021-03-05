require 'test_helper'

class SkillTest < ActiveSupport::TestCase
	test 'skill saves correctly' do
		skill = Skill.new(name: 'Medicina', baseValue: 5, game_set: game_sets(:default))
		assert skill.save
	end

	test 'skill should not save without a name' do
		skill = Skill.new(baseValue: 10, game_set: game_sets(:default))
		assert_not skill.save
	end

	test 'skill should not save without a game set association' do
		skill = Skill.new(name: 'Briga', baseValue: 10)
		assert_not skill.save
	end

	test 'skill should not save with name less than 4 characters' do
		skill = Skill.new(name: 'ana', baseValue: 10, game_set: game_sets(:default))
		assert_not skill.save
	end

	test 'skill should not save with name more than 50 characters' do
		skill = Skill.new(
			name: 'ANonfugaexpeditaautMole'\
						'rumperspiciatisvoluptatemfug',
			baseValue: 10, game_set: game_sets(:default)
		)
		assert_not skill.save
	end

	test 'skill should not save without a base value' do
		skill = Skill.new(name: '', game_set: game_sets(:default))
		assert_not skill.save
	end

	test 'skill should not save with a negative base value' do
		skill = Skill.new(name: 'Medicina', baseValue: -1, game_set: game_sets(:default))
		assert_not skill.save
	end

	test 'skill should not save with a base value greater than 99' do
		skill = Skill.new(name: 'Medicina', baseValue: 100, game_set: game_sets(:default))
		assert_not skill.save
	end

	test 'skill should not save with a base value that is not an integer' do
		skill = Skill.new(name: 'Medicina', baseValue: 4.12, game_set: game_sets(:default))
		assert_not skill.save
	end

	test 'two skills should not save with the same name in the same game set' do
		skill1 = Skill.new(name: 'Medicina', baseValue: 5, game_set: game_sets(:default))

		assert skill1.save

		skill2 = Skill.new(name: 'Medicina', baseValue: 5, game_set: game_sets(:default))

		assert_not skill2.save
	end

	test 'two skills should save with the same name in different game sets' do
		skill1 = Skill.new(name: 'Medicina', baseValue: 5, game_set: game_sets(:default))

		assert skill1.save

		skill2 = Skill.new(name: 'Medicina', baseValue: 5, game_set: game_sets(:modern))

		assert skill2.save
	end
end
