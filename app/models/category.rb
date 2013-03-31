class Category < ActiveRecord::Base
  attr_accessible :description, :name, :slug

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
end
