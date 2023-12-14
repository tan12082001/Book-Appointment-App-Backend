class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :description
      t.string :pricePerHr
      t.integer :seating_capacity
      t.integer :rental_duration

      t.timestamps
    end
  end
end
