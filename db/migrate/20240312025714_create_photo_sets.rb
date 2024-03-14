class CreatePhotoSets < ActiveRecord::Migration[7.1]
  def change
    create_table :photo_sets do |t|
      t.string :name
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
