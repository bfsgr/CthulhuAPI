require 'test_helper'

class OccupationTest < ActiveSupport::TestCase

  test "occupation saves correctly" do
    oc = Occupation.new(name: "Advogado", creditLevel: [30,70], calcType: "EDUx4", game_set_id: 1)
    assert oc.save
  end
  
  test "occupation should not save without name" do
    oc = Occupation.new(creditLevel: [30,70], calcType: "EDUx4", game_set_id: 1)
    assert_not oc.save
  end
  
  test "occupation should not save without credit level" do
    oc = Occupation.new(name: "Advogado", calcType: "EDUx4", game_set_id: 1)
    assert_not oc.save
  end
  
  test "occupation should not save without calcType" do
    oc = Occupation.new(name: "Advogado", creditLevel: [30,70], game_set_id: 1)
    assert_not oc.save
  end
  
  test "occupation should not save without a gameSet association" do
    oc = Occupation.new(name: "Advogado", creditLevel: [30,70], calcType: "EDUx4")
    assert_not oc.save
  end
  
  test "occupation should not save with a name less than 5 characters" do
    oc = Occupation.new(name: "", creditLevel: [30,70], calcType: "EDUx4", game_set_id: 1)
    assert_not oc.save
  end
  
  test "occupation should not save with a name more than 50 characters" do
    oc = Occupation.new(
      name: 'ANonfugaexpeditaautMole'\
      'rumperspiciatisvoluptatemfug',
      creditLevel: [30,70],
      calcType: "EDUx4",
      game_set_id: 1)
      assert_not oc.save
    end
    
  test "occupation should not save with creditLevel length different than 2" do
    oc = Occupation.new(name: "Advogado", creditLevel: [30,70, 1], calcType: "EDUx4", game_set_id: 1)
    assert_not oc.save
  end
  
  test "occupation should not save with creditLevel with different types" do
    oc = Occupation.new(name: "Advogado", creditLevel: [30, nil], calcType: "EDUx4", game_set_id: 1)
    assert_not oc.save
  end
  
  test "occupation should not save with creditLevel not sorted" do
    oc = Occupation.new(name: "Advogado", creditLevel: [90, 10], calcType: "EDUx4", game_set_id: 1)
    assert_not oc.save
  end

  test "occupation should not save with creditLevel outside of 1..99 range" do
    oc = Occupation.new(name: "Advogado", creditLevel: [0, 102], calcType: "EDUx4", game_set_id: 1)
    assert_not oc.save
  end
  

end
