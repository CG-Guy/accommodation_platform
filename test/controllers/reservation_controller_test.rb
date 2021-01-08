require 'test_helper'

class ReservationControllerTest < ActionDispatch::IntegrationTest
  test "should get check_in:datetime" do
    get reservation_check_in:datetime_url
    assert_response :success
  end

  test "should get check_out:datetime" do
    get reservation_check_out:datetime_url
    assert_response :success
  end

  test "should get user:references" do
    get reservation_user:references_url
    assert_response :success
  end

  test "should get composite:references{polymorphic}" do
    get reservation_composite:references{polymorphic}_url
    assert_response :success
  end

end
