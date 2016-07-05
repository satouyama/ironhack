class FixNameNameInCars < ActiveRecord::Migration[5.0]
  def change
    rename_column :cars, :name, :haha 
  end
end
