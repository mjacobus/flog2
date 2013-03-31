class Album < ActiveRecord::Base
  attr_accessible :body, :slug, :title

  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validates :title, presence: true
end
