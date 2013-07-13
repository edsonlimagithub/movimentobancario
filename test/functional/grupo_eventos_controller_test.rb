require 'test_helper'

class GrupoEventosControllerTest < ActionController::TestCase
  setup do
    @grupo_evento = grupo_eventos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grupo_eventos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grupo_evento" do
    assert_difference('GrupoEvento.count') do
      post :create, grupo_evento: { descricao: @grupo_evento.descricao }
    end

    assert_redirected_to grupo_evento_path(assigns(:grupo_evento))
  end

  test "should show grupo_evento" do
    get :show, id: @grupo_evento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grupo_evento
    assert_response :success
  end

  test "should update grupo_evento" do
    put :update, id: @grupo_evento, grupo_evento: { descricao: @grupo_evento.descricao }
    assert_redirected_to grupo_evento_path(assigns(:grupo_evento))
  end

  test "should destroy grupo_evento" do
    assert_difference('GrupoEvento.count', -1) do
      delete :destroy, id: @grupo_evento
    end

    assert_redirected_to grupo_eventos_path
  end
end
