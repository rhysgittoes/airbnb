class AddToReservations < ActiveRecord::Migration[5.1]
  def change
   add_column :reservations, :payed, :boolean, default: false
  end
end
