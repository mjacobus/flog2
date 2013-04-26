class Category < ActiveRecord::Base
  attr_accessible :description, :name, :slug
  has_many :albums

  before_destroy do |category|
    category.albums.count == 0
  end

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
end
