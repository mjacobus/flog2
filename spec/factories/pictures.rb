# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    title "MyString"
    description "MyText"
    picturable_type "Album"
    picturable_id { create(:album).id }
  end
end
