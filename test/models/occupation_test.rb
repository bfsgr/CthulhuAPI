require 'test_helper'

class OccupationTest < ActiveSupport::TestCase

  test "occupation saves correctly" do
    oc = Occupation.new(name: "Advogado", creditLevel: [30,70], calcType: "EDUx4")
    assert oc.save
  end
  
end
