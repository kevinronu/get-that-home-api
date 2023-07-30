class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.integer :operation_type
      t.string :address
      t.string :city
      t.string :country
      t.integer :price
      t.integer :monthly_rent
      t.integer :maintenance
      t.integer :property_type
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :area
      t.boolean :pets_allowed
      t.text :about
      t.boolean :close, default: false
      t.integer :favorites_count
      t.integer :contacts_count
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
