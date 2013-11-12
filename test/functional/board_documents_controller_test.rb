require 'test_helper'

class BoardDocumentsControllerTest < ActionController::TestCase
  setup do
    @board_document = board_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:board_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create board_document" do
    assert_difference('BoardDocument.count') do
      post :create, board_document: { approval: @board_document.approval, date: @board_document.date, location: @board_document.location, mark: @board_document.mark, project_id: @board_document.project_id, time: @board_document.time }
    end

    assert_redirected_to board_document_path(assigns(:board_document))
  end

  test "should show board_document" do
    get :show, id: @board_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @board_document
    assert_response :success
  end

  test "should update board_document" do
    put :update, id: @board_document, board_document: { approval: @board_document.approval, date: @board_document.date, location: @board_document.location, mark: @board_document.mark, project_id: @board_document.project_id, time: @board_document.time }
    assert_redirected_to board_document_path(assigns(:board_document))
  end

  test "should destroy board_document" do
    assert_difference('BoardDocument.count', -1) do
      delete :destroy, id: @board_document
    end

    assert_redirected_to board_documents_path
  end
end
