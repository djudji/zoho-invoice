class RemoveInvoiceIdFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :invoice_id
  end
end
