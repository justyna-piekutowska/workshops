Rails.application.routes.draw do
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  root 'categories#index'

  devise_for :users

  resources :users, only: :show
  get "users/:id/my_products" => "users#my_products", as: :my_products
  get "users/:id/my_product_reviews" => "users#my_product_reviews", as: :my_product_reviews

end
