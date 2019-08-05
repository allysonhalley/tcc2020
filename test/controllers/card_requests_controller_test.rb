require 'test_helper'

class CardRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_request = card_requests(:one)
  end

  test "should get index" do
    get card_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_card_request_url
    assert_response :success
  end

  test "should create card_request" do
    assert_difference('CardRequest.count') do
      post card_requests_url, params: { card_request: { canceled: @card_request.canceled, document_reference: @card_request.document_reference, military_registration: @card_request.military_registration, reason_request: @card_request.reason_request } }
    end

    assert_redirected_to card_request_url(CardRequest.last)
  end

  test "should show card_request" do
    get card_request_url(@card_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_request_url(@card_request)
    assert_response :success
  end

  test "should update card_request" do
    patch card_request_url(@card_request), params: { card_request: { canceled: @card_request.canceled, document_reference: @card_request.document_reference, military_registration: @card_request.military_registration, reason_request: @card_request.reason_request } }
    assert_redirected_to card_request_url(@card_request)
  end

  test "should destroy card_request" do
    assert_difference('CardRequest.count', -1) do
      delete card_request_url(@card_request)
    end

    assert_redirected_to card_requests_url
  end
end
