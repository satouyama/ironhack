class ChangeHahaTypeInCars < ActiveRecord::Migration[5.0]
  def change

    change_column :cars, :haha, :integer
  end
end
