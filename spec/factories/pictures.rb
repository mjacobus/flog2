# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    title "MyString"
    descripton "MyText"
    picturable_type "MyString"
    picturable_id 1
    file ""
  end
end
