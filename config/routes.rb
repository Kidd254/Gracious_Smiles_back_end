Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'v1/api/users' }

  namespace :v1 do
    namespace :api do
      resources :users, only: [:create] do
        collection do
          post 'search_by_email'
        end
      end
    end
  end
end