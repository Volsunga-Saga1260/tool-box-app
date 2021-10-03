class CreateGadgets < ActiveRecord::Migration[5.2]
  def change
    create_table :gadgets do |t|
      t.string :name
      t.text :text
      t.integer :price
      t.string :image_id

      t.timestamps
    end
  end
end
