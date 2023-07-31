class AddIndexUserPropertyToFavorite < ActiveRecord::Migration[7.0]
  def change
    add_index :favorites, [:user_id, :property_id], unique: true
  end
end
