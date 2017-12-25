Rails.application.routes.draw do

  namespace :api  do
    namespace :v1 do
      resources :cars, only: [:show]
    end
  end

end
