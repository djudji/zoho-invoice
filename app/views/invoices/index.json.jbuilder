json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :title, :company_name, :person_name, :company_address, :city, :country, :client_company, :client_address, :client_city, :client_country, :invoice_number, :invoice_date, :due_date, :notes, :terms, :sub_total, :sales_tax, :total
  json.url invoice_url(invoice, format: :json)
end
