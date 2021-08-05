require "test_helper"

class FriendsRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friends_record = friends_records(:one)
  end

  test "should get index" do
    get friends_records_url
    assert_response :success
  end

  test "should get new" do
    get new_friends_record_url
    assert_response :success
  end

  test "should create friends_record" do
    assert_difference('FriendsRecord.count') do
      post friends_records_url, params: { friends_record: { email: @friends_record.email, first_name: @friends_record.first_name, last_name: @friends_record.last_name, phone: @friends_record.phone, twitter: @friends_record.twitter } }
    end

    assert_redirected_to friends_record_url(FriendsRecord.last)
  end

  test "should show friends_record" do
    get friends_record_url(@friends_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_friends_record_url(@friends_record)
    assert_response :success
  end

  test "should update friends_record" do
    patch friends_record_url(@friends_record), params: { friends_record: { email: @friends_record.email, first_name: @friends_record.first_name, last_name: @friends_record.last_name, phone: @friends_record.phone, twitter: @friends_record.twitter } }
    assert_redirected_to friends_record_url(@friends_record)
  end

  test "should destroy friends_record" do
    assert_difference('FriendsRecord.count', -1) do
      delete friends_record_url(@friends_record)
    end

    assert_redirected_to friends_records_url
  end
end
