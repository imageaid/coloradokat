class CreateCats < ActiveRecord::Migration[7.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :sex, default: 0
      t.boolean :adoptable, default: true
      t.date :intake_date

      t.timestamps
    end
  end
end
