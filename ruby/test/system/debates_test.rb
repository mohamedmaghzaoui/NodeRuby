require "application_system_test_case"

class DebatesTest < ApplicationSystemTestCase
  setup do
    @debate = debates(:one)
  end

  test "visiting the index" do
    visit debates_url
    assert_selector "h1", text: "Debates"
  end

  test "should create debate" do
    visit debates_url
    click_on "New debate"

    fill_in "Text", with: @debate.text
    fill_in "Title", with: @debate.title
    fill_in "User", with: @debate.user
    click_on "Create Debate"

    assert_text "Debate was successfully created"
    click_on "Back"
  end

  test "should update Debate" do
    visit debate_url(@debate)
    click_on "Edit this debate", match: :first

    fill_in "Text", with: @debate.text
    fill_in "Title", with: @debate.title
    fill_in "User", with: @debate.user
    click_on "Update Debate"

    assert_text "Debate was successfully updated"
    click_on "Back"
  end

  test "should destroy Debate" do
    visit debate_url(@debate)
    click_on "Destroy this debate", match: :first

    assert_text "Debate was successfully destroyed"
  end
end
