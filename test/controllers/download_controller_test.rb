require 'test_helper'

class DownloadControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get pdf" do
    get :pdf
    assert_response :success
  end

end
