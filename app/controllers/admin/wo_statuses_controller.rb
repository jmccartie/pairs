class Admin::WoStatusesController < ApplicationController
  
  def index
    @wo_statuses = WoStatus.all

    respond_to do |format|
      format.html
      format.json { render json: @wo_statuses }
    end
  end

  def show
    @wo_status = WoStatus.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @wo_status }
    end
  end

  def new
    @wo_status = WoStatus.new

    respond_to do |format|
      format.html
      format.json { render json: @wo_status }
    end
  end

  def edit
    @wo_status = WoStatus.find(params[:id])
  end

  def create
    @wo_status = WoStatus.new(params[:wo_status])

    respond_to do |format|
      if @wo_status.save
        format.html { redirect_to admin_wo_statuses_url, notice: 'WoStatus was successfully created.' }
        format.json { render json: @wo_status, status: :created, location: @wo_status }
      else
        format.html { render action: "new" }
        format.json { render json: @wo_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @wo_status = WoStatus.find(params[:id])

    respond_to do |format|
      if @wo_status.update_attributes(params[:wo_status])
        format.html { redirect_to admin_wo_statuses_url, notice: 'WoStatus was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wo_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wo_status = WoStatus.find(params[:id])
    @wo_status.destroy

    respond_to do |format|
      format.html { redirect_to admin_wo_statuses_url }
      format.json { head :no_content }
    end
  end
end
