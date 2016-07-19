class AddBidderEmailToBids < ActiveRecord::Migration[5.0]
  def change
      add_column :bids, :bidder_email, :string
  end
end
