class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :author

  validates :name, presence: true
  validates :year, presence: true

  validates :genre, presence: true
  validates :price, presence: true

  has_one_attached :image_new
  # mount_uploader :image, ImageUploader
end
