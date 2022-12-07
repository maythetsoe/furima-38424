class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false
      t.integer :detail_category_id, null: false
      t.integer :detail_commodity_condition_id, null: false
      t.integer :delivery_burden_id, null: false
      t.integer :region_id, null: false
      t.integer :days_to_ship_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
