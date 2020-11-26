class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :product_name,    null: false
      t.text :profile,           null: false
      t.integer :category_id,    null: false
      t.integer :condition_id,   null: false
      t.integer :prefecture_id,  null: false
      t.integer :charge_id,      null: false
      t.integer :days_to_ship_id,null: false
      t.string :price,           null: false
      t.references :user,        foreign_key: true
    end
  end
end
