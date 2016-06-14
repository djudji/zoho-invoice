class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text :description
      t.integer :quantity
      t.decimal :rate, precision: 13, scale: 2
      t.decimal :amount, precision: 13, scale: 2

      t.timestamps
    end
  end
end
