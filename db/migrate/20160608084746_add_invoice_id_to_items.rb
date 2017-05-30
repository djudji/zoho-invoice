class AddInvoiceIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :invoice_id, :integer, index: true
  end
end
