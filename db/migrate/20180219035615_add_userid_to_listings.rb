class AddUseridToListings < ActiveRecord::Migration[5.1]
  def change
  		add_reference :listings, :users, foreign_key: true, index: true
  end
end
