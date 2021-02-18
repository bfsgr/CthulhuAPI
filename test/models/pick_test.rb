require 'test_helper'

class PickTest < ActiveSupport::TestCase

  test "pick saves correctly" do
    pick = Pick.new(name: "One interpersonal", numberOfPicks: 1, pickAny: false, game_set_id: 1)
    assert pick.save
  end

  test "pick should not save without a name" do
    pick = Pick.new(numberOfPicks: 1, pickAny: false, game_set_id: 1)
    assert_not pick.save
  end

  test "pick should not save with a name less than 5 characters" do
    pick = Pick.new(name: "", numberOfPicks: 1, pickAny: false, game_set_id: 1)
    assert_not pick.save
  end

  test "pick should not save with a name more than 50 characters" do
    pick = Pick.new(
      name: 'ANonfugaexpeditaautMole'\
      'rumperspiciatisvoluptatemfug',
      numberOfPicks: 1,
      pickAny: false,
      game_set_id: 1)
    assert_not pick.save
  end
  
  test "pick should not save without number of picks" do
    pick = Pick.new(name: "One interpersonal", pickAny: false, game_set_id: 1)
    assert_not pick.save
  end

  test "pick should not save with number of picks less than one" do
    pick = Pick.new(name: "Zero interpersonal", numberOfPicks: 0, pickAny: false, game_set_id: 1)
    assert_not pick.save
  end
  
  test "pick should not save with number of picks greater than 8" do
    pick = Pick.new(name: "9 sciences", numberOfPicks: 9, pickAny: false, game_set_id: 1)
    assert_not pick.save
  end

  test "pick should not save without pick any property" do
    pick = Pick.new(name: "One interpersonal", numberOfPicks: 1, game_set_id: 1)
    assert_not pick.save
  end

  test "pick should not save without a game set association" do
    pick = Pick.new(name: "One interpersonal", numberOfPicks: 1, pickAny: false)
    assert_not pick.save
  end

end
