class Page < ActiveRecord::Base
  attr_accessible :body, :slug, :title
  validates :body, presence: true
  validates :slug, presence: true, uniqueness: {case_sensitive: false}
  validates :title, presence: true
end
