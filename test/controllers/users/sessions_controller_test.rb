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
end
