class AddIndexUserPropertyToContact < ActiveRecord::Migration[7.0]
  def change
    add_index :contacts, [:user_id, :property_id], unique: true
  end
end
