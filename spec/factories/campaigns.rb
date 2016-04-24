FactoryGirl.define do
  factory :campaign do
    sequence(:name) { |n| "Campaign #{n}" }
    year DateTime.now.year
    code "MyString"
    callback_phone "MyString"
    notes "MyText"
    available true
  end
end
