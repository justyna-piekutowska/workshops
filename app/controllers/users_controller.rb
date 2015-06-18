class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user_id: @user.id).last(5)
  end
end
