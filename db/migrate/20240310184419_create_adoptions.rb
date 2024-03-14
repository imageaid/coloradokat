class CreateAdoptions < ActiveRecord::Migration[7.1]
  def change
    create_table :adoptions do |t|
      t.references :cat, null: false, foreign_key: true
      t.references :adopter, null: false, foreign_key: true
      t.date :adoption_date

      t.timestamps
    end
  end
end
