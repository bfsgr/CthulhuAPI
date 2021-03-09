require 'test_helper'

class PickTest < ActiveSupport::TestCase
  def setup
    @pick = Pick.new(name: 'One interpersonal', number_of_picks: 1, pick_any: false, game_set: game_sets(:default))
  end

  test 'pick saves correctly' do
    @pick.skills << skills(:briga, :labia)
    assert @pick.save
  end

  test 'pick should not save without a name' do
    @pick.name = nil
    assert_not @pick.save
  end

  test 'pick should not save with a name less than 5 characters' do
    @pick.name = 'ana'
    assert_not @pick.save
  end

  test 'pick should not save with a name more than 50 characters' do
    @pick.name = 'ANonfugaexpeditaautMolerumperspiciatisvoluptatemfug'
    assert_not @pick.save
  end

  test 'pick should not save without number of picks' do
    @pick.number_of_picks = nil
    assert_not @pick.save
  end

  test 'pick should not save with number of picks less than one' do
    @pick.number_of_picks = 0
    assert_not @pick.save
  end

  test 'pick should not save with number of picks greater than 8' do
    @pick.number_of_picks = 9
    assert_not @pick.save
  end

  test 'pick should not save without pick any property' do
    @pick.pick_any = nil
    assert_not @pick.save
  end

  test 'pick should not save without a game set association' do
    @pick.game_set = nil
    assert_not @pick.save
  end

  test 'pick should not save if one of the skills is not from the same gameset' do
    @pick.skills << skills(:briga, :computadores)
    assert_not @pick.save
  end

  test 'pick should not save without any skills and pick_any false' do
    assert_not @pick.save
  end

  test 'pick should save without skills when pick_any is true' do
    @pick.pick_any = true
    assert @pick.save
  end

  test 'pick should not save with skills when pick_any is true' do
    @pick.pick_any = true
    @pick.skills << skills(:briga)
    assert_not @pick.save
  end

  test 'two picks should not save with the same name in the same game set' do
    @pick.pick_any = true
    assert @pick.save

    pick2 = Pick.new(name: @pick.name,
                     number_of_picks: 1,
                     pick_any: true,
                     game_set: game_sets(:default))

    assert_not pick2.save
  end

  test 'two picks should save with the same name in different game sets' do
    @pick.skills << skills(:labia, :persuasao, :charme, :intimidacao)

    assert @pick.save

    pick2 = Pick.new(name: @pick.name,
                     number_of_picks: 2,
                     pick_any: false,
                     game_set: game_sets(:modern))
    pick2.skills << skills(:labia_m, :persuasao_m, :charme_m, :intimidacao_m)

    assert pick2.save
  end
end
