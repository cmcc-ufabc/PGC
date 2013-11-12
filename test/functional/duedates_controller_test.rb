require 'test_helper'

class DuedatesControllerTest < ActionController::TestCase
  setup do
    @duedate = duedates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:duedates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create duedate" do
    assert_difference('Duedate.count') do
      post :create, duedate: { board_end: @duedate.board_end, board_start: @duedate.board_start, evaluation_end: @duedate.evaluation_end, evaluation_start: @duedate.evaluation_start, orientation_end: @duedate.orientation_end, orientation_start: @duedate.orientation_start }
    end

    assert_redirected_to duedate_path(assigns(:duedate))
  end

  test "should show duedate" do
    get :show, id: @duedate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @duedate
    assert_response :success
  end

  test "should update duedate" do
    put :update, id: @duedate, duedate: { board_end: @duedate.board_end, board_start: @duedate.board_start, evaluation_end: @duedate.evaluation_end, evaluation_start: @duedate.evaluation_start, orientation_end: @duedate.orientation_end, orientation_start: @duedate.orientation_start }
    assert_redirected_to duedate_path(assigns(:duedate))
  end

  test "should destroy duedate" do
    assert_difference('Duedate.count', -1) do
      delete :destroy, id: @duedate
    end

    assert_redirected_to duedates_path
  end
end
