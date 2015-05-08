FactoryGirl.define do
  factory :user do
    email "test@test.com"
    name "testie"
    password "password"
    password_confirmation "password"
  end
end