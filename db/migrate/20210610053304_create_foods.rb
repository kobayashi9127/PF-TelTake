class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :food_name
      t.integer :price
      t.text :Introduction
      t.string :food_imge_id
      t.integer :shop_id

      t.timestamps
    end
  end
end
