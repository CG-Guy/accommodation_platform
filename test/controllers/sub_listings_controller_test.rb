require 'test_helper'

class SubListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_listing = sub_listings(:one)
  end

  test "should get index" do
    get sub_listings_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_listing_url
    assert_response :success
  end

  test "should create sub_listing" do
    assert_difference('SubListing.count') do
      post sub_listings_url, params: { sub_listing: { guest: @sub_listing.guest, price: @sub_listing.price, rooms: @sub_listing.rooms, status: @sub_listing.status } }
    end

    assert_redirected_to sub_listing_url(SubListing.last)
  end

  test "should show sub_listing" do
    get sub_listing_url(@sub_listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_listing_url(@sub_listing)
    assert_response :success
  end

  test "should update sub_listing" do
    patch sub_listing_url(@sub_listing), params: { sub_listing: { guest: @sub_listing.guest, price: @sub_listing.price, rooms: @sub_listing.rooms, status: @sub_listing.status } }
    assert_redirected_to sub_listing_url(@sub_listing)
  end

  test "should destroy sub_listing" do
    assert_difference('SubListing.count', -1) do
      delete sub_listing_url(@sub_listing)
    end

    assert_redirected_to sub_listings_url
  end
end
