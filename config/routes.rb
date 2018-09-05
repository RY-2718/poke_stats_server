Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1, format: 'json' do
      get 'auth/google_oauth2/callback', to: 'token#create'
      get 'hello', to: 'token#hello'
      resources 'users', only: [:show, :update, :destroy]
    end
  end
end
