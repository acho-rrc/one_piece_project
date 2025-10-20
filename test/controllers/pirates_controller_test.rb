require "test_helper"

class PiratesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pirate = pirates(:one)
  end

  test "should get index" do
    get pirates_url
    assert_response :success
  end

  test "should get new" do
    get new_pirate_url
    assert_response :success
  end

  test "should create pirate" do
    assert_difference("Pirate.count") do
      post pirates_url, params: { pirate: { bounty: @pirate.bounty, crew_id: @pirate.crew_id, devil_fruit: @pirate.devil_fruit, name: @pirate.name, quote: @pirate.quote, role: @pirate.role } }
    end

    assert_redirected_to pirate_url(Pirate.last)
  end

  test "should show pirate" do
    get pirate_url(@pirate)
    assert_response :success
  end

  test "should get edit" do
    get edit_pirate_url(@pirate)
    assert_response :success
  end

  test "should update pirate" do
    patch pirate_url(@pirate), params: { pirate: { bounty: @pirate.bounty, crew_id: @pirate.crew_id, devil_fruit: @pirate.devil_fruit, name: @pirate.name, quote: @pirate.quote, role: @pirate.role } }
    assert_redirected_to pirate_url(@pirate)
  end

  test "should destroy pirate" do
    assert_difference("Pirate.count", -1) do
      delete pirate_url(@pirate)
    end

    assert_redirected_to pirates_url
  end
end
