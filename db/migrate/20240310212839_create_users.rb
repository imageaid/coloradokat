class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.integer :role, default: 0

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :last_name
    add_index :users, :first_name
  end
end
