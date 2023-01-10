class Film < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fans , through: :favorites, source: :user

  validates :name, :released_on, :duration, presence: true
  validates :description, length: { minimum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :image_file_name, format: {
    with: /\w+\.(jpg|png)\z/i,
    message: "must be a JPG or PNG image"
  }

  RATINGS = %w(G PG PG-13 R NC-17)
  validates :rating, inclusion: { in: RATINGS }

  def self.released
    where("released_on < ?", Time.now).order("released_on desc")
  end

  def average_stars
    reviews.average(:stars) || 0.0
  end

end
