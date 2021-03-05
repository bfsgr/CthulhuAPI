Rails.application.routes.draw do
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	scope :api do
		devise_for :users, path: 'user', defaults: { format: :json }, controllers: {
			registrations: 'users/registrations',
			sessions: 'users/sessions'
		}

		resources :occupations
		resources :skills
		resources :picks
	end
end
