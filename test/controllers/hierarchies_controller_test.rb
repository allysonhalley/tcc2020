require 'test_helper'

class HierarchiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hierarchy = hierarchies(:one)
  end

  test "should get index" do
    get hierarchies_url
    assert_response :success
  end

  test "should get new" do
    get new_hierarchy_url
    assert_response :success
  end

  test "should create hierarchy" do
    assert_difference('Hierarchy.count') do
      post hierarchies_url, params: { hierarchy: { acronym: @hierarchy.acronym, name: @hierarchy.name, rank: @hierarchy.rank } }
    end

    assert_redirected_to hierarchy_url(Hierarchy.last)
  end

  test "should show hierarchy" do
    get hierarchy_url(@hierarchy)
    assert_response :success
  end

  test "should get edit" do
    get edit_hierarchy_url(@hierarchy)
    assert_response :success
  end

  test "should update hierarchy" do
    patch hierarchy_url(@hierarchy), params: { hierarchy: { acronym: @hierarchy.acronym, name: @hierarchy.name, rank: @hierarchy.rank } }
    assert_redirected_to hierarchy_url(@hierarchy)
  end

  test "should destroy hierarchy" do
    assert_difference('Hierarchy.count', -1) do
      delete hierarchy_url(@hierarchy)
    end

    assert_redirected_to hierarchies_url
  end
end
