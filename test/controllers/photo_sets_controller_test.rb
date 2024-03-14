require "test_helper"

class PhotoSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photo_set = photo_sets(:one)
  end

  test "should get index" do
    get photo_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_photo_set_url
    assert_response :success
  end

  test "should create photo_set" do
    assert_difference("PhotoSet.count") do
      post photo_sets_url, params: { photo_set: { active: @photo_set.active, name: @photo_set.name } }
    end

    assert_redirected_to photo_set_url(PhotoSet.last)
  end

  test "should show photo_set" do
    get photo_set_url(@photo_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_photo_set_url(@photo_set)
    assert_response :success
  end

  test "should update photo_set" do
    patch photo_set_url(@photo_set), params: { photo_set: { active: @photo_set.active, name: @photo_set.name } }
    assert_redirected_to photo_set_url(@photo_set)
  end

  test "should destroy photo_set" do
    assert_difference("PhotoSet.count", -1) do
      delete photo_set_url(@photo_set)
    end

    assert_redirected_to photo_sets_url
  end
end
