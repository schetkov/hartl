FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password Faker::Internet.password(8)
    password_confirmation { |user| user.password }
  end
end
