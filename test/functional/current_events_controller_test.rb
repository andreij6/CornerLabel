require 'test_helper'

class CurrentEventsControllerTest < ActionController::TestCase
  setup do
    @current_event = current_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:current_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create current_event" do
    assert_difference('CurrentEvent.count') do
      post :create, current_event: { body: @current_event.body, title: @current_event.title }
    end

    assert_redirected_to current_event_path(assigns(:current_event))
  end

  test "should show current_event" do
    get :show, id: @current_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @current_event
    assert_response :success
  end

  test "should update current_event" do
    put :update, id: @current_event, current_event: { body: @current_event.body, title: @current_event.title }
    assert_redirected_to current_event_path(assigns(:current_event))
  end

  test "should destroy current_event" do
    assert_difference('CurrentEvent.count', -1) do
      delete :destroy, id: @current_event
    end

    assert_redirected_to current_events_path
  end
end
