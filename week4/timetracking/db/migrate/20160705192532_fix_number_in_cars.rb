class FixNumberInCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :haha, :integer
    reversible do |direction|
      direction.up { Car.update_all(haha: 9) }
    end
  end
end
