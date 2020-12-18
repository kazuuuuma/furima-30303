class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|

      t.timestamps
      t.string :postalcode,      null: false
      t.integer :prefecture_id,  null: false
      t.string :municipality,    null: false
      t.string :address,         null: false
      t.string :build
      t.string :phonenumber,     null: false
      t.references :order,       foreign_key: true
    end
  end
end
