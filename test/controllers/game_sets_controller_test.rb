require 'test_helper'

class GameSetsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'if the game set returns correctly' do
    sign_in users(:first)
    get '/api/game_sets', xhr: true
    assert_response :ok
  end
end
