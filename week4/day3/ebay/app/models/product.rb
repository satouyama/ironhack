class Product < ApplicationRecord

  belongs_to :user
  has_many :bids


  validates :minimum, presence:true
end
