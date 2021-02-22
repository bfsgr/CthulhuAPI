require 'test_helper'

class PickTest < ActiveSupport::TestCase

  test "pick saves correctly" do
    pick = Pick.new(name: "One interpersonal", numberOfPicks: 1, pickAny: false, game_set: game_sets(:default))
    pick.skills << skills(:briga)
    pick.skills << skills(:labia)
    assert pick.save
  end

  test "pick should not save without a name" do
    pick = Pick.new(numberOfPicks: 1, pickAny: false, game_set: game_sets(:default))
    assert_not pick.save
  end

  test "pick should not save with a name less than 5 characters" do
    pick = Pick.new(name: "", numberOfPicks: 1, pickAny: false, game_set: game_sets(:default))
    assert_not pick.save
  end

  test "pick should not save with a name more than 50 characters" do
    pick = Pick.new(
      name: 'ANonfugaexpeditaautMole'\
      'rumperspiciatisvoluptatemfug',
      numberOfPicks: 1,
      pickAny: false,
       game_set: game_sets(:default))
    assert_not pick.save
  end
  
  test "pick should not save without number of picks" do
    pick = Pick.new(name: "One interpersonal", pickAny: false, game_set: game_sets(:default))
    assert_not pick.save
  end

  test "pick should not save with number of picks less than one" do
    pick = Pick.new(name: "Zero interpersonal", numberOfPicks: 0, pickAny: false, game_set: game_sets(:default))
    assert_not pick.save
  end
  
  test "pick should not save with number of picks greater than 8" do
    pick = Pick.new(name: "9 sciences", numberOfPicks: 9, pickAny: false, game_set: game_sets(:default))
    assert_not pick.save
  end

  test "pick should not save without pick any property" do
    pick = Pick.new(name: "One interpersonal", numberOfPicks: 1, game_set: game_sets(:default))
    assert_not pick.save
  end

  test "pick should not save without a game set association" do
    pick = Pick.new(name: "One interpersonal", numberOfPicks: 1, pickAny: false)
    assert_not pick.save
  end

  test "pick should not save if one of the skills is not from the same gameset" do
    pick = Pick.new(name: "One interpersonal", numberOfPicks: 1, pickAny: false, game_set: game_sets(:default))
    pick.skills << skills(:briga)
    pick.skills << skills(:computadores)
    assert_not pick.save
  end

  test "pick should not save without any skills and pickAny false" do
    pick = Pick.new(name: "One interpersonal", numberOfPicks: 1, pickAny: false, game_set: game_sets(:default))
    assert_not pick.save
  end

  test "pick should save without skills when pickAny is true" do
    pick = Pick.new(name: "Any one", numberOfPicks: 1, pickAny: true, game_set: game_sets(:default))
    assert pick.save
  end

  test "pick should not save with skills when pickAny is true" do
    pick = Pick.new(name: "Any one", numberOfPicks: 1, pickAny: true, game_set: game_sets(:default))
    pick.skills << skills(:briga)
    assert_not pick.save
  end
end
