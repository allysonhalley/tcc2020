require 'test_helper'

class DiscardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discard = discards(:one)
  end

  test "should get index" do
    get discards_url
    assert_response :success
  end

  test "should get new" do
    get new_discard_url
    assert_response :success
  end

  test "should create discard" do
    assert_difference('Discard.count') do
      post discards_url, params: { discard: { card_number: @discard.card_number, card_request_id: @discard.card_request_id, reason_discard: @discard.reason_discard } }
    end

    assert_redirected_to discard_url(Discard.last)
  end

  test "should show discard" do
    get discard_url(@discard)
    assert_response :success
  end

  test "should get edit" do
    get edit_discard_url(@discard)
    assert_response :success
  end

  test "should update discard" do
    patch discard_url(@discard), params: { discard: { card_number: @discard.card_number, card_request_id: @discard.card_request_id, reason_discard: @discard.reason_discard } }
    assert_redirected_to discard_url(@discard)
  end

  test "should destroy discard" do
    assert_difference('Discard.count', -1) do
      delete discard_url(@discard)
    end

    assert_redirected_to discards_url
  end
end
