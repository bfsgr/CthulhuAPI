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

  test 'query a skill by name' do
    sign_in users(:first)

    get "#{game_set_skills_path(game_sets(:default))}?q=labia", xhr: true

    assert_response :ok

    actual = JSON.parse(@response.body)

    assert_equal [skills(:labia)].as_json, actual
  end
end
