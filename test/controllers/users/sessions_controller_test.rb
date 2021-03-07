require 'test_helper'

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  test 'user creates a session correctly' do
    post '/api/user/sign_in', params: {
      user: {
        username: users(:first).username,
        password: 'qwerty123'
      }
    }
    assert_response :created
  end

  test 'user does not sign in due to invalid password' do
    post '/api/user/sign_in', params: {
      user: {
        username: users(:first).username,
        password: '12345678'
      }
    }
    assert_response :unauthorized

    assert_equal ({ error: 'Invalid Username or password.' }.as_json), JSON.parse(@response.body)
  end
end
