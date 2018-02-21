class AddTagsToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :tags, :string
  end
end
