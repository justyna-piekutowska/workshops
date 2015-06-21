class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.last(5)
  end
end
