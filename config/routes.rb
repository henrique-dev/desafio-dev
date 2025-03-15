Rails.application.routes.draw do
  unless Rails.env.production?
    mount Rswag::Ui::Engine => '/api-docs'
    mount Rswag::Api::Engine => '/api-docs'
  end

  get 'up' => 'rails/health#show', as: :rails_health_check

  get 'service-worker' => 'rails/pwa#service_worker', as: :pwa_service_worker
  get 'manifest' => 'rails/pwa#manifest', as: :pwa_manifest

  root 'importers#new'

  get '/auth/google_oauth2/callback', to: 'omniauth_callbacks#google_oauth2'
  get '/auth/failure', to: 'omniauth_callbacks#failure'

  get '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'

  resources :importers, except: %i[edit update destroy]
  resources :stores, only: %i[index show] do
    resources :movements, only: %i[index show]
  end

  namespace :api do
    namespace :v1 do
      resources :importers, only: %i[index show create update destroy]
      resources :stores, only: %i[index show create update destroy] do
        resources :movements, only: %i[index show create update destroy]
      end
    end
  end
end
