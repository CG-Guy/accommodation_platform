require "application_system_test_case"

class InvoicesTest < ApplicationSystemTestCase
  setup do
    @invoice = invoices(:one)
  end

  test "visiting the index" do
    visit invoices_url
    assert_selector "h1", text: "Invoices"
  end

  test "creating a Invoice" do
    visit invoices_url
    click_on "New Invoice"

    fill_in "Composite", with: @invoice.composite_id
    fill_in "Composite type", with: @invoice.composite_type
    fill_in "Due date", with: @invoice.due_date
    check "Paid" if @invoice.paid
    fill_in "Payment type", with: @invoice.payment_type
    fill_in "Tax", with: @invoice.tax
    fill_in "User", with: @invoice.user_id
    click_on "Create Invoice"

    assert_text "Invoice was successfully created"
    click_on "Back"
  end

  test "updating a Invoice" do
    visit invoices_url
    click_on "Edit", match: :first

    fill_in "Composite", with: @invoice.composite_id
    fill_in "Composite type", with: @invoice.composite_type
    fill_in "Due date", with: @invoice.due_date
    check "Paid" if @invoice.paid
    fill_in "Payment type", with: @invoice.payment_type
    fill_in "Tax", with: @invoice.tax
    fill_in "User", with: @invoice.user_id
    click_on "Update Invoice"

    assert_text "Invoice was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoice" do
    visit invoices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoice was successfully destroyed"
  end
end
