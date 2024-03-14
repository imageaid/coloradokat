require "application_system_test_case"

class PhotoSetsTest < ApplicationSystemTestCase
  setup do
    @photo_set = photo_sets(:one)
  end

  test "visiting the index" do
    visit photo_sets_url
    assert_selector "h1", text: "Photo sets"
  end

  test "should create photo set" do
    visit photo_sets_url
    click_on "New photo set"

    check "Active" if @photo_set.active
    fill_in "Name", with: @photo_set.name
    click_on "Create Photo set"

    assert_text "Photo set was successfully created"
    click_on "Back"
  end

  test "should update Photo set" do
    visit photo_set_url(@photo_set)
    click_on "Edit this photo set", match: :first

    check "Active" if @photo_set.active
    fill_in "Name", with: @photo_set.name
    click_on "Update Photo set"

    assert_text "Photo set was successfully updated"
    click_on "Back"
  end

  test "should destroy Photo set" do
    visit photo_set_url(@photo_set)
    click_on "Destroy this photo set", match: :first

    assert_text "Photo set was successfully destroyed"
  end
end
