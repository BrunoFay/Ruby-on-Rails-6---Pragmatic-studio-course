class Genre < ApplicationRecord
  validates :name , uniqueness: true, presence: true
  has_many :characterizations, dependent: :destroy
  has_many :films, through: :characterizations
end
