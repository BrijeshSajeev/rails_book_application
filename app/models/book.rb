class Book < ApplicationRecord
  validates :name, presence: true
  validates :year, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :price, presence: true
end
