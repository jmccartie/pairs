class ResourcesController < ApplicationController
  before_filter :require_login
  load_and_authorize_resource :good
  
  def index
    @goods = Good.all
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new(params[:good])
    
    respond_to do |format|
      if @good.save
        format.html { redirect_to @good, notice: 'Resource was successfully created.' }
        format.json { render json: @good, status: :created, location: @good }
      else
        format.html { render action: "new" }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @good = Good.find(params[:id])
  end

  def show
    @good = Good.find(params[:id])
  end

  def update
    @good = Good.find(params[:id])
    @good.update_attributes(params[:good])
    respond_to do |format|
      if @good.save
        format.html { redirect_to @good, notice: 'Resource was successfully created.' }
        format.json { render json: @good, status: :created, location: @good }
      else
        format.html { render action: "new" }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end
end
