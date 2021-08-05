require "application_system_test_case"

class FriendsRecordsTest < ApplicationSystemTestCase
  setup do
    @friends_record = friends_records(:one)
  end

  test "visiting the index" do
    visit friends_records_url
    assert_selector "h1", text: "Friends Records"
  end

  test "creating a Friends record" do
    visit friends_records_url
    click_on "New Friends Record"

    fill_in "Email", with: @friends_record.email
    fill_in "First name", with: @friends_record.first_name
    fill_in "Last name", with: @friends_record.last_name
    fill_in "Phone", with: @friends_record.phone
    fill_in "Twitter", with: @friends_record.twitter
    click_on "Create Friends record"

    assert_text "Friends record was successfully created"
    click_on "Back"
  end

  test "updating a Friends record" do
    visit friends_records_url
    click_on "Edit", match: :first

    fill_in "Email", with: @friends_record.email
    fill_in "First name", with: @friends_record.first_name
    fill_in "Last name", with: @friends_record.last_name
    fill_in "Phone", with: @friends_record.phone
    fill_in "Twitter", with: @friends_record.twitter
    click_on "Update Friends record"

    assert_text "Friends record was successfully updated"
    click_on "Back"
  end

  test "destroying a Friends record" do
    visit friends_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Friends record was successfully destroyed"
  end
end
