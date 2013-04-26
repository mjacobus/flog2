# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name { generate(:name) }
    slug { generate(:slug) }
    description "MyText"
  end
end
