class Film < ApplicationRecord
  before_save :set_slug

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fans , through: :favorites, source: :user
  has_many :characterizations, dependent: :destroy
  has_many :genres, through: :characterizations
  has_one_attached :main_image

  validates :name, presence: true, uniqueness: true
  validates :released_on, :duration, presence: true
  validates :description, length: { minimum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validate :acceptable_image


  RATINGS = %w(G PG PG-13 R NC-17)
  validates :rating, inclusion: { in: RATINGS }

  scope :released,-> { where("released_on < ?", Time.now).order("released_on desc") }
  scope :upcoming,-> { where("released_on > ?", Time.now).order("released_on desc") }
  scope :recent, -> (max=5) { released.limit(max) }
  scope :hits, -> { released.where("price >= 300000000").order(price: :desc) }
  scope :flops, -> { released.where("price < 22500000").order(price: :asc) }

  def average_stars
    reviews.average(:stars) || 0.0
  end


  def to_param
    slug
  end


  private

  def acceptable_image
    return unless main_image.attached?

    unless main_image.blob.byte_size <= 1.megabyte
      errors.add(:main_image, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(main_image.content_type)
      errors.add(:main_image, "must be a JPEG or PNG")
    end
  end

  def set_slug
    self.slug = name.parameterize
  end

end
