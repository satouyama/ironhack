class RemoveBidderEmailFromBids < ActiveRecord::Migration[5.0]
  def change
    remove_column :bids, :bidder_email
  end
end
