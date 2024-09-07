class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :author

  has_many :book_genres 
  has_many :genres, through: :book_genres

  validates :name, presence: true
  validates :year, presence: true
  validates :price, presence: true

  has_one_attached :image_new
  validates :image_new, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 2.megabytes, message: 'is too large. Maximum size allowed is 2MB.' }
  # mount_uploader :image, ImageUploader
end
