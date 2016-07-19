class AddProductIdToBids < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :product_id, :integer
  end
end
