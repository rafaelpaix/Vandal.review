require 'test_helper'

class EstampasControllerTest < ActionController::TestCase
  setup do
    @estampa = estampas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estampas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estampa" do
    assert_difference('Estampa.count') do
      post :create, estampa: { criador: @estampa.criador, description: @estampa.description, rating: @estampa.rating, title: @estampa.title }
    end

    assert_redirected_to estampa_path(assigns(:estampa))
  end

  test "should show estampa" do
    get :show, id: @estampa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estampa
    assert_response :success
  end

  test "should update estampa" do
    patch :update, id: @estampa, estampa: { criador: @estampa.criador, description: @estampa.description, rating: @estampa.rating, title: @estampa.title }
    assert_redirected_to estampa_path(assigns(:estampa))
  end

  test "should destroy estampa" do
    assert_difference('Estampa.count', -1) do
      delete :destroy, id: @estampa
    end

    assert_redirected_to estampas_path
  end
end
