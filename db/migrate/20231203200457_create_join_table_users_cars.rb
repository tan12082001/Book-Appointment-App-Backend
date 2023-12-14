class CreateJoinTableUsersCars < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :cars, table_name: :my_reservations do |t|
      t.date :date
      t.string :city

      t.timestamps
    end
  end
end
