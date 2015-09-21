class UsersController < ApplicationController

  before_action :authenticate_user!

  expose(:user)
  expose(:product)
  expose_decorated(:user)
  expose_decorated(:reviews, ancestor: :user) { user.reviews.last(5) }

  def show
  end

  def my_products
    @products = Product.all.where(user_id: params[:id])
  end

  def my_product_reviews
    product = Product.where(user_id: params[:id])
    if product.any?
      product.each do |product|
        @reviews = Review.where(product_id: product.id)
      end
    else
      @reviews = []
    end
  end
end
