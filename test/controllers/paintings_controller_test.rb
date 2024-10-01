require "test_helper"

class PaintingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @painting = paintings(:one)
  end

  test "should get index" do
    get paintings_url
    assert_response :success
  end

  test "should get new" do
    get new_painting_url
    assert_response :success
  end

  test "should create painting" do
    assert_difference("Painting.count") do
      post paintings_url, params: { painting: { color: @painting.color } }
    end

    assert_redirected_to painting_url(Painting.last)
  end

  test "should show painting" do
    get painting_url(@painting)
    assert_response :success
  end

  test "should get edit" do
    get edit_painting_url(@painting)
    assert_response :success
  end

  test "should update painting" do
    patch painting_url(@painting), params: { painting: { color: @painting.color } }
    assert_redirected_to painting_url(@painting)
  end

  test "should destroy painting" do
    assert_difference("Painting.count", -1) do
      delete painting_url(@painting)
    end

    assert_redirected_to paintings_url
  end
end
