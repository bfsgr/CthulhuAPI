require 'test_helper'

class GameSetsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'if the game set returns correctly' do
    sign_in users(:first)
    get '/api/game_sets', xhr: true
    assert_response :ok

    gs = GameSet.where(user: users(:first))
    actual = JSON.parse(@response.body)
    expected = []

    gs.each do |gameset|
      expected.push({ name: gameset.name })
    end

    assert_equal expected.as_json, actual
  end
end
