require 'test_helper'

class PrazosControllerTest < ActionController::TestCase
  setup do
    @prazo = prazos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prazos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prazo" do
    assert_difference('Prazo.count') do
      post :create, prazo: { descricao: @prazo.descricao, funcao: @prazo.funcao }
    end

    assert_redirected_to prazo_path(assigns(:prazo))
  end

  test "should show prazo" do
    get :show, id: @prazo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prazo
    assert_response :success
  end

  test "should update prazo" do
    put :update, id: @prazo, prazo: { descricao: @prazo.descricao, funcao: @prazo.funcao }
    assert_redirected_to prazo_path(assigns(:prazo))
  end

  test "should destroy prazo" do
    assert_difference('Prazo.count', -1) do
      delete :destroy, id: @prazo
    end

    assert_redirected_to prazos_path
  end
end
