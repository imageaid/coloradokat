class CreatePages < ActiveRecord::Migration[7.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :link_name
      t.string :heading
      t.boolean :landing_page, default: false
      t.boolean :main_nav, default: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
