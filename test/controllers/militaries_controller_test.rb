require 'test_helper'

class MilitariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @military = militaries(:one)
  end

  test "should get index" do
    get militaries_url
    assert_response :success
  end

  test "should get new" do
    get new_military_url
    assert_response :success
  end

  test "should create military" do
    assert_difference('Military.count') do
      post militaries_url, params: { military: { blood_factor: @military.blood_factor, blood_type: @military.blood_type, born_date: @military.born_date, cpf: @military.cpf, digital_factor: @military.digital_factor, father_name: @military.father_name, firearm: @military.firearm, hierarchy_id: @military.hierarchy_id, identification: @military.identification, mother_name: @military.mother_name, name: @military.name, naturalness: @military.naturalness, registration: @military.registration, vote_number: @military.vote_number, vote_section: @military.vote_section, vote_zone: @military.vote_zone } }
    end

    assert_redirected_to military_url(Military.last)
  end

  test "should show military" do
    get military_url(@military)
    assert_response :success
  end

  test "should get edit" do
    get edit_military_url(@military)
    assert_response :success
  end

  test "should update military" do
    patch military_url(@military), params: { military: { blood_factor: @military.blood_factor, blood_type: @military.blood_type, born_date: @military.born_date, cpf: @military.cpf, digital_factor: @military.digital_factor, father_name: @military.father_name, firearm: @military.firearm, hierarchy_id: @military.hierarchy_id, identification: @military.identification, mother_name: @military.mother_name, name: @military.name, naturalness: @military.naturalness, registration: @military.registration, vote_number: @military.vote_number, vote_section: @military.vote_section, vote_zone: @military.vote_zone } }
    assert_redirected_to military_url(@military)
  end

  test "should destroy military" do
    assert_difference('Military.count', -1) do
      delete military_url(@military)
    end

    assert_redirected_to militaries_url
  end
end
