class WaiversController < ApplicationController
  def index
  end

  def new
    @need = Need.find(params[:need_id])
    @waiver = @need.build_waiver
    @waiver.contact = @waiver.build_contact
    @waiver.contact.address = @waiver.contact.build_address
  end

  def create
    @need = Need.find(params[:need_id])
    @need.build_waiver(params[:waiver])

    if @need.save
      redirect_to @need
    end
  end

  def edit
  end

  def show
    @waiver = Need.find(params[:need_id]).waiver
  end

  def update
  end
end
