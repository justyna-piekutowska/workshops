require 'spec_helper'

describe ReviewsController do
  let(:category) {create(:category)}
  let(:product) {create(:product)}
  let(:valid_attributes) do
      {
        content: "It's a usefull product.",
        rating: 5
      }
  end
  describe  'POST create' do
    describe 'with valid params' do
      context 'user is signed in' do
        let(:user) {create(:user)}

        before do
          sign_in user
          controller.stub(:user_signed_in?).and_return(true)
          controller.stub(:current_user).and_return(user)
          controller.stub(:authenticate_user!).and_return(user)
        end

        it 'creates a new Review' do
          post :create, {review: valid_attributes, category_id: category.to_param, product_id: product.to_param}
          review = Review.last
          expect(review.user).to eq(user)
        end
      end
    end
  end
end
