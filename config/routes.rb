Rails.application.routes.draw do
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  root 'categories#index'

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
  end
end
