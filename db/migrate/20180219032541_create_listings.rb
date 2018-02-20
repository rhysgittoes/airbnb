class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|

    t.string :name, null: false
	t.string :property_type, limit: 128, null: false
	t.integer :room_number
	t.integer :bed_number
	t.integer :guest_number
	t.integer :price, null: false
	t.string :description, limit:1024
    end
  end
end
