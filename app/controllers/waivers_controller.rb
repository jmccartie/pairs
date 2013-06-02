class WaiversController < ApplicationController
  def index
  end

  def new
    @work_order = WorkOrder.find(params[:work_order_id])
    @waiver = @work_order.build_waiver
    @waiver.contact = @waiver.build_contact
    @waiver.contact.address = @waiver.contact.build_address
  end

  def create
    @work_order = WorkOrder.find(params[:work_order_id])
    @work_order.build_waiver(params[:waiver])
    
    if @work_order.save
      redirect_to @work_order
    end
  end

  def edit
  end
  
  def show
    @waiver = WorkOrder.find(params[:work_order_id]).waiver
  end

  def update
  end
end
