require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_url
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post invoices_url, params: { invoice: { city: @invoice.city, client_address: @invoice.client_address, client_city: @invoice.client_city, client_company: @invoice.client_company, client_country: @invoice.client_country, company_address: @invoice.company_address, company_name: @invoice.company_name, country: @invoice.country, due_date: @invoice.due_date, invoice_date: @invoice.invoice_date, invoice_number: @invoice.invoice_number, notes: @invoice.notes, person_name: @invoice.person_name, sales_tax: @invoice.sales_tax, sub_total: @invoice.sub_total, terms: @invoice.terms, title: @invoice.title, total: @invoice.total } }
    end

    assert_redirected_to invoice_path(Invoice.last)
  end

  test "should show invoice" do
    get invoice_url(@invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_url(@invoice)
    assert_response :success
  end

  test "should update invoice" do
    patch invoice_url(@invoice), params: { invoice: { city: @invoice.city, client_address: @invoice.client_address, client_city: @invoice.client_city, client_company: @invoice.client_company, client_country: @invoice.client_country, company_address: @invoice.company_address, company_name: @invoice.company_name, country: @invoice.country, due_date: @invoice.due_date, invoice_date: @invoice.invoice_date, invoice_number: @invoice.invoice_number, notes: @invoice.notes, person_name: @invoice.person_name, sales_tax: @invoice.sales_tax, sub_total: @invoice.sub_total, terms: @invoice.terms, title: @invoice.title, total: @invoice.total } }
    assert_redirected_to invoice_path(@invoice)
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete invoice_url(@invoice)
    end

    assert_redirected_to invoices_path
  end
end
