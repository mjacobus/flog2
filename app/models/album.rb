class Album < ActiveRecord::Base
  attr_accessible :body, :slug, :title
  belongs_to :category

  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validates :title, presence: true
end
