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
      expected.push({ id: gameset.id, name: gameset.name })
    end

    assert_equal expected.as_json, actual
  end

  test 'show details of any given game set' do
    sign_in users(:first)
    get '/api/game_sets', xhr: true
    assert_response :ok

    data = JSON.parse(@response.body)
    identifier = data.first['id']

    sign_in users(:first)
    get "/api/game_sets/#{identifier}", xhr: true
    assert_response :ok

    gs = GameSet.find(identifier)
    actual = JSON.parse(@response.body)

    expected = { name: gs.name,
                 occupations: gs.occupations.length,
                 picks: gs.picks.length,
                 skills: gs.skills.length,
                 created_at: gs.created_at,
                 updated_at: gs.updated_at }

    assert_equal expected.as_json, actual
  end
end
