class RemoveBidderIdFromBids < ActiveRecord::Migration[5.0]
  def change
    remove_column :bids, :bidder_id
  end
end
