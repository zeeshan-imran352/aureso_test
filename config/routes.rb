Rails.application.routes.draw do

  namespace :api  do
    scope module: :v1 do
      resources :cars, only: [:show]
    end
  end

end
