Rails.application.routes.draw do
  root "addresses#index"
  resources :addresses do
    member do
      get :update_weather
    end    
  end
end
