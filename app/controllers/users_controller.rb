class UsersController < ApplicationController
  expose(:user)
  expose(:product)
  expose_decorated(:user)
  expose_decorated(:reviews, ancestor: :user) { user.reviews.last(5) }

  def show
  end

  def my_products
    @products = Product.all.where(user_id: current_user.id)
  end

  def my_product_reviews
  end
end
