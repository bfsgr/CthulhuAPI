require 'test_helper'

class GameSetsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'if the game set returns correctly' do
    sign_in users(:first)
    get '/api/game_sets', xhr: true
    assert_response :ok

    gs = GameSet.where(user: users(:first)).limit(20)
    actual = JSON.parse(@response.body)
    expected = []

    gs.each do |gameset|
      expected.push({ id: gameset.id,
                      name: gameset.name,
                      created_at: gameset.created_at,
                      updated_at: gameset.updated_at })
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

  test 'create a game set correctly' do
    sign_in users(:first)

    post '/api/game_sets', xhr: true, params: {
      game_set: { name: '1920' }
    }

    assert_response :created
  end

  test 'create a game set with errors' do
    sign_in users(:first)

    post '/api/game_sets', xhr: true, params: {
      game_set: {}
    }

    assert_response :unprocessable_entity

    gs = GameSet.new
    gs.user = users(:first)
    gs.valid? # => false

    actual = JSON.parse(@response.body)
    expected = { errors: gs.errors.to_hash }

    assert_equal expected.as_json, actual
  end

  test 'update game set corretly' do
    sign_in users(:first)

    patch game_set_path(game_sets(:default)), xhr: true, params: {
      game_set: {
        name: 'GameSet-1'
      }
    }

    assert_response :ok
  end

  test 'update fails due to not found resource' do
    sign_in users(:first)

    patch '/api/game_sets/89', xhr: true, params: {
      game_set: {
        name: 'Home-1'
      }
    }

    assert_response :not_found
  end

  test 'update fails due to validation errors' do
    sign_in users(:first)

    patch game_set_path(game_sets(:default)), xhr: true, params: {
      game_set: {
        name: '1'
      }
    }

    assert_response :unprocessable_entity

    gs = GameSet.new(name: '1', user: users(:first))
    gs.valid? # => false

    actual = JSON.parse(@response.body)
    expected = { errors: gs.errors.to_hash }

    assert_equal expected.as_json, actual
  end
end
