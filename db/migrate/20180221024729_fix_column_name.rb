class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :listings, :tags, :amenities
  end
end
