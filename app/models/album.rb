class Album < ActiveRecord::Base
  attr_accessible :body,
                  :category_id,
                  :slug,
                  :secret,
                  :title,
                  :token

  belongs_to :category
  has_many :pictures, as: :picturable, order: :sequence, dependent: :destroy

  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validates :title, presence: true
  validates :category, presence: true
  validates :token, presence: { if: :secret?  }

  scope :public, ->{ where(secret: false)  }
  scope :published, ->{ order('created_at DESC') }
  scope :with_category, ->(slug){ joins(:category).where('categories.slug = ?', slug) }
  scope :with_album, ->(slug){ with_slug(slug) }
  scope :with_slug, ->(slug) { where(slug: slug) }


  def self.filter(params = {})
    q = self

    params.each do |key, value|
      if key.present? && q.respond_to?("with_#{key}")
        q = self.send("with_#{key}", value)
      end
    end

    q
  end

  def self.find_one_by(params = {})
    record = filter(params).limit(1).first
    unless record
      raise ActiveRecord::RecordNotFound.new('No record matches the given criteria')
    end
    record
  end

  def token_matches?(token)
    self.token == token
  end
end
