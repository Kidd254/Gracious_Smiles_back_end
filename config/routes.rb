Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'v1/users' }
  namespace :v1 do
    resources :users, only: [:create] do
      collection do
        post 'search_by_email'
      end
    end
  end
end
