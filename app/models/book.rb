class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :author

  has_many :book_genres 
  has_many :genres, through: :book_genres

  validates :name, presence: true
  validates :year, presence: true
  validates :price, presence: true
end
