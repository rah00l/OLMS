require 'test_helper'

class BorrowsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:borrows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create borrow" do
    assert_difference('Borrow.count') do
      post :create, :borrow => { }
    end

    assert_redirected_to borrow_path(assigns(:borrow))
  end

  test "should show borrow" do
    get :show, :id => borrows(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => borrows(:one).to_param
    assert_response :success
  end

  test "should update borrow" do
    put :update, :id => borrows(:one).to_param, :borrow => { }
    assert_redirected_to borrow_path(assigns(:borrow))
  end

  test "should destroy borrow" do
    assert_difference('Borrow.count', -1) do
      delete :destroy, :id => borrows(:one).to_param
    end

    assert_redirected_to borrows_path
  end
end
