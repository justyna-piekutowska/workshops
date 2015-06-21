class UsersController < ApplicationController
  expose(:user)
  expose_decorated(:reviews, ancestor: :user) { user.reviews.last(5) }

  def show
  end
end
