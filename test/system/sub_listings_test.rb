require "application_system_test_case"

class SubListingsTest < ApplicationSystemTestCase
  setup do
    @sub_listing = sub_listings(:one)
  end

  test "visiting the index" do
    visit sub_listings_url
    assert_selector "h1", text: "Sub Listings"
  end

  test "creating a Sub listing" do
    visit sub_listings_url
    click_on "New Sub Listing"

    fill_in "Guest", with: @sub_listing.guest
    fill_in "Price", with: @sub_listing.price
    fill_in "Rooms", with: @sub_listing.rooms
    fill_in "Status", with: @sub_listing.status
    click_on "Create Sub listing"

    assert_text "Sub listing was successfully created"
    click_on "Back"
  end

  test "updating a Sub listing" do
    visit sub_listings_url
    click_on "Edit", match: :first

    fill_in "Guest", with: @sub_listing.guest
    fill_in "Price", with: @sub_listing.price
    fill_in "Rooms", with: @sub_listing.rooms
    fill_in "Status", with: @sub_listing.status
    click_on "Update Sub listing"

    assert_text "Sub listing was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub listing" do
    visit sub_listings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub listing was successfully destroyed"
  end
end
