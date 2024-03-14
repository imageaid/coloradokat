class CreateAdopters < ActiveRecord::Migration[7.1]
  def change
    create_table :adopters do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :postal

      t.timestamps
    end
  end
end
