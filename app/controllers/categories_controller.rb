class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :authenticate_admin!

  expose(:categories)
  expose(:category)
  expose(:product) { Product.new }

  def index
  end

  def show

  end

  def new
    redirect_to new_user_session_path
  end

  def edit
  end

  def create

    self.category = Category.new(category_params)
    if category.save
      redirect_to new_user_session_path, notice: 'Category was successfully created.'
    else
      @request.env["devise.mapping"] = Devise.mappings[:user]
      render action: 'new'
    end
  end

  def update
    if category.update(category_params)
      redirect_to category, notice: 'Category was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def authenticate_admin!
      if current_user.admin?
        redirect_to(Category.last || root_path)
      else
        redirect_to new_user_session_path
      end
    end
end
