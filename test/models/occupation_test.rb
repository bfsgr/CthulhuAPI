require 'test_helper'

class OccupationTest < ActiveSupport::TestCase
	test 'occupation saves correctly' do
		oc = Occupation.new(name: 'Advogado', min_credit: 30, max_credit: 70, calcType: 'EDUx4',
																						game_set: game_sets(:default))
		oc.picks << picks(:interpessoal)
		oc.skills << skills(:briga)
		assert oc.save
	end

	test 'occupation should not save without name' do
		oc = Occupation.new(min_credit: 30, max_credit: 70, calcType: 'EDUx4', game_set: game_sets(:default))
		assert_not oc.save
	end

	test 'occupation should not save without credit level' do
		oc = Occupation.new(name: 'Advogado', calcType: 'EDUx4', game_set: game_sets(:default))
		assert_not oc.save
	end

	test 'occupation should not save without calcType' do
		oc = Occupation.new(name: 'Advogado', min_credit: 30, max_credit: 70, game_set: game_sets(:default))
		assert_not oc.save
	end

	test 'occupation should not save without a gameSet association' do
		oc = Occupation.new(name: 'Advogado', min_credit: 30, max_credit: 70, calcType: 'EDUx4')
		assert_not oc.save
	end
	bundler
	test 'occupation should not save with a name less than 5 characters' do
		oc = Occupation.new(name: '', min_credit: 30, max_credit: 70, calcType: 'EDUx4', game_set: game_sets(:default))
		assert_not oc.save
	end

	test 'occupation should not save with a name more than 50 characters' do
		oc = Occupation.new(
			name: 'ANonfugaexpeditaautMole'\
						'rumperspiciatisvoluptatemfug',
			min_credit: 30,
			max_credit: 70,
			calcType: 'EDUx4',
			game_set: game_sets(:default)
		)
		assert_not oc.save
	end

	test 'occupation should not save with min credit less than 1' do
		oc = Occupation.new(name: 'Advogado', min_credit: 0, max_credit: 50, calcType: 'EDUx4',
																						game_set: game_sets(:default))
		assert_not oc.save
	end

	test 'occupation should not save with min credit greather than 99' do
		oc = Occupation.new(name: 'Advogado', min_credit: 102, max_credit: 50, calcType: 'EDUx4',
																						game_set: game_sets(:default))
		assert_not oc.save
	end

	test 'occupation should not save with max credit less than 1' do
		oc = Occupation.new(name: 'Advogado', min_credit: 20, max_credit: 0, calcType: 'EDUx4',
																						game_set: game_sets(:default))
		assert_not oc.save
	end

	test 'occupation should not save with max credit greather than 99' do
		oc = Occupation.new(name: 'Advogado', min_credit: 10, max_credit: 100, calcType: 'EDUx4',
																						game_set: game_sets(:default))
		assert_not oc.save
	end

	test 'occupation should not save with min credit greather than max credit' do
		oc = Occupation.new(name: 'Advogado', min_credit: 50, max_credit: 20, calcType: 'EDUx4',
																						game_set: game_sets(:default))
		assert_not oc.save
	end

	test 'occupation should not save with skill from different game set' do
		oc = Occupation.new(name: 'Advogado', min_credit: 30, max_credit: 70, calcType: 'EDUx4',
																						game_set: game_sets(:default))
		oc.skills << skills(:computadores)
		assert_not oc.save
	end

	test 'occupation should not save with picks from different game set' do
		oc = Occupation.new(name: 'Advogado', min_credit: 30, max_credit: 70, calcType: 'EDUx4',
																						game_set: game_sets(:default))
		oc.picks << picks(:interpessoal_modern)
		assert_not oc.save
	end

	test 'two occupations should not save with the same name in the same game set' do
		oc1 = Occupation.new(name: 'Advogado', min_credit: 30, max_credit: 70, calcType: 'EDUx4',
																							game_set: game_sets(:default))

		assert oc1.save

		oc2 = Occupation.new(name: 'Advogado', min_credit: 30, max_credit: 70, calcType: 'EDUx4',
																							game_set: game_sets(:default))

		assert_not oc2.save
	end

	test 'two occupations should save with the same name in different game sets' do
		oc1 = Occupation.new(name: 'Advogado', min_credit: 30, max_credit: 70, calcType: 'EDUx4',
																							game_set: game_sets(:default))

		assert oc1.save

		oc2 = Occupation.new(name: 'Advogado', min_credit: 30, max_credit: 70, calcType: 'EDUx4',
																							game_set: game_sets(:modern))

		assert oc2.save
	end
end
