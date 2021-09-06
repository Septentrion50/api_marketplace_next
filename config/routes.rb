

Rails.application.routes.draw do
  
  default_url_options :host => ENV['API_URL_DEV']

  namespace :api, defaults: { format: :json } do
    resources :users, only: %w[show] do
      resources :real_estates, only: [:index]
    end
  end

  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }

  resources :real_estates

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
