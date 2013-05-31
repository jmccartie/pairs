require 'test_helper'

class WorkOrdersControllerTest < ActionController::TestCase
  setup do
    @work_order = work_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_order" do
    assert_difference('WorkOrder.count') do
      post :create, work_order: { email: @work_order.email, first_name: @work_order.first_name, last_name: @work_order.last_name, phone: @work_order.phone, waiver_id: @work_order.waiver_id, wo_status_id: @work_order.wo_status_id, zone_id: @work_order.zone_id }
    end

    assert_redirected_to work_order_path(assigns(:work_order))
  end

  test "should show work_order" do
    get :show, id: @work_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_order
    assert_response :success
  end

  test "should update work_order" do
    put :update, id: @work_order, work_order: { email: @work_order.email, first_name: @work_order.first_name, last_name: @work_order.last_name, phone: @work_order.phone, waiver_id: @work_order.waiver_id, wo_status_id: @work_order.wo_status_id, zone_id: @work_order.zone_id }
    assert_redirected_to work_order_path(assigns(:work_order))
  end

  test "should destroy work_order" do
    assert_difference('WorkOrder.count', -1) do
      delete :destroy, id: @work_order
    end

    assert_redirected_to work_orders_path
  end
end
