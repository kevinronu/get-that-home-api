class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :role
      t.integer :properties_count, default: 0
      t.string :password_digest
      t.string :token

      t.timestamps
    end
    add_index :users, :token, unique: true
  end
end
