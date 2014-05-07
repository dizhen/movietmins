FactoryGirl.define do
  factory :user do
    name     "example admin"
    email    "example@example.com"
    password "example"
    password_confirmation "example"
  end
end