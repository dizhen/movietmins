FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "example"
    password_confirmation "example"

    factory :admin do
      admin true
    end
  end

  factory :movie do
  	name "The Amazing Spider-Man 2"
  	length "140"
  	director "Marc Webb"
  	cast "Andrew Garfield, Emma Stone"
  	genre "Action"
  end

end