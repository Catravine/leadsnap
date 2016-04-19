FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "password"
    password_confirmation "password"
    role 0
    fullname "Some Guy"
    phone "(555) 555-1234"
    approved true
  end
end
