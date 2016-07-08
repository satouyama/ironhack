class Concert < ApplicationRecord
  validates :artist, presence:true
  validates :venue, presence: true
  validates :city, presence: true
  validates :date, presence: true
  validates :price, presence: true
  validates :description, presence: true


  has_many :comments
end
