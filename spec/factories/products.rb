FactoryGirl.define do
  factory :product do
    title "MyString"
    description "MyText"
    price 1.5
    user
    category { Category.first || create(:category) }
  end
end
