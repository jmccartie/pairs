class Admin::PodsController < ApplicationController
  before_filter :require_login
  load_and_authorize_resource
  
  def index
  end

  def new
    @pod.build_address
  end
  
  def create
    respond_to do |format|
      if @pod.save
        format.html { redirect_to admin_pods_url, notice: 'Pod was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def show
  end
  
  def edit
    @pod.address.nil? ? @pod.build_address : ""
  end
  
  def update
    respond_to do |format|
      if @pod.update_attributes(params[:pod])
        format.html { redirect_to [:admin, @pod], notice: 'Work order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pod.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @pod.destroy
    redirect_to admin_pods_url
  end
  
  def import
    Pod.import(params[:file])
    # @file = params[:file]
    redirect_to admin_pods_url
  end
end
