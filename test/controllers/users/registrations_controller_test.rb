require 'test_helper'

class UserRegistrationControllerTest < ActionDispatch::IntegrationTest
  test 'user register correctly' do
    post '/api/user', params: {
      user: {
        username: 'josh_anderson',
        email: 'josh@anderson.com',
        password: 'qwerty1234'
      }
    }
    assert_response :created
  end

  test 'user does not register due to validation errors' do
    post '/api/user', params: {
      user: {
        email: 'josh@anderson.com',
        password: 'qwerty1234'
      }
    }
    assert_response :unprocessable_entity
  end
end
