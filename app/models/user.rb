class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :image_new
  validates :image_new, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 2.megabytes, message: 'is too large. Maximum size allowed is 2MB.' }
  # mount_uploader :image, ImageUploader

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
