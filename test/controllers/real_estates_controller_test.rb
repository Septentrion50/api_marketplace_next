require "test_helper"

class RealEstatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @real_estate = real_estates(:one)
  end

  test "should get index" do
    get real_estates_url, as: :json
    assert_response :success
  end

  test "should create real_estate" do
    assert_difference('RealEstate.count') do
      post real_estates_url, params: { real_estate: { description: @real_estate.description, location: @real_estate.location, price: @real_estate.price, title: @real_estate.title } }, as: :json
    end

    assert_response 201
  end

  test "should show real_estate" do
    get real_estate_url(@real_estate), as: :json
    assert_response :success
  end

  test "should update real_estate" do
    patch real_estate_url(@real_estate), params: { real_estate: { description: @real_estate.description, location: @real_estate.location, price: @real_estate.price, title: @real_estate.title } }, as: :json
    assert_response 200
  end

  test "should destroy real_estate" do
    assert_difference('RealEstate.count', -1) do
      delete real_estate_url(@real_estate), as: :json
    end

    assert_response 204
  end
end
