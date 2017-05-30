class AddInvoiceRefToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :invoice, index: true, foreign_key: true
  end
end
