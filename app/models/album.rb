class Album < ActiveRecord::Base
  attr_accessible :body,
                  :category_id,
                  :slug,
                  :title
  belongs_to :category
  has_many :pictures, as: :picturable, order: :sequence

  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validates :title, presence: true
  validates :category, presence: true


  def self.published
    order('created_at DESC')
  end

  def self.filter(params = {})
    q = self

    params.each do |key, value|
      if key.present? && respond_to?("with_#{key}")
        q = self.send("with_#{key}", value)
      end
    end

    q
  end

  def self.with_category(slug)
    joins(:category).where('categories.slug = ?', slug)
  end

  def self.with_album(slug)
    with_slug(slug)
  end

  def self.with_slug(slug)
    where(slug: slug)
  end

  def self.find_one_by(params = {})
    record = filter(params).limit(1).first
    unless record
      raise ActiveRecord::RecordNotFound.new('No record matches the given criteria')
    end
    record
  end
end
