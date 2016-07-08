class AddCounterColumnsToConcerts < ActiveRecord::Migration[5.0]
  def change
    add_column :concerts, :comments_count, :integer
  end
end
