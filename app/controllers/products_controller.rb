class ProductsController < ApplicationController
  expose(:category)
  expose(:products) { category.products }
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)
  expose_decorated(:user) {product.user}

  before_filter :authenticate_user!
  before_filter :another_user!, only: [:update, :edit, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.product = Product.new(product_params)

    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if self.product.update(product_params)
      redirect_to category_product_path(category, product), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(category), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end
  def another_user!
    unless product.user == current_user
      redirect_to(category_product_url(category, product), flash: {error: 'You are not allowed to edit this product.'})
    end
  end
end
