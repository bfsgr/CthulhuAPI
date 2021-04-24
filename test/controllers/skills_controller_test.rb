require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'list skills correctly' do
    sign_in users(:first)

    get game_set_skills_path(game_sets(:default)), xhr: true

    assert_response :ok

    actual = JSON.parse(@response.body)

    assert_equal game_sets(:default).skills.as_json, actual
  end

  test 'list skills should return not found' do
    sign_in users(:first)

    assert_raise ActiveRecord::RecordNotFound do
      get '/api/game_sets/1/skills', xhr: true
    end
  end

  test 'create skill correctly' do
    sign_in users(:first)

    post game_set_skills_path(game_sets(:default)), xhr: true, params: {
      skill: {
        name: 'Fight',
        base_value: 10
      }
    }

    assert_response :created
  end

  test 'create skill fails due to validation errors' do
    sign_in users(:first)

    post game_set_skills_path(game_sets(:default)), xhr: true, params: {
      skill: {
        name: '',
        base_value: 10
      }
    }

    assert_response :unprocessable_entity
  end

  test 'create skill fails due to not found game set' do
    sign_in users(:first)

    assert_raise ActiveRecord::RecordNotFound do
      post '/api/game_sets/1/skills', xhr: true, params: {
        skill: {
          name: 'Fight',
          base_value: 10
        }
      }
    end
  end
end
