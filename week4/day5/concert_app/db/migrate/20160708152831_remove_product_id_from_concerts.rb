class RemoveProductIdFromConcerts < ActiveRecord::Migration[5.0]
  def change
    remove_column :concerts, :product_id, :integer
  end
end
