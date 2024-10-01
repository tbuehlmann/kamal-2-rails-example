require "test_helper"

class PaintingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @painting = paintings(:one)
  end

  test "should get index" do
    get paintings_url
    assert_response :success
  end

  test "should create painting" do
    assert_difference("Painting.count") do
      post paintings_url
    end

    assert_redirected_to root_url
  end
end
