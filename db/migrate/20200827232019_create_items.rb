class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image,                           null: false
      t.string :name,                          null: false
      t.text :description,                     null: false
      t.integer :category_id,                  null: false
      t.integer :status_id,                    null: false
      t.integer :delivery_change_burden_id,    null: false
      t.integer :prefecture_id,                null: false
      t.integer :days_up_to_delivery_id,       null: false
      t.integer :price_id,                     null: false
      t.references :user,                   null: false,foreign_key: true
      t.timestamps
    end
  end
end
