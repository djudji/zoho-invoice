class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.string :title
      t.string :company_name
      t.string :person_name
      t.string :company_address
      t.string :city
      t.string :country
      t.string :client_company
      t.string :client_address
      t.string :client_city
      t.string :client_country
      t.string :invoice_number
      t.date :invoice_date
      t.date :due_date
      t.text :notes
      t.text :terms
      t.decimal :sub_total, precision: 13, scale: 2
      t.float :sales_tax, precision: 5, scale: 2
      t.decimal :total, precision: 13, scale: 2

      t.timestamps
    end
  end
end
