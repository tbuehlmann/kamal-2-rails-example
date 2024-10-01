require "application_system_test_case"

class PaintingsTest < ApplicationSystemTestCase
  setup do
    @painting = paintings(:one)
  end

  test "visiting the index" do
    visit paintings_url
    assert_selector "h1", text: "Paintings"
  end

  test "should create painting" do
    visit paintings_url
    click_on "New painting"

    fill_in "Color", with: @painting.color
    click_on "Create Painting"

    assert_text "Painting was successfully created"
    click_on "Back"
  end

  test "should update Painting" do
    visit painting_url(@painting)
    click_on "Edit this painting", match: :first

    fill_in "Color", with: @painting.color
    click_on "Update Painting"

    assert_text "Painting was successfully updated"
    click_on "Back"
  end

  test "should destroy Painting" do
    visit painting_url(@painting)
    click_on "Destroy this painting", match: :first

    assert_text "Painting was successfully destroyed"
  end
end
