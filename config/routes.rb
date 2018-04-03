Rails.application.routes.draw do
  root "static#index"

  namespace :api do
    namespace :v1 do
      resources :colors, only: [:show]
      resources :pallettes, only: [:index]
    end
  end

  get "*path" => "static#index"
end
