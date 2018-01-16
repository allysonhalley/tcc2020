require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
  end

  test "should get index" do
    get cards_url
    assert_response :success
  end

  test "should get new" do
    get new_card_url
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post cards_url, params: { card: { blood_factor: @card.blood_factor, blood_type: @card.blood_type, born_date: @card.born_date, card_number: @card.card_number, card_request_id: @card.card_request_id, card_status_id: @card.card_status_id, carry_weapon: @card.carry_weapon, cpf: @card.cpf, digital_factor: @card.digital_factor, expire_date: @card.expire_date, father_name: @card.father_name, hierarchy: @card.hierarchy, identification: @card.identification, mother_name: @card.mother_name, name: @card.name, naturalness: @card.naturalness, print_date: @card.print_date, print_locale: @card.print_locale, registration: @card.registration, returned_card: @card.returned_card, vote_number: @card.vote_number, vote_section: @card.vote_section, vote_zone: @card.vote_zone } }
    end

    assert_redirected_to card_url(Card.last)
  end

  test "should show card" do
    get card_url(@card)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_url(@card)
    assert_response :success
  end

  test "should update card" do
    patch card_url(@card), params: { card: { blood_factor: @card.blood_factor, blood_type: @card.blood_type, born_date: @card.born_date, card_number: @card.card_number, card_request_id: @card.card_request_id, card_status_id: @card.card_status_id, carry_weapon: @card.carry_weapon, cpf: @card.cpf, digital_factor: @card.digital_factor, expire_date: @card.expire_date, father_name: @card.father_name, hierarchy: @card.hierarchy, identification: @card.identification, mother_name: @card.mother_name, name: @card.name, naturalness: @card.naturalness, print_date: @card.print_date, print_locale: @card.print_locale, registration: @card.registration, returned_card: @card.returned_card, vote_number: @card.vote_number, vote_section: @card.vote_section, vote_zone: @card.vote_zone } }
    assert_redirected_to card_url(@card)
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete card_url(@card)
    end

    assert_redirected_to cards_url
  end
end
