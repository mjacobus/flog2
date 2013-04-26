# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :album do
    title { generate(:title) }
    slug "MyString"
    body "MyText"
    category
  end
end
