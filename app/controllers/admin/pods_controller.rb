class Admin::PodsController < ApplicationController
  before_filter :require_login
  load_and_authorize_resource
  
  def index
  end

  def new
  end
  
  def create
    respond_to do |format|
      if @pod.save
        format.html { redirect_to admin_pods_url, notice: 'Pod was successfully created.' }
        format.json { render json: @pod, status: :created, location: @pod }
      else
        format.html { render action: "new" }
        format.json { render json: @pod.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @pod = Pod.find(params[:id])

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
end