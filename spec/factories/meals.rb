# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meal do
    name "MyString"
    date "2012-08-31"
    comment "MyText"
  end
end
