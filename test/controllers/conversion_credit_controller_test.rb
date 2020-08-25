require 'test_helper'

class ConversionCreditControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conversion_credit_index_url
    assert_response :success
  end

end
