require 'test_helper'

class TesteControllerTest < ActionController::TestCase
  test "should get teste_1" do
    get :teste_1
    assert_response :success
  end

end
