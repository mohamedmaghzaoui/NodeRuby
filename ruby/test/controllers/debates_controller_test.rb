require "test_helper"

class DebatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @debate = debates(:one)
  end

  test "should get index" do
    get debates_url
    assert_response :success
  end

  test "should get new" do
    get new_debate_url
    assert_response :success
  end

  test "should create debate" do
    assert_difference("Debate.count") do
      post debates_url, params: { debate: { text: @debate.text, title: @debate.title, user: @debate.user } }
    end

    assert_redirected_to debate_url(Debate.last)
  end

  test "should show debate" do
    get debate_url(@debate)
    assert_response :success
  end

  test "should get edit" do
    get edit_debate_url(@debate)
    assert_response :success
  end

  test "should update debate" do
    patch debate_url(@debate), params: { debate: { text: @debate.text, title: @debate.title, user: @debate.user } }
    assert_redirected_to debate_url(@debate)
  end

  test "should destroy debate" do
    assert_difference("Debate.count", -1) do
      delete debate_url(@debate)
    end

    assert_redirected_to debates_url
  end
end
