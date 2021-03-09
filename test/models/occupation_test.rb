require 'test_helper'

class OccupationTest < ActiveSupport::TestCase
  def setup
    @oc = Occupation.new(name: 'Advogado',
                         min_credit: 30,
                         max_credit: 70,
                         calc_type: 'EDUx4',
                         game_set: game_sets(:default))
  end

  test 'occupation saves correctly' do
    @oc.picks << picks(:interpessoal)
    @oc.skills << skills(:briga)
    assert @oc.save
  end

  test 'occupation should not save without name' do
    @oc.name = nil
    assert_not @oc.save
  end

  test 'occupation should not save without min credit' do
    @oc.min_credit = nil
    assert_not @oc.save
  end

  test 'occupation should not save without max credit' do
    @oc.max_credit = nil
    assert_not @oc.save
  end

  test 'occupation should not save without calc_type' do
    @oc.calc_type = nil
    assert_not @oc.save
  end

  test 'occupation should not save without a gameSet association' do
    @oc.game_set = nil
    assert_not @oc.save
  end

  test 'occupation should not save with a name less than 5 characters' do
    @oc.name = 'nan'
    assert_not @oc.save
  end

  test 'occupation should not save with a name more than 50 characters' do
    @oc.name = 'ANonfugaexpeditaautMolerumperspiciatisvoluptatemfug'
    assert_not @oc.save
  end

  test 'occupation should not save with min credit less than 1' do
    @oc.min_credit = 0
    assert_not @oc.save
  end

  test 'occupation should not save with min credit greather than 99' do
    @oc.min_credit = 100
    assert_not @oc.save
  end

  test 'occupation should not save with max credit less than 1' do
    @oc.max_credit = 0
    assert_not @oc.save
  end

  test 'occupation should not save with max credit greather than 99' do
    @oc.max_credit = 100
    assert_not @oc.save
  end

  test 'occupation should not save with min credit greather than max credit' do
    @oc.min_credit = 50
    @oc.max_credit = 20
    assert_not @oc.save
  end

  test 'occupation should not save with skill from different game set' do
    @oc.skills << skills(:computadores)
    assert_not @oc.save
  end

  test 'occupation should not save with picks from different game set' do
    @oc.picks << picks(:interpessoal_modern)
    assert_not @oc.save
  end

  test 'two occupations should not save with the same name in the same game set' do
    assert @oc.save

    oc2 = Occupation.new(name: @oc.name,
                         min_credit: 30,
                         max_credit: 70,
                         calc_type: 'EDUx4',
                         game_set: game_sets(:default))

    assert_not oc2.save
  end

  test 'two occupations should save with the same name in different game sets' do
    assert @oc.save

    oc2 = Occupation.new(name: @oc.name,
                         min_credit: 30,
                         max_credit: 70,
                         calc_type: 'EDUx4',
                         game_set: game_sets(:modern))

    assert oc2.save
  end
end
