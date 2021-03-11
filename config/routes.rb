Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api do
    devise_for :users, path: 'user', defaults: { format: :json }

    resources :occupations
    resources :skills
    resources :picks
    resources :game_sets
  end
end
