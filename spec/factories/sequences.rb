FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  sequence :slug do |n|
    "slug-#{n}"
  end
end

FactoryGirl.define do
  sequence :name do |n|
    "The Name #{n}"
  end
end

FactoryGirl.define do
  sequence :title do |n|
    "Title #{n}"
  end
end

FactoryGirl.define do
  sequence :code do |n|
    "code-#{'%04d' %n}"
  end
end

# FactoryGirl.generate :email
# FactoryGirl.generate :slug

# increases the number of email
# FactoryGirl.next(:email)