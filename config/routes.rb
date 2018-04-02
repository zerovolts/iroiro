Rails.application.routes.draw do
  root "static#index"

  namespace :api do
    namespace :v1 do

    end
  end

  get "*path" => "static#index"
end
