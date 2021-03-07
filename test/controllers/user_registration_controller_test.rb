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
end
