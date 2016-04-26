FactoryGirl.define do
  factory :lead do
    sequence(:account) { |n| "#{n}" }
    name1 "Name 1"
    name2 "Name 2"
    address1 "Address 1"
    address2 "Address 2"
    city "City"
    state "State"
    zip "Zip Code"
    phone1 "Phone #1"
    phone2 "Phone #2"
    phone3 "Phone #3"
    source_code "Source Code"
  end
end
