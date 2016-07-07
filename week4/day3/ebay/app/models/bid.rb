class Bid < ApplicationRecord
  belongs_to :product

  validates :amount, numericality: true
  # validates :bidder_email, uniqueness:true

  # , if: :same_amount?

  # def same_amount?


  # end

  
end
