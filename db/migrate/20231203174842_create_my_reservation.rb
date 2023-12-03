class CreateMyReservation < ActiveRecord::Migration[7.1]
  def change
    create_table :my_reservations do |t|
      

      t.timestamps
    end
  end
end
