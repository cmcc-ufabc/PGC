require 'test_helper'

class EvaluationsControllerTest < ActionController::TestCase
  setup do
    @evaluation = evaluations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evaluation" do
    assert_difference('Evaluation.count') do
      post :create, evaluation: { answer1: @evaluation.answer1, answer2: @evaluation.answer2, answer3: @evaluation.answer3, answer4: @evaluation.answer4, answer5: @evaluation.answer5, answer6: @evaluation.answer6, answer7: @evaluation.answer7 }
    end

    assert_redirected_to evaluation_path(assigns(:evaluation))
  end

  test "should show evaluation" do
    get :show, id: @evaluation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evaluation
    assert_response :success
  end

  test "should update evaluation" do
    put :update, id: @evaluation, evaluation: { answer1: @evaluation.answer1, answer2: @evaluation.answer2, answer3: @evaluation.answer3, answer4: @evaluation.answer4, answer5: @evaluation.answer5, answer6: @evaluation.answer6, answer7: @evaluation.answer7 }
    assert_redirected_to evaluation_path(assigns(:evaluation))
  end

  test "should destroy evaluation" do
    assert_difference('Evaluation.count', -1) do
      delete :destroy, id: @evaluation
    end

    assert_redirected_to evaluations_path
  end
end
