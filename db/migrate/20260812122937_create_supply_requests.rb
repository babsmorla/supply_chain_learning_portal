class CreateSupplyRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :supply_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :item_name
      t.integer :quantity
      t.text :reason
      t.string :status

      t.timestamps
    end
  end
end
